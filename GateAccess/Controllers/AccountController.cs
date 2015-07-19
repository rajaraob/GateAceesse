using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using GateAccess.Models;
using GateAccess.Models.DAL;
using System.Data;
using GateAccess.Models.Helper;
using GateAccess.Controllers.ControllerBase;
using System.Text;
using System.IO;

namespace GateAccess.Controllers
{

    public class AccountController : Controller
    {
        private AccountModel accountModel;
        private AccountDAL accountDAL;      

        //
        // GET: /Account/LogOn         
        [AnonymousOnly]
        public ActionResult LogOn(String ReturnUrl)
        {
            ModelState.Clear();

            if (Session["LogOut"] != null)
            {
                ViewBag.LogOut = "LogOut Successfull.";
                Session.Remove("LogOut");
            }
            if (Request.IsAjaxRequest())
                return PartialView("_LogOn");
            else
                return View("LogOn");
        }


        //
        // POST: /Account/LogOn
        [HttpPost]
        [AnonymousOnly]
        public ActionResult LogOn()
        {
            var logOn = new AccountModel();
            var valid = TryUpdateModel(logOn);

            if (valid)
            {
                accountModel = new AccountModel();
                accountModel.UserName = logOn.UserName;
                accountModel.Password = logOn.Password;
                //accountModel.RememberMe = logon.RememberMe;

                accountDAL = new AccountDAL();
                DataTable userdetails = accountDAL.CheckLoginCridentials(accountModel);

                if (userdetails.Rows.Count > 0)
                {
                    String LoginStatus;

                    if (!String.IsNullOrEmpty(userdetails.Rows[0]["LoginStatus"].ToString()) == true)
                    {
                        LoginStatus = userdetails.Rows[0]["LoginStatus"].ToString();

                        if (LoginStatus == "A")
                        {
                            if (!String.IsNullOrEmpty(userdetails.Rows[0]["RoleID"].ToString()))
                            {
                                String roleid = userdetails.Rows[0]["RoleID"].ToString();
                                FormsAuthentication.SetAuthCookie(logOn.UserName, false);
                                //FormsAuthenticationTicket FrmAutTicket = new FormsAuthenticationTicket(1, model.UserName, DateTime.Now, DateTime.Now.AddMinutes(3600), false, roleid);
                                //HttpCookie Cookie = new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(FrmAutTicket));
                                //Response.Cookies.Add(Cookie);

                                HttpCookie myCookie = new HttpCookie("myCookie");

                                myCookie.Values.Add("UserName", logOn.UserName);
                                myCookie.Values.Add("FirstName", userdetails.Rows[0]["FirstName"].ToString());
                                myCookie.Values.Add("RoleID", roleid);
                                myCookie.Values.Add("CommunityID", userdetails.Rows[0]["CommunityID"].ToString());
                                myCookie.Values.Add("CommunityName", userdetails.Rows[0]["CommunityName"].ToString());
                                myCookie.Values.Add("UserID", userdetails.Rows[0]["UserID"].ToString());
                                myCookie.Values.Add("CommunityMenuOptions", userdetails.Rows[0]["CommunityMenuOptions"].ToString());
                               
                                myCookie.HttpOnly = true;
                                Response.Cookies.Add(myCookie);

                                String RedirectURL = null;
                                switch (roleid)
                                {
                                    case "1": RedirectURL = "SuperAdministrator";                                        
                                        break;
                                    case "2": RedirectURL = "Administrator";                                      
                                        break;
                                    case "3": RedirectURL = "SecurityManager"; break;
                                    case "4": RedirectURL = "SecurityPersonnel"; break;
                                    case "5": RedirectURL = "HomeOwner"; break;
                                    case "6": RedirectURL = "ServiceProvider"; break;
                                }
                                return Json(new { result = true, redirecturl = RedirectURL });
                            }
                        }
                        else if (LoginStatus == "P")
                        {
                            ModelState.AddModelError("P1", "You already login from some other ipaddress." + '\n' + "Wait for " + userdetails.Rows[0]["MinutesToWait"].ToString() + " minutes");
                            String[] lostLoginDetails = userdetails.Rows[0]["LastLogin"].ToString().Split(' ');
                            ModelState.AddModelError("P2", "Your last login on " + lostLoginDetails[0] + " @ " + lostLoginDetails[1]);
                        }
                        else if (LoginStatus == "FP")
                        {
                            ModelState.AddModelError("FP", "Requested for Password Change, Link has been sent to your email.");
                        }
                        else if (LoginStatus == "MM")
                        {
                            ModelState.AddModelError("MM", "Username, Password mismatch");
                        }
                        else if (LoginStatus == "NF")
                        {
                            ModelState.AddModelError("NF", "The username is not registered.");
                        }
                    }
                    else
                    {
                        ModelState.AddModelError("problem", "Problem with website, Please Try after some time.");
                    }
                }
                else
                {
                    ModelState.AddModelError("NR", "User not registered yet.");
                }
            }
            else
            {
                ModelState.AddModelError("error", "Model Errors.");
            }
            // return Json(new { result = ModelState.IsValid, errors = GetErrorsFromModelState() });
            return Json(new { result = false, errors = GetErrorsFromModelState(), errorPartial = RenderPartialViewToString("_LogOn", logOn) });
        }

