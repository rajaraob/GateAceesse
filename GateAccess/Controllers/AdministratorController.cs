using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using System.Threading;

using GateAccess.Models;
using GateAccess.Models.DAL;
using GateAccess.Controllers.ControllerBase;
using GateAccess.Models.Helper;


namespace GateAccess.Controllers
{
    [Authorize]
    public class AdministratorController : BaseController
    {
        String MenuOptionIDs;
        Dictionary<Byte, String> Dic_MenuOptions = new Dictionary<Byte, String>();

        CommunitiesDAL communitiesDAL = new CommunitiesDAL();
        AccountDAL accountDAL = new AccountDAL();
        AdministratorsDAL administratorsDAL = new AdministratorsDAL();
        SecurityManagersDAL securityManagersDAL = new SecurityManagersDAL();
        SecurityPersonnelsDAL securityPersonnelsDAL = new SecurityPersonnelsDAL();
        HomeOwnersDAL homeOwnersDAL = new HomeOwnersDAL();
        ServiceProvidersDAL serviceProvidersDAL = new ServiceProvidersDAL();

        MaintenancesDAL maintenancesDAL = new MaintenancesDAL();
        VisitorsDAL visitorsDAL = new VisitorsDAL();
        LostFoundsDAL lostFoundsDAL = new LostFoundsDAL();
        HintQuestionsDAL hintQuestionsDAL = new HintQuestionsDAL();        
        NoticesDAL noticesDAL = new NoticesDAL();

        CommunitiesModel community;
        AdministratorsModel administrator;
        SecurityManagersModel securityManager;
        SecurityPersonnelsModel securityPersonnel;
        ServiceProvidersModel serviceProvider;
        HomeOwnersModel homeOwner;
        CommunityUsersByRole communityUsersByRole;

        MaintenancesModel maintenance;
        VisitorsModel visitor;
        LostFoundsModel lostFound;
        NoticesModel notice;

        String strFileName = ConfigurationManager.AppSettings["MenuOptionsXML"].ToString();
        String response = null;
        Boolean result = false;

        
        Int16 outNoticeID;
        Int16 outMaintenanceID;
        Int16 outLostFoundID;
        Int16 outVisitorID;

        Byte outRoleID;
        Int64 outAdministratorID;
        Int64 outHomeOwnerID;
        Int64 outSecurityManagerID;
        Int64 outSecurityPersonID;
        Int64 outServiceProviderID;

        List<HintQuestionsModel> hintQuestionsList;
        List<CommunityUsersByRole> communityUsersByRoleList;
        List<CommunitiesModel> communitiesList;
        List<NoticesModel> noticesList;
        List<MaintenancesModel> maintenancesList;
        List<LostFoundsModel> lostFoundsList;
        List<VisitorsModel> visitorsList;

        List<AdministratorsModel> administratorsList;
        List<SecurityManagersModel> securityManagersList;
        List<SecurityPersonnelsModel> securityPersonnelsList;
        List<HomeOwnersModel> homeOwnersList;
        List<ServiceProvidersModel> serviceProvidersList;


        /// <summary>
        /// Administrator HomePage
        /// </summary>
        /// <returns></returns>

        public ActionResult Default()
        {
            return View();
        }

        /// <summary>
        /// Registration of Users By Roles wise
        /// </summary>
        /// <returns></returns>        

        #region Registration of Users By Role wise


        [AjaxOnly]
        public ActionResult RegistrationPartial(String roleid)
        {
            if (RoleIDSanctityCheck(roleid))
            {
                String partial = null;
                ViewBag.CommunityID = myCommunityID;
                Object loadModel = null;
                switch (roleid)
                {
                    case "2": partial = "Administrators/NewAdministrator";
                        administrator = new AdministratorsModel();
                        administrator.CommunityID = myCommunityID;
                        loadModel = administrator;
                        break;
                    case "3": partial = "SecurityManagers/NewSecurityManager";
                        securityManager = new SecurityManagersModel();
                        securityManager.CommunityID = myCommunityID;
                        loadModel = securityManager;
                        break;
                    case "4": partial = "SecurityPersonnels/NewSecurityPerson";
                        securityPersonnel = new SecurityPersonnelsModel();
                        securityPersonnel.CommunityID = myCommunityID;
                        loadModel = securityPersonnel;
                        break;
                    case "5": partial = "HomeOwners/NewHomeOwner";
                        homeOwner = new HomeOwnersModel();
                        homeOwner.CommunityID = myCommunityID;
                        loadModel = homeOwner;
                        break;
                    case "6": partial = "ServiceProviders/NewServiceProvider";
                        serviceProvider = new ServiceProvidersModel();
                        serviceProvider.CommunityID = myCommunityID;
                        loadModel = serviceProvider;
                        break;
                }
                
                return PartialView("Partials/Users/" + partial, loadModel);
            }
            else
                return AjaxParamError("Role");
        }

        [HttpPost]
        [AjaxOnly]
        public ActionResult NewAdministrator(AdministratorsModel administrator)
        {
            if (this.ModelState.IsValid)
            {
                administrator.Admin_CreatedOn = Convert.ToDateTime(DateTime.Now.ToString());
                administrator.Admin_CreatedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                administrator.Admin_CreatedUserID = Convert.ToByte(useMyCookie["RoleID"].ToString());
                //return Json(administratorDAL.AddAdministrator(administrator).ToString());
                Int32 newAdministratorID;
                if (Int32.TryParse(administratorsDAL.AddAdministrator(administrator).ToString(), out newAdministratorID) == true)
                {
                    TempData["NewAdministratorID"] = newAdministratorID;
                    return Json(true);
                }
                else
                {
                    Session["Result"] = false;
                    return Json(false);
                }
            }
            else
                return Json("dataerror");
        }

        [HttpPost]
        [AjaxOnly]
        public ActionResult NewSecurityManager(SecurityManagersModel securityManager)
        {
            if (this.ModelState.IsValid)
            {
                securityManager.SM_CreatedOn = Convert.ToDateTime(DateTime.Now.ToString());
                securityManager.SM_CreatedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                securityManager.SM_CreatedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());

                return Json(securityManagersDAL.AddSecurityManager(securityManager));
            }
            else
                return AjaxDataError("SecurityManager");
        }

