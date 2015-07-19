using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using System.Web.Routing;
using System.Web.Security;
using GateAccess.Models;
using GateAccess.Models.DAL;

namespace GateAccess.Controllers.ControllerBase
{
    public class BaseController : Controller
    {
        protected HttpCookie useMyCookie;
        protected Int16 myCommunityID;
        protected String myCommunityName;
        protected Int64 myUserID;
        protected Byte myRoleID;
        protected String myUserName;
        protected String myFirstName;        
        protected IEnumerable<String> myCommunityMenuOptions;
        protected List<String> myCommunityMenuOptionsNames;

        protected override void Initialize(RequestContext requestContext)
        {
            base.Initialize(requestContext);
            if (Request.IsAuthenticated != false)
            {
                useMyCookie = Request.Cookies["myCookie"];
                ViewBag.myCommunityID = myCommunityID = Convert.ToInt16(useMyCookie["CommunityID"].ToString());
                ViewBag.myCommunityName = myCommunityName = useMyCookie["CommunityName"].ToString();
                ViewBag.myUserID = myUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                ViewBag.myRoleID = myRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
                ViewBag.myUserName = myUserName = useMyCookie["UserName"].ToString();
                ViewBag.myFirstName = myFirstName = useMyCookie["FirstName"].ToString();
                ViewBag.myCommunityMenuOptions = myCommunityMenuOptions = useMyCookie["CommunityMenuOptions"].ToString().Split(',');
            }
            else
                Redirect("/Account/LogOn");
        }

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (myRoleID != 1)
            {
                GetCommunityMenuOptionsNames();
                if(!filterContext.HttpContext.Request.IsAjaxRequest())
                if (filterContext.ActionDescriptor.ActionName == "Default" || myCommunityMenuOptionsNames.Contains(filterContext.ActionDescriptor.ActionName))
                    base.OnActionExecuting(filterContext);
                else
                    filterContext.HttpContext.Response.Redirect("~/RestrictrdAccess.html");
            }
        }

        protected void GetCommunityMenuOptionsNames()
        {
            if (myCommunityMenuOptions!= null)
            {                 
                myCommunityMenuOptionsNames = MenuOptionsDAL.GetMenuOptionsNames(myCommunityMenuOptions);                                 
            }            
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

        //// This method helps to get the error information from the MVC "ModelState".
        //// We can not directly send the ModelState to the client in Json. The "ModelState"
        //// object has some circular reference that prevents it to be serialized to Json.
        //public Dictionary<String, object> GetErrorsFromModelState()
        //{
        //    var errors = new Dictionary<String, object>();
        //    foreach (var key in ModelState.Keys)
        //    {
        //        // Only send the errors to the client.
        //        if (ModelState[key].Errors.Count > 0)
        //        {
        //            errors[key] = ModelState[key].Errors;
        //        }
        //    }

        //    return errors;
        //}

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
    }
}