        //
        // GET: /Account/LogOff
        [Authorize]
        public ActionResult LogOff()
        {
            AccountModel account = new AccountModel();
            HttpCookie useCookie = HttpContext.Request.Cookies["myCookie"];
            account.UserName = useCookie.Values["UserName"];
            accountDAL = new AccountDAL();
            if (String.Compare(accountDAL.LogOff(account).ToString(), "SUCCESS") == 0)
            {
                Session.RemoveAll();
                Response.Cookies.Clear();
                useCookie.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(useCookie);

                FormsAuthentication.SignOut();
            }
            Session["LogOut"] = true;
            return RedirectToAction("LogOn", "Account");
        }


        public ActionResult Recovery()
        {
            if (Request.IsAjaxRequest())
                return PartialView("_Recovery");
            else
                return View("Recovery");
        }


        // This method helps to render a partial view into html String.  
        public String RenderPartialViewToString(String viewName, object model)
        {
            ViewData.Model = model;
            using (var sw = new StringWriter())
            {
                var viewResult = ViewEngines.Engines.FindPartialView(ControllerContext, viewName);
                var viewContext = new ViewContext(ControllerContext,
                    viewResult.View, ViewData, TempData, sw);
                viewResult.View.Render(viewContext, sw);

                return sw.GetStringBuilder().ToString();
            }
        }

        // This method helps to get the error information from the MVC "ModelState".
        // We can not directly send the ModelState to the client in Json. The "ModelState"
        // object has some circular reference that prevents it to be serialized to Json.
        public Dictionary<String, String> GetErrorsFromModelState()
        {
            var errors = new Dictionary<String, String>();
            foreach (var key in ModelState.Keys)
            {
                // Only send the errors to the client.
                if (ModelState[key].Errors.Count > 0)
                {
                    errors[key] = ModelState[key].Errors[0].ErrorMessage;
                }
            }
            return ViewBag.errors = errors;
        }



        //[HttpPost]
        //public ActionResult Recovery(ForgotPasswordModel forgotPasswordModel)
        //{
        //if (this.ModelState.IsValid)
        //{

        //}
        //else
        //{
        //    ModelState.AddModelError("", "");
        //    return View(forgotPasswordModel);
        //}
        //}

        //
        // GET: /Account/Register

        //public ActionResult Register()
        //{
        //    return View();
        //}

        //
        // POST: /Account/Register

        //[HttpPost]
        //public ActionResult Register(RegisterModel model)
        //{
        //    if (this.ModelState.IsValid)
        //    {
        //        // Attempt to register the user
        //        MembershipCreateStatus createStatus;
        //        Membership.CreateUser(model.UserName, model.Password, model.Email, null, null, true, null, out createStatus);

        //        if (createStatus == MembershipCreateStatus.Success)
        //        {
        //            FormsAuthentication.SetAuthCookie(model.UserName, false /* createPersistentCookie */);
        //            return RedirectToAction("Index", "Home");
        //        }
        //        else
        //        {
        //            ModelState.AddModelError("", ErrorCodeToString(createStatus));
        //        }
        //    }

        //    // If we got this far, something failed, redisplay form
        //    return View(model);
        //}

        //
        // GET: /Account/ChangePassword

        //[Authorize]
        //public ActionResult ChangePassword()
        //{
        //    return View();
        //}

        //
        // POST: /Account/ChangePassword

        //[Authorize]
        //[HttpPost]
        //public ActionResult ChangePassword(ChangePasswordModel model)
        //{
        //    if (this.ModelState.IsValid)
        //    {

        //        // ChangePassword will throw an exception rather
        //        // than return false in certain failure scenarios.
        //        bool changePasswordSucceeded;
        //        try
        //        {
        //            MembershipUser currentUser = Membership.GetUser(User.Identity.Name, true /* userIsOnline */);
        //            changePasswordSucceeded = currentUser.ChangePassword(model.OldPassword, model.NewPassword);
        //        }
        //        catch (Exception)
        //        {
        //            changePasswordSucceeded = false;
        //        }

        //        if (changePasswordSucceeded)
        //        {
        //            return RedirectToAction("ChangePasswordSuccess");
        //        }
        //        else
        //        {
        //            ModelState.AddModelError("", "The current password is incorrect or the new password is invalid.");
        //        }
        //    }

        //    // If we got this far, something failed, redisplay form
        //    return View(model);
        //}

        //
        // GET: /Account/ChangePasswordSuccess

        //public ActionResult ChangePasswordSuccess()
        //{
        //    return View();
        //}

        #region Status Codes
        private static String ErrorCodeToString(MembershipCreateStatus createStatus)
        {
            // See http://go.microsoft.com/fwlink/?LinkID=177550 for
            // a full list of status codes.
            switch (createStatus)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return "User name already exists. Please enter a different user name.";

                case MembershipCreateStatus.DuplicateEmail:
                    return "A user name for that e-mail address already exists. Please enter a different e-mail address.";

                case MembershipCreateStatus.InvalidPassword:
                    return "The password provided is invalid. Please enter a valid password value.";

                case MembershipCreateStatus.InvalidEmail:
                    return "The e-mail address provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidAnswer:
                    return "The password retrieval answer provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidQuestion:
                    return "The password retrieval question provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidUserName:
                    return "The user name provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.ProviderError:
                    return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                case MembershipCreateStatus.UserRejected:
                    return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                default:
                    return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
            }
        }
        #endregion
    }
}