        [HttpPost]
        [AjaxOnly]
        public ActionResult NewSecurityPerson(SecurityPersonnelsModel securityPersonnel)
        {
            if (this.ModelState.IsValid)
            {
                securityPersonnel.SP_CreatedOn = Convert.ToDateTime(DateTime.Now.ToString());
                securityPersonnel.SP_CreatedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                securityPersonnel.SP_CreatedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());

                return Json(securityPersonnelsDAL.AddSecurityPersonnel(securityPersonnel));
            }
            else
                return AjaxDataError("SecurityPersonnel");
        }

        [AjaxOnly]
        [HttpPost]
        public ActionResult NewHomeOwner(HomeOwnersModel homeOwner)
        {
            if (this.ModelState.IsValid)
            {
                homeOwner.HO_CreatedOn = Convert.ToDateTime(DateTime.Now.ToString());
                homeOwner.HO_CreatedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                homeOwner.HO_CreatedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
                return Json(homeOwnersDAL.AddHomeOwner(homeOwner));
            }
            else
                return AjaxDataError("HomeOwner");
        }

        [AjaxOnly]
        [HttpPost]
        public ActionResult NewServiceProvider(ServiceProvidersModel serviceProvider)
        {
            if (this.ModelState.IsValid)
            {
                serviceProvider.SRP_CreatedOn = Convert.ToDateTime(DateTime.Now.ToString());
                serviceProvider.SRP_CreatedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                serviceProvider.SRP_CreatedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
                serviceProvidersDAL.AddServiceProvider(serviceProvider);
                return null;
            }
            else
                return View(serviceProvider);
        }


        #endregion

        /// <summary>
        /// Display of Users by Role wise
        /// </summary>
        /// <returns></returns>

        #region Users By Role
        
        
        public ActionResult Users()
        {
            community = new CommunitiesModel();
            community.CommunityID = myCommunityID;

            communityUsersByRole = new CommunityUsersByRole();
            communityUsersByRole.CommunityID = myCommunityID;
            communityUsersByRoleList = new List<CommunityUsersByRole>();
            communityUsersByRoleList = accountDAL.GetCommunityUsersByRole(communityUsersByRole);
            if (communityUsersByRoleList != null)
            {
                foreach (CommunityUsersByRole cubr in communityUsersByRoleList)
                {
                    switch (cubr.RoleID)
                    {
                        case 2: ViewBag.AdministratorsCount = cubr.UsersCount;
                            break;
                        case 3: ViewBag.SecurityManagersCount = cubr.UsersCount;
                            break;
                        case 4: ViewBag.SercurityPersonsCount = cubr.UsersCount;
                            break;
                        case 5: ViewBag.HomeOwnersCount = cubr.UsersCount;
                            break;
                        case 6: ViewBag.ServiceProvidersCount = cubr.UsersCount;
                            break;
                    }
                }
            }
            return View("Users");
        }

        [AjaxOnly]
        public ActionResult UsersList(String roleid)
        {
            if (RoleIDSanctityCheck(roleid))
            {
                String listpartial = null;
                switch (roleid)
                {
                    case "2": AdministratorsList();
                        listpartial = "Administrators/_Administrators";
                        break;
                    case "3": SecurityManagersList();
                        listpartial = "SecurityManagers/_SecurityManagers";
                        break;
                    case "4": SecurityPersonnelsList();
                        listpartial = "SecurityPersonnels/_SecurityPersonnels";
                        break;
                    case "5": HomeOwnersList();
                        listpartial = "HomeOwners/_HomeOwners";
                        break;
                    case "6": ServiceProvidersList();
                        listpartial = "ServiceProviders/_ServiceProviders";
                        break;
                }

                return PartialView("Partials/Users/" + listpartial);
            }
            else
                return AjaxParamError("Role");
        }


        #endregion

        /// <summary>
        /// AdministratorsModel @ CRUD
        /// </summary>
        /// <returns></returns>

        #region Administrator CRUD
        
       
        private void AdministratorsList()
        {
            administrator = new AdministratorsModel();
            administrator.CommunityID = myCommunityID;
            ViewBag.AdministratorsList = administratorsDAL.AdministratorsList(administrator);
        }

        [AjaxOnly]
        public ActionResult AdministratorsListTable()
        {
            administrator = new AdministratorsModel();
            administrator.CommunityID = myCommunityID;
            ViewBag.AdministratorsList = administratorsDAL.AdministratorsList(administrator);
            return PartialView("Partials/Users/Administrators/AdministratorsListTable");
        }


        [AjaxOnly]
        public ActionResult AdministratorDetails(String administratorid)
        {
            if (AdministratorIDSanctityCheck(administratorid))
            {
                administrator = new AdministratorsModel();
                administrator.CommunityID = myCommunityID;
                administrator.AdministratorID = Convert.ToInt64(administratorid);

                
                return PartialView("Partials/Users/Administrators/AdministratorDetails", administratorsDAL.AdministratorDetails(administrator));
            }
            else
                return AjaxParamError("Administrator");
        }

        //[AjaxOnly]
        //public ActionResult EditAdministrator(String administratorid)
        //{
        //    if (AdministratorIDSanctityCheck(administratorid))
        //    {
        //        administrator = new AdministratorsModel();
        //        administrator.CommunityID = myCommunityID;
        //        administrator.AdministratorID = Convert.ToInt64(administratorid);
                
        //        return PartialView("Partials/Users/Administrators/EditAdministrator", administratorsDAL.EditAdministrator(administrator));
        //    }
        //    else
        //        return AjaxParamError("Admisitrator");
        //}

        //[AjaxOnly]
        //[HttpPost]
        //public ActionResult UpdateAdministrator(AdministratorsModel administrator)
        //{
        //    if (this.ModelState.IsValid)
        //    {
        //        administrator.Admin_ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
        //        administrator.Admin_ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());
        //        return Json(administratorsDAL.UpdateAdministrator(administrator).ToString());
        //    }
        //    else
        //        return AjaxDataError("Administrator");
        //}

        [AjaxOnly]
        public ActionResult DeleteAdministrator(String administratorid)
        {
            if (AdministratorIDSanctityCheck(administratorid))
            {
                administrator = new AdministratorsModel();
                administrator.CommunityID = myCommunityID;
                administrator.AdministratorID = Convert.ToInt64(administratorid);
                administrator.Admin_ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                administrator.Admin_ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                return Json(administratorsDAL.DeleteAdministrator(administrator).ToString());
            }
            else return AjaxParamError("Administrator");
        }

        [AjaxOnly]
        [HttpPost]
        public ActionResult DeleteAdministrators(IEnumerable<Int64> administratorsselectedtodelete)
        {
            return Json(true);
            //    if (administratorsselectedtodelete.Count() != 0)
            //    {
            //        foreach (Int64 i in administratorsselectedtodelete)
            //        {
            //            administrator = new AdministratorsModel();
            //            administrator.AdministratorID = i;
            //            administrator.ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
            //            administrator.ModifiedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
            //            administrator.ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

            //            administratorsList = new List<AdministratorsModel>();
            //            administratorsList.Add(administrator);
            //        }
            //        return Json(Convert.ToString(AdministratorsDAL.DeleteAdministrators(administratorsList)));
            //    }
            //    else
            //        return Json("dataerror", JsonRequestBehavior.AllowGet);
            //}            
        }


        #endregion

        /// <summary>
        /// Security Manager @ CRUD
        /// </summary>
        /// <returns></returns>

        #region CRUD On Security Manager

        
        private void SecurityManagersList()
        {
            securityManager = new SecurityManagersModel();
            securityManager.CommunityID = myCommunityID;
            ViewBag.SecurityManagersList = securityManagersDAL.SecurityManagersList(securityManager);
        }

        [AjaxOnly]
        public ActionResult SecurityManagersListTable()
        {
            securityManager = new SecurityManagersModel();
            securityManager.CommunityID = myCommunityID;
            ViewBag.SecurityManagersList = securityManagersDAL.SecurityManagersList(securityManager);
            return PartialView("Partials/Users/SecurityManagers/SecurityManagersListTable");
        }

        public ActionResult SecurityManagerDetails(String securitymanagerid)
        {
            if (SecurityManagerIDSanctityCheck(securitymanagerid))
            {
                securityManager = new SecurityManagersModel();
                securityManager.CommunityID = myCommunityID;
                securityManager.SecurityManagerID = outSecurityManagerID;
                
                return PartialView("Partials/Users/SecurityManagers/SecurityManagerDetails", securityManagersDAL.SecurityManagerDetails(securityManager));
            }
            else
                return AjaxParamError("SecurityManager");
        }

        //[AjaxOnly]
        //public ActionResult EditSecurityManager(String securitymanagerid)
        //{
        //    if (SecurityManagerIDSanctityCheck(securitymanagerid))
        //    {
        //        securityManager = new SecurityManagersModel();
        //        securityManager.CommunityID = myCommunityID;
        //        securityManager.SecurityManagerID = outSecurityManagerID;
                
        //        return PartialView("Partials/Users/SecurityManagers/EditSecurityManager", securityManagersDAL.EditSecurityManager(securityManager));
        //    }
        //    else
        //        return AjaxParamError("SecurityManager");
        //}

        [HttpPost]
        public ActionResult UpdateSecurityManager(SecurityManagersModel securityManager)
        {
            if (this.ModelState.IsValid)
            {
                securityManager.CommunityID = myCommunityID;
                securityManager.SM_ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                securityManager.SM_ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                return Json(securityManagersDAL.UpdateSecurityManager(securityManager).ToString());
            }
            else
                return AjaxDataError("SecurityManager");
        }

        public ActionResult DeleteSecurityManager(String securitymanagerid)
        {
            if (SecurityManagerIDSanctityCheck(securitymanagerid))
            {
                securityManager = new SecurityManagersModel();
                securityManager.CommunityID = myCommunityID;
                securityManager.SecurityManagerID = outSecurityManagerID;
                securityManager.SM_ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                securityManager.SM_ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

                return Json(securityManagersDAL.DeleteSecurityManager(securityManager).ToString());
            }
            else return AjaxParamError("SecurityManager");
        }

        [HttpPost]
        public ActionResult DeleteSecurityManagers(IEnumerable<Int64> securitymanagersselectedtodelete)
        {
            return Json(true);
            //if (Request.IsAjaxRequest())
            //{
            //    if (securitymanagersselectedtodelete.Count() != 0)
            //    {
            //        foreach (Int64 i in securitymanagersselectedtodelete)
            //        {
            //            securityManager = new SecurityManagersModel();
            //            securityManager.SecurityManagerID = i;
            //            securityManager.ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
            //            securityManager.ModifiedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
            //            securityManager.ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

            //            securityManagersList = new List<SecurityManagersModel>();
            //            securityManagersList.Add(securityManager);
            //        }
            //        return Json(Convert.ToString(SecurityManagersDAL.DeleteSecurityManagers(securityManagersList)));
            //    }
            //    else
            //        return Json("dataerror", JsonRequestBehavior.AllowGet);
            //}
            //else
            //    return Json("ajaxerror", JsonRequestBehavior.AllowGet);
        }


        #endregion

        /// <summary>
        /// Security Person & CRUD
        /// </summary>
        /// <returns></returns>

        #region CRUD On Security Personnel


        private void SecurityPersonnelsList()
        {
            securityPersonnel = new SecurityPersonnelsModel();
            securityPersonnel.CommunityID = myCommunityID;
            ViewBag.SecurityPersonnelsList = securityPersonnelsDAL.SecurityPersonnelsList(securityPersonnel);
        }

        public ActionResult SecurityPersonnelsListTable()
        {
            securityPersonnel = new SecurityPersonnelsModel();
            securityPersonnel.CommunityID = myCommunityID;
            ViewBag.SecurityPersonnelsList = securityPersonnelsDAL.SecurityPersonnelsList(securityPersonnel);
            return PartialView("Partials/Users/SecurityPersonnels/SecurityPersonnelsListTable");
        }


        public ActionResult SecurityPersonnelDetails(String securitypersonnelid)
        {
            if (SecurityManagerIDSanctityCheck(securitypersonnelid))
            {
                securityPersonnel = new SecurityPersonnelsModel();
                securityPersonnel.CommunityID = myCommunityID;
                securityPersonnel.SecurityPersonnelID = Convert.ToInt64(securitypersonnelid);
                
                return PartialView("Partials/Users/SecurityPersonnels/SecurityPersonnelDetails", securityPersonnelsDAL.SecurityPersonnelDetails(securityPersonnel));
            }
            else
                return AjaxParamError("SecurityPersonnel");
        }

        public ActionResult EditSecurityPersonnel(String securitypersonnelid)
        {
            if (SecurityPersonIDSanctityCheck(securitypersonnelid))
            {
                securityPersonnel = new SecurityPersonnelsModel();
                securityPersonnel.CommunityID = myCommunityID;
                securityPersonnel.SecurityPersonnelID = outSecurityPersonID;
                
                return PartialView("Partials/Users/SecurityPersonnels/EditSecurityPersonnel", securityPersonnelsDAL.EditSecurityPersonnel(securityPersonnel));
            }
            else
                return AjaxParamError("SecurityPersonnel");
        }

        [HttpPost]
        public ActionResult UpdateSecurityPersonnel(SecurityPersonnelsModel securityPersonnel)
        {
            if (this.ModelState.IsValid)
            {
                securityPersonnel.CommunityID = myCommunityID;
                securityPersonnel.SP_ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                securityPersonnel.SP_ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                return Json(securityPersonnelsDAL.UpdateSecurityPerson(securityPersonnel));
            }
            else
                return AjaxDataError("SecurityPersonnel");
        }

        public ActionResult DeleteSecurityPersonnel(String securitypersonnelid)
        {
            if (SecurityPersonIDSanctityCheck(securitypersonnelid))
            {
                securityPersonnel = new SecurityPersonnelsModel();
                securityPersonnel.CommunityID = myCommunityID;
                securityPersonnel.SecurityPersonnelID = Convert.ToInt64(securitypersonnelid);
                securityPersonnel.SP_ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                securityPersonnel.SP_ModifiedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
                securityPersonnel.SP_ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

                return Json(securityPersonnelsDAL.DeleteSecurityPersonnel(securityPersonnel));
            }
            else
                return AjaxParamError("SecurityPersonnel");
        }


        [HttpPost]
        public ActionResult DeleteSecurityPersonnels(IEnumerable<Int64> securitypersonnelsselectedtodelete)
        {
            return Json(true);
            //if (Request.IsAjaxRequest())
            //{
            //    if (securitypersonnelsselectedtodelete.Count() != 0)
            //    {
            //        foreach (Int64 i in securitypersonnelsselectedtodelete)
            //        {
            //            securityPersonnel = new SecurityPersonnelsModel();
            //            securityPersonnel.SecurityPersonnelID = i;
            //            securityPersonnel.ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
            //            securityPersonnel.ModifiedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
            //            securityPersonnel.ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

            //            securityPersonnelsList = new List<SecurityPersonnelsModel>();
            //            securityPersonnelsList.Add(securityPersonnel);
            //        }
            //        return Json(Convert.ToString(SecurityPersonnelsDAL.DeleteSecurityPersonnels(securityPersonnelsList)));
            //    }
            //    else
            //        return Json("dataerror", JsonRequestBehavior.AllowGet);
            //}
            //else
            //    return Json("ajaxerror", JsonRequestBehavior.AllowGet);
        }


        #endregion

        /// <summary>
        /// Home Owner & CRUD
        /// </summary>
        /// <returns></returns>

        #region CRUD On Home Owner


        private void HomeOwnersList()
        {
            homeOwner = new HomeOwnersModel();
            homeOwner.CommunityID = myCommunityID;
            ViewBag.HomeOwnersList = homeOwnersDAL.HomeOwnersList(homeOwner);
        }

        public ActionResult HomeOwnersListTable()
        {
            homeOwner = new HomeOwnersModel();
            homeOwner.CommunityID = myCommunityID;
            ViewBag.HomeOwnersList = homeOwnersDAL.HomeOwnersList(homeOwner);

            return PartialView("Partials/Users/HomeOwners/HomeOwnersListTable");
        }

        public ActionResult HomeOwnerDetails(String homeownerid)
        {
            if (HomeOwnerIDSanctityCheck(homeownerid))
            {
                homeOwner = new HomeOwnersModel();
                homeOwner.CommunityID = myCommunityID;
                homeOwner.HomeOwnerID = Convert.ToInt64(homeownerid);
                return PartialView("Partials/Users/HomeOwners/HomeOwnerDetails", homeOwnersDAL.EditHomeOwner(homeOwner));
            }
            else
                return AjaxParamError("HomeOwner");
        }

        public ActionResult EditHomeOwner(String homeownerid)
        {
            if (HomeOwnerIDSanctityCheck(homeownerid))
            {
                homeOwner = new HomeOwnersModel();
                homeOwner.CommunityID = myCommunityID;
                homeOwner.HomeOwnerID = Convert.ToInt64(homeownerid);
                
                return PartialView("Partials/Users/HomeOwners/EditHomeOwner", homeOwnersDAL.HomeOwnerDetails(homeOwner));
            }
            else
                return AjaxParamError("HomeOwner");
        }

        [HttpPost]
        public ActionResult UpdateHomeOwner(HomeOwnersModel homeOwner)
        {
            if (this.ModelState.IsValid)
            {
                homeOwner.CommunityID = myCommunityID;
                homeOwner.HO_ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                homeOwner.HO_ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                return Json(homeOwnersDAL.UpdateHomeOwner(homeOwner));
            }
            else
                return AjaxDataError("HomeOwner");
        }

        public ActionResult DeleteHomeOwner(String homeownerid)
        {
            if (HomeOwnerIDSanctityCheck(homeownerid))
            {
                homeOwner = new HomeOwnersModel();
                homeOwner.CommunityID = myCommunityID;
                homeOwner.HomeOwnerID = Convert.ToInt64(homeownerid);
                homeOwner.HO_ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                homeOwner.HO_ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

                return Json(homeOwnersDAL.DeleteHomeOwner(homeOwner));
            }
            else
                return AjaxParamError("HomeOwner");
        }

        [HttpPost]
        public ActionResult DeleteHomeOwners(IEnumerable<Int64> homeownersselectedtodelete)
        {
            return Json(true);
            //if (Request.IsAjaxRequest())
            //{
            //    if (homeownersselectedtodelete.Count() != 0)
            //    {
            //        foreach (Int64 i in homeownersselectedtodelete)
            //        {
            //            homeOwner = new HomeOwnersModel();
            //            homeOwner.HomeOwnerID = i;
            //            homeOwner.ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
            //            homeOwner.ModifiedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
            //            homeOwner.ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

            //            homeOwnersList = new List<HomeOwnersModel>();
            //            homeOwnersList.Add(homeOwner);
            //        }
            //        return Json(Convert.ToString(HomeOwnersDAL.DeleteHomeOwners(homeOwnersList)));
            //    }
            //    else
            //        return Json("dataerror", JsonRequestBehavior.AllowGet);
            //}
            //else
            //    return Json("ajaxerror", JsonRequestBehavior.AllowGet);
        }


        #endregion

        /// <summary>
        /// Service Provider & CRUD
        /// </summary>
        /// <returns></returns>

        #region CRUD Of Service Provider

        
        private void ServiceProvidersList()
        {
            serviceProvider = new ServiceProvidersModel();
            serviceProvider.CommunityID = myCommunityID;
            ViewBag.ServiceProvidersList = serviceProvidersDAL.ServiceProvidersList(serviceProvider);
        }

        [AjaxOnly]
        public ActionResult ServiceProvidersListTable()
        {
            serviceProvider = new ServiceProvidersModel();
            serviceProvider.CommunityID = myCommunityID;
            ViewBag.ServiceProvidersList = serviceProvidersDAL.ServiceProvidersList(serviceProvider);

            return PartialView("Partials/Users/ServiceProviders/ServiceProvidersListTable");
        }

        [AjaxOnly]
        public ActionResult ServiceProviderDetails(String serviceproviderid)
        {
            if (ServiceProviderIDSanctityCheck(serviceproviderid))
            {
                serviceProvider = new ServiceProvidersModel();
                serviceProvider.CommunityID = myCommunityID;
                serviceProvider.ServiceProviderID = outServiceProviderID;
                return PartialView("Partials/Users/ServiceProviders/ServiceProviderDetails", serviceProvidersDAL.ServiceProviderDetails(serviceProvider));
            }
            else
                return AjaxParamError("ServiceProvider");
        }


        [AjaxOnly]
        public ActionResult EditServiceProvider(String serviceproviderid)
        {
            if (ServiceProviderIDSanctityCheck(serviceproviderid))
            {
                serviceProvider = new ServiceProvidersModel();
                serviceProvider.CommunityID = myCommunityID;
                serviceProvider.ServiceProviderID = outServiceProviderID;
                
                return PartialView("Partials/Users/ServiceProviders/EditServiceProvider", serviceProvidersDAL.EditServiceProvider(serviceProvider));
            }
            else
                return AjaxParamError("ServiceProvider");
        }

        [AjaxOnly]
        [HttpPost]
        public ActionResult UpdateServiceProvider(ServiceProvidersModel serviceProvider)
        {
            if (ModelState.IsValid)
            {
                serviceProvider.SRP_ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                serviceProvider.SRP_ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                return Json(serviceProvidersDAL.UpdateServiceProvider(serviceProvider));
            }
            else
                return AjaxDataError("ServiceProvider");
        }

        [AjaxOnly]
        public ActionResult DeleteServiceProvider(String serviceproviderid)
        {
            if (ServiceProviderIDSanctityCheck(serviceproviderid))
            {
                serviceProvider = new ServiceProvidersModel();
                serviceProvider.CommunityID = myCommunityID;
                serviceProvider.ServiceProviderID = Convert.ToInt64(serviceproviderid);
                serviceProvider.SRP_ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                serviceProvider.SRP_ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

                return Json(serviceProvidersDAL.DeleteServiceProvider(serviceProvider));
            }
            else
                return AjaxParamError("ServiceProvider");
        }

        [AjaxOnly]
        public ActionResult DeleteServiceProviders(IEnumerable<Int64> serviceprovidersselectedtodelete)
        {
            return Json(true);
            //if (Request.IsAjaxRequest())
            //{
            //    if (serviceprovidersselectedtodelete.Count() != 0)
            //    {
            //        foreach (Int64 i in serviceprovidersselectedtodelete)
            //        {
            //            serviceProvider = new ServiceProvidersModel();
            //            serviceProvider.ServiceProviderID = i;
            //            serviceProvider.ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
            //            serviceProvider.ModifiedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
            //            serviceProvider.ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

            //            serviceProvidersList = new List<ServiceProvidersModel>();
            //            serviceProvidersList.Add(serviceProvider);
            //        }
            //        return Json(Convert.ToString(serviceProvidersDAL.DeleteServiceProviders(serviceProvidersList)));
            //    }
            //    else
            //        return Json("dataerror", JsonRequestBehavior.AllowGet);
            //}
            //else
            //    return Json("ajaxerror", JsonRequestBehavior.AllowGet);
        }


        #endregion

        /// <summary>
        /// Visitor Module & CRUD
        /// </summary>
        /// <returns></returns>

        #region CRUD Of Visitors

        public ActionResult Visitors()
        {
            GetCommunities();
            return PartialView("Partilas/Visitors/_Visitors");
        }

        public ActionResult VisitorsList()
        {
            visitor = new VisitorsModel();
            visitor.CommunityID = myCommunityID;
            return PartialView("Partials/Visitors/VisitorsList", visitorsDAL.VisitorsList(visitor));
        }

        [AjaxOnly]
        public ActionResult VisitorsListTable()
        {
            visitor = new VisitorsModel();
            visitor.CommunityID = myCommunityID;
            return PartialView("Partials/Visitors/VisitorsListTable", visitorsDAL.VisitorsList(visitor));
        }

        [AjaxOnly]
        public ActionResult NewVisitor()
        {
            visitor = new VisitorsModel();
            visitor.CommunityID = myCommunityID;
            return PartialView("Partials/Visitors/NewVisitor");
        }

        [AjaxOnly]
        [HttpPost]
        public ActionResult NewVisitor(VisitorsModel visitor)
        {
            if (this.ModelState.IsValid)
            {
                visitorsDAL.AddVisitor(visitor);
                return View();
            }
            else
                return null;
        }

        public ActionResult VisitorDetails(String visitorid)
        {
            if (VisitorIDSanctityCheck(visitorid))
            {
                visitor = new VisitorsModel();
                visitor.CommunityID = myCommunityID;
                visitor.VisitorID = outVisitorID;
                return PartialView("Partials/Visitors/VisitorDetails", visitorsDAL.VisitorDetails(visitor));
            }
            else
                return AjaxParamError("Visitor");
        }

        public ActionResult EditVisitor(String visitorid)
        {
            visitor = new VisitorsModel();
            visitor.CommunityID = myCommunityID;
            visitor.VisitorID = Convert.ToInt64(visitorid.ToString());
            return PartialView("Partials/Visitors/EditVisitor", visitorsDAL.VisitorDetails(visitor));
        }

        [HttpPost]
        public void UpdateVisitor(FormCollection fc, VisitorsModel visitor)
        {
            visitorsDAL.UpdateVisitor(visitor);
        }

        public ActionResult DeleteVisitor(String visitorid)
        {
            visitor = new VisitorsModel();
            visitor.VisitorID = Convert.ToInt64(visitorid);
            visitorsDAL.DeleteVisitor(visitor);

            return RedirectToAction("VisitorsList");
        }

        [HttpPost]
        public ActionResult DeleteVisitors(IEnumerable<Int64> visitorsselectedtodelete)
        {
            return Json(true);
            //if (Request.IsAjaxRequest())
            //{
            //    if (visitorsselectedtodelete.Count() != 0)
            //    {
            //        foreach (Int64 i in visitorsselectedtodelete)
            //        {
            //            visitor = new VisitorsModel();
            //            visitor.VisitorID = i;
            //            visitor.ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
            //            visitor.ModifiedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
            //            visitor.ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

            //            visitorsList = new List<VisitorsModel>();
            //            visitorsList.Add(visitor);
            //        }
            //        return Json(Convert.ToString(visitorsDAL.DeleteVisitors(visitorsList)));
            //    }
            //    else
            //        return Json("visitorerror");
            //}
            //else
            //    return Json("ajaxerror", JsonRequestBehavior.AllowGet);
        }

        public JsonResult CommunityHouseOwners()
        {
            if (Request.IsAjaxRequest())
            {
                community = new CommunitiesModel();
                community.CommunityID = myCommunityID;
                var vHouseOwners = communitiesDAL.GetCommunityHouseOwners(community);
                //Thread.Sleep(500);
                JsonResult result = new JsonResult();
                result.Data = vHouseOwners.ToList();
                result.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
                return result;
            }
            else
                return null;
        }


        #endregion

        /// <summary>
        /// Maintenance Requests & Crud Operations
        /// </summary>
        /// <returns></returns>

        #region CRUD On Maintenance
                
        public ActionResult Maintenances()
        {            
            maintenance = new MaintenancesModel();
            maintenance.CommunityID = myCommunityID;
            ViewBag.MaintenancesList = maintenancesDAL.MaintenanceList(maintenance);
            return PartialView("Partials/Maintenances/MaintenancesListTable");
        }

        [AjaxOnly]
        public ActionResult MaintenancesListTable()
        {
            maintenance = new MaintenancesModel();
            maintenance.CommunityID = myCommunityID;
            return PartialView("Partials/Maintenances/MaintenancesListTable", maintenancesDAL.MaintenanceList(maintenance));
        }

        [AjaxOnly]
        public ActionResult NewMaintenance()
        {
            maintenance = new MaintenancesModel();
            maintenance.CommunityID = myCommunityID;
            return PartialView("Partials/Maintenances/NewMaintenance", maintenance);
        }

        [AjaxOnly]
        [HttpPost]
        public ActionResult NewMaintenance(MaintenancesModel maintenance)
        {
            if (this.ModelState.IsValid)
            {
                maintenance.CreatedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                maintenance.CreatedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
                maintenance.CreatedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                return Json(maintenancesDAL.AddMaintenance(maintenance).ToString());
            }
            else
                return AjaxDataError("Maintenance");
        }


        [AjaxOnly]
        public ActionResult MaintenanceDetails(String maintenanceid)
        {
            if (MaintenanceIDSanctityCheck(maintenanceid))
            {
                maintenance = new MaintenancesModel();
                maintenance.CommunityID = myCommunityID;
                maintenance.MaintenanceID = Convert.ToInt64(maintenanceid.ToString());

                return PartialView("Partials/Maintenances/MaintenanceDetails", maintenancesDAL.MaintenanceDetails(maintenance));
            }
            else
                return AjaxParamError("Maintenance");
        }


        [AjaxOnly]
        public ActionResult EditMaintenance(String maintenanceid)
        {
            if (MaintenanceIDSanctityCheck(maintenanceid))
            {
                maintenance = new MaintenancesModel();
                maintenance.CommunityID = myCommunityID;
                maintenance.MaintenanceID = Convert.ToInt64(maintenanceid.ToString());

                return PartialView("Partials/Maintenances/EditMaintenance", maintenancesDAL.EditMaintenance(maintenance));
            }
            else
                return AjaxParamError("Maintenance");
        }

        [AjaxOnly]
        [HttpPost]
        public ActionResult UpdateMaintenance(MaintenancesModel maintenance)
        {
            if (ModelState.IsValid)
            {
                maintenance.ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                maintenance.ModifiedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
                maintenance.ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

                return Json(maintenancesDAL.UpdateMaintenance(maintenance));
            }
            else
                return AjaxDataError("Maitenance");
        }

        [AjaxOnly]
        public ActionResult DeleteMaintenance(String maintenanceid)
        {
            if (MaintenanceIDSanctityCheck(maintenanceid))
            {
                maintenance.CommunityID = myCommunityID;
                maintenance.MaintenanceID = Convert.ToInt64(maintenanceid);
                maintenance.ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                maintenance.ModifiedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
                maintenance.ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

                return Json(maintenancesDAL.DeleteMaintenance(maintenance));
            }
            else
                return AjaxParamError("Maintenance");
        }

        [AjaxOnly]
        [HttpPost]
        public ActionResult DeleteMaintenances(IEnumerable<Int64> maintenancesselectedtodelete)
        {
            return Json(true);
            //    if (maintenancesselectedtodelete.Count() != 0)
            //    {
            //        foreach (Int64 i in maintenancesselectedtodelete)
            //        {
            //            maintenance = new MaintenancesModel();
            //            maintenance.MaintenanceID = i;
            //            maintenance.ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
            //            maintenance.ModifiedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
            //            maintenance.ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

            //            maintenancesList = new List<MaintenancesModel>();
            //            maintenancesList.Add(maintenance);
            //        }
            //        return Json(Convert.ToString(maintenancesDAL.DeleteMaintenances(maintenancesList)));
            //    }
            //    else
            //        return Json("dataerror", JsonRequestBehavior.AllowGet);
            //}         
        }

        #endregion

        /// <summary>
        /// Lost/Found Module & Crud Operations
        /// </summary>
        /// <returns></returns>

        #region CRUD On Lost/Found
        
        
        public ActionResult LostFounds()
        {           
            lostFound = new LostFoundsModel();
            lostFound.CommunityID = myCommunityID;

            lostFoundsDAL = new LostFoundsDAL();
            ViewBag.LostFoundsList = lostFoundsDAL.LostFoundList(lostFound);
            return View("LostFounds");
        }

        [AjaxOnly]
        public PartialViewResult LostFoundsListTable()
        {
            lostFound = new LostFoundsModel();
            lostFound.CommunityID = myCommunityID;

            lostFoundsDAL = new LostFoundsDAL();
            ViewBag.LostFoundsList = lostFoundsDAL.LostFoundList(lostFound);
            return PartialView("Partials/LostFounds/LostFoundsListTable");
        }

        [AjaxOnly]
        public ActionResult NewLostFound()
        {
            lostFound = new LostFoundsModel();
            lostFound.CommunityID = myCommunityID;
            return PartialView("Partials/LostFounds/NewLostFound", lostFound);
        }

        [AjaxOnly]
        [HttpPost]
        public ActionResult NewLostFound(LostFoundsModel lfm)
        {
            if (this.ModelState.IsValid)
            {
                lfm.CreatedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                lfm.CreatedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                return Json(lostFoundsDAL.AddLostFound(lfm).ToString());
            }
            else
                return Json("ModelError");
        }

        [AjaxOnly]
        public ActionResult LostFoundDetails(String lostfoundid)
        {
            lostFound = new LostFoundsModel();
            lostFound.CommunityID = myCommunityID;
            lostFound.LostFoundID = Convert.ToInt64(lostfoundid.ToString());

            lostFoundsDAL = new LostFoundsDAL();
            ViewBag.LostFoundDetails = lostFoundsDAL.LostFoundDetails(lostFound);

            return View();
        }

        [AjaxOnly]
        public ActionResult EditLostFound(String lostfoundid)
        {
            lostFound = new LostFoundsModel();
            lostFound.CommunityID = myCommunityID;
            lostFound.LostFoundID = Convert.ToInt64(lostfoundid);

            lostFoundsDAL = new LostFoundsDAL();
            ViewBag.LostFoundDetails = lostFoundsDAL.LostFoundDetails(lostFound);

            return View();
        }

        [AjaxOnly]
        [HttpPost]
        public ActionResult UpdateLostFound(FormCollection fc, LostFoundsModel lostFound)
        {
            if (Request.IsAjaxRequest())
            {
                if (this.ModelState.IsValid)
                {
                    //lostFound.ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                    //lostFound.ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

                    //lostFoundsDAL.UpdateLostFound(lostFound);
                    return Json("success");
                }
                else return Json("dataerror", JsonRequestBehavior.AllowGet);
            }
            else
                return Json("ajaxerror", JsonRequestBehavior.AllowGet);
        }

        [AjaxOnly]
        public ActionResult DeleteLostFound(String lostfoundid)
        {
            if (LostFoundIDSanctityCheck(lostfoundid))
            {
                //lostFound = new LostFoundsModel();
                //lostFound.CommunityID = myCommunityID;
                //lostFound.LostFoundID = Convert.ToInt64(lostfoundid);
                //lostFound.ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                //lostFound.ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

                //lostFoundsDAL.DeleteLostFound(lostFound);
                return Json("success");
            }
            else
                return Json("dataerror", JsonRequestBehavior.AllowGet);
        }
        
        [AjaxOnly]
        [HttpPost]
        public ActionResult DeleteLostFounds(IEnumerable<Int64> lostFoundsselectedtodelete)
        {
            return Json(true);
            //if (Request.IsAjaxRequest())
            //{
            //    if (lostFoundsselectedtodelete.Count() != 0)
            //    {
            //        foreach (Int64 i in lostFoundsselectedtodelete)
            //        {
            //            lostFound = new LostFoundsModel();
            //            lostFound.LostFoundID = i;
            //            lostFound.ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
            //            lostFound.ModifiedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
            //            lostFound.ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

            //            lostFoundsList = new List<LostFoundsModel>();
            //            lostFoundsList.Add(lostFound);
            //        }
            //        return Json(Convert.ToString(lostFoundsDAL.DeleteLostFounds(lostFoundsList)));
            //    }
            //    else
            //        return Json("dataerror", JsonRequestBehavior.AllowGet);
            //}
            //else
            //    return Json("ajaxerror", JsonRequestBehavior.AllowGet);
        }

        #endregion

        /// <summary>
        /// Notice Module & Crud Operations
        /// </summary>
        /// <returns></returns>

        #region CRUD On Notices

        
        public ActionResult Notices()
        {   
            notice = new NoticesModel();
            notice.CommunityID = myCommunityID;
            ViewBag.NoticesList = noticesDAL.NoticesList(notice);

            if (TempData["NewNoticeID"] != null)
            {
                ViewBag.NewNoticeID = TempData["NewNoticeID"];
                Session.Remove("NewNoticeID");
            }

            return View("Notices");
        }

        [AjaxOnly]
        public PartialViewResult NoticesListTable()
        {
            notice = new NoticesModel();
            notice.CommunityID = myCommunityID;
            ViewBag.NoticesList = noticesDAL.NoticesList(notice);
            return PartialView("Partials/Notices/NoticesListTable");
        }

        [AjaxOnly]
        public ActionResult NewNotice()
        {
            notice = new NoticesModel();
            notice.CommunityID = myCommunityID;
            return PartialView("Partials/Notices/NewNotice", notice);
        }

        [HttpPost]
        [AjaxOnly]
        public ActionResult NewNotice(NoticesModel notice)
        {
            if (this.ModelState.IsValid)
            {
                notice.CreatedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                notice.CreatedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                return Json(noticesDAL.AddNotice(notice).ToString());
            }
            else
                return AjaxDataError("Notice");
        }

        [AjaxOnly]
        public ActionResult NoticeDetails(String noticeid)
        {
            if (NoticeIDSanctityCheck(noticeid))
            {
                notice = new NoticesModel();
                notice.NoticeID = Convert.ToInt64(noticeid);
                notice.CommunityID = myCommunityID;

                return PartialView("Partials/Notices/NoticeDetails", noticesDAL.NoticeDetails(notice));
            }
            else
                return AjaxParamError("Notice");
        }

        [AjaxOnly]
        public ActionResult EditNotice(String noticeid)
        {
            if (NoticeIDSanctityCheck(noticeid))
            {
                notice = new NoticesModel();
                notice.NoticeID = Convert.ToInt64(noticeid);
                notice.CommunityID = myCommunityID;

                return PartialView("Partials/Notices/EditNotice", noticesDAL.EditNotice(notice));
            }
            else
                return AjaxParamError("Notice");
        }
         

        [HttpPost]
        [AjaxOnly]
        public ActionResult UpdateNotice(NoticesModel notice)
        {
            if (this.ModelState.IsValid)
            {
                notice.ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                notice.ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                return Json(noticesDAL.UpdateNotice(notice));
            }
            else
                return AjaxDataError("Notice");
        }

        [AjaxOnly]
        public ActionResult DeleteNotice(String noticeid)
        {
            if (NoticeIDSanctityCheck(noticeid))
            {
                notice = new NoticesModel();
                notice.NoticeID = Int64.Parse(noticeid);
                notice.CommunityID = myCommunityID;
                notice.ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                notice.ModifiedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
                notice.ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                return Json(noticesDAL.DeleteNotice(notice));
            }
            else
                return AjaxParamError("Notice");
        }

        [HttpPost]
        [AjaxOnly]
        public ActionResult DeleteNotices(IEnumerable<Int64> noticesselectedtodelete)
        {
            return Json(true);
            //    if (noticesselectedtodelete.Count() != 0)
            //    {
            //        foreach (Int64 i in noticesselectedtodelete)
            //        {
            //            notice = new NoticesModel();
            //            notice.NoticeID = i;
            //            notice.ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
            //            notice.ModifiedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
            //            notice.ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

            //            noticesList = new List<NoticesModel>();
            //            noticesList.Add(notice);
            //        }
            //        return Json(Convert.ToString(noticesDAL.DeleteNotices(noticesList)));
            //    }                     
            //    else                    
            //        return Json("dataerror", JsonRequestBehavior.AllowGet);
        }

        #endregion

        /// <summary>
        /// Utility function those which helps in providing data.
        /// </summary>

        #region Utility functions

        private bool RoleIDSanctityCheck(String sentRoleID)
        {
            if (!String.IsNullOrEmpty(sentRoleID) && Byte.TryParse(sentRoleID, out outRoleID) == true)
                return true;
            else
                return false;
        }

        private bool AdministratorIDSanctityCheck(String sentAdministratorID)
        {
            if (!String.IsNullOrEmpty(sentAdministratorID) && Int64.TryParse(sentAdministratorID, out outAdministratorID) == true)
                return true;
            else
                return false;
        }

        private bool SecurityManagerIDSanctityCheck(String sentSecurityManagerID)
        {
            if (!String.IsNullOrEmpty(sentSecurityManagerID) && Int64.TryParse(sentSecurityManagerID, out outSecurityManagerID) == true)
                return true;
            else
                return false;
        }

        private bool SecurityPersonIDSanctityCheck(String sentSecurityPersonID)
        {
            if (!String.IsNullOrEmpty(sentSecurityPersonID) && Int64.TryParse(sentSecurityPersonID, out outSecurityPersonID) == true)
                return true;
            else
                return false;
        }

        private bool ServiceProviderIDSanctityCheck(String sentServiceProviderID)
        {
            if (!String.IsNullOrEmpty(sentServiceProviderID) && Int64.TryParse(sentServiceProviderID, out outServiceProviderID) == true)
                return true;
            else
                return false;
        }

        private bool HomeOwnerIDSanctityCheck(String sentHomeOwnerID)
        {
            if (!String.IsNullOrEmpty(sentHomeOwnerID) && Int64.TryParse(sentHomeOwnerID, out outHomeOwnerID) == true)
                return true;
            else
                return false;
        }

        private bool CommunityIDSanctityCheck(String sentCommunityID)
        {
            if (!String.IsNullOrEmpty(sentCommunityID) && Int16.TryParse(sentCommunityID, out myCommunityID))
                return true;
            else
                return false;
        }

        private bool NoticeIDSanctityCheck(String sentNoticeID)
        {
            if (!String.IsNullOrEmpty(sentNoticeID) && Int16.TryParse(sentNoticeID, out outNoticeID))
                return true;
            else
                return false;
        }

        private bool VisitorIDSanctityCheck(String sentVisitorID)
        {
            if (!String.IsNullOrEmpty(sentVisitorID) && Int16.TryParse(sentVisitorID, out outVisitorID))
                return true;
            else
                return false;
        }

        private bool MaintenanceIDSanctityCheck(String sentMaintenanceID)
        {
            if (!String.IsNullOrEmpty(sentMaintenanceID) && Int16.TryParse(sentMaintenanceID, out outMaintenanceID))
                return true;
            else
                return false;
        }

        private bool LostFoundIDSanctityCheck(String sentLostFoundID)
        {
            if (!String.IsNullOrEmpty(sentLostFoundID) && Int16.TryParse(sentLostFoundID, out outLostFoundID))
                return true;
            else
                return false;
        }

        //public void GetCommunityMenuOptions()
        //{
        //    if (Session["MenuOptions"] == null)
        //    //{
        //    //    CommunityMenuOptions communityMenuOption = new CommunityMenuOptions();
        //    //    communityMenuOption.CommunityID = Convert.ToInt16(Session["CommunityID"].ToString());
        //    //    CommunityMenuOptionsDAL communityMenuOptionsDAL = new CommunityMenuOptionsDAL();
        //    //    MenuOptionIDs = (communityMenuOptionsDAL.CommunityMenuOptionDetails(communityMenuOption)).MenuOptionIDs.ToString();
        //    //    ViewBag.MenuOptionsIDs = MenuOptionIDs;
        //        Session["MenuOptions"] = MenuOptionIDs;
        //    //}
        //    else
        //   // {
        //        MenuOptionIDs = Session["MenuOptions"].ToString();
        //    //}
        //}

        private void GetCommunities()
        {
            ViewBag.CommunitiesList = communitiesDAL.CommunitiesList();
        }

        private void GetMenuOptions()
        {            
            ViewBag.MenuOptionsList = MenuOptionsDAL.MenuOptionsList();
        }

        //private JsonResult GetHomeOwners()
        //{
        //    var list = new object[] { };

        //    homeOwner = new HomeOwnersModel();
        //    homeOwner.CommunityID = myCommunityID;

        //    homeOwnersList = homeOwnerDAL.HomeOwnersList(homeOwner);
        //    if (homeOwnersList != null)
        //    {
        //        foreach (HomeOwnersModel ho in homeOwnersList)
        //        {
        //            list = new object[]
        //            {
        //              new {value = ho.HomeOwnerID,name = ho.FirstName +"  "+ ho.LastName}  
        //            };
        //        }
        //    }
        //    return Json(list);
        //}

        private void GetHintQuestions()
        {
            if (Session["HintQuestionsList"] != null)
            {
                hintQuestionsList = (List<HintQuestionsModel>)Session["HintQuestionsList"];
            }
            else
            {
                hintQuestionsList = hintQuestionsDAL.HintQuestionsList();
                Session["HintQuestionsList"] = hintQuestionsList;
            }

            ViewBag.HintQuestionsList = new SelectList(hintQuestionsList, "HintQuestion", "HintQuestionID");
        }

        [HttpPost]
        private JsonResult UserNameAvailability(String userName)
        {
            //Thread.Sleep(3000);

            return Json(true);
        }

        private ActionResult AjaxParamError(String errorParam)
        {
            return Json("<span style='color: #FF0000'>" + errorParam + " parameter error </span>", JsonRequestBehavior.AllowGet);
        }

        private ActionResult AjaxDataError(String errorData)
        {
            return Json("<span style='color: #FF0000'>" + errorData + " parameter error </span>", JsonRequestBehavior.AllowGet);
        }

        #endregion
    }
}