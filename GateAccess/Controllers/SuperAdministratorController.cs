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
using GateAccess.Models.MVVM;


namespace GateAccess.Controllers
{
    [Authorize]
    public class SuperAdministratorController : BaseController
    {
        private CommunitiesDAL communitiesDAL = new CommunitiesDAL();
        private AccountDAL accountDAL = new AccountDAL();
        private AdministratorsDAL administratorsDAL = new AdministratorsDAL();
        private SecurityManagersDAL securityManagersDAL = new SecurityManagersDAL();
        private SecurityPersonnelsDAL securityPersonnelsDAL = new SecurityPersonnelsDAL();
        private HomeOwnersDAL homeOwnersDAL = new HomeOwnersDAL();
        private ServiceProvidersDAL serviceProvidersDAL = new ServiceProvidersDAL();

        private MaintenancesDAL maintenancesDAL = new MaintenancesDAL();
        private VisitorsDAL visitorsDAL = new VisitorsDAL();
        private LostFoundsDAL lostFoundsDAL = new LostFoundsDAL();        
        private NoticesDAL noticesDAL = new NoticesDAL();

        CommunitiesModel community, newCommunity;
        AdministratorsModel administrator, newAdministrator;
        EditAdministratorModel editAdministrator;
        SecurityManagersModel securityManager, newSecurityManager;
        EditSecurityManagerModel editSecurityManager;
        SecurityPersonnelsModel securityPersonnel, newSecurityPersonnel;
        EditSecurityPersonnelModel editSecurityPersonnel;
        HomeOwnersModel homeOwner, newHomeOwner;
        EditHomeOwnerModel editHomeOwner;
        ServiceProvidersModel serviceProvider, newServiceProvider;
        EditServiceProviderModel editServiceProvider;
        CommunityUsersByRole communityUsersByRole;

        MaintenancesModel maintenance, newMaintenance;
        VisitorsModel visitor, newVisitor;
        LostFoundsModel lostFound, newLostFound;
        NoticesModel notice, newNotice;
        
        Int16 outCommunityID;
        Int16 outNoticeID;
        Int16 outMaintenanceID;
        Int16 outLostFoundID;
        Int16 outVisitorID;

        Byte outRoleID;
        Int64 outAdministratorID;
        Int64 outHomeOwnerID;
        Int64 outSecurityManagerID;
        Int64 outSecurityPersonnelID;
        Int64 outServiceProviderID;

        
        List<CommunityUsersByRole> communityUsersByRoleList;
        //List<CommunitiesModel> communitiesList;
        //List<NoticesModel> noticesList;
        //List<MaintenancesModel> maintenancesList;
        //List<LostFoundsModel> lostFoundsList;
        //List<VisitorsModel> visitorsList;
      
        //List<AdministratorsModel> administratorsList;
        //List<SecurityManagersModel> securityManagersList;
        //List<SecurityPersonnelsModel> securityPersonnelsList;
        //List<HomeOwnersModel> homeOwnersList;
        //List<ServiceProvidersModel> serviceProvidersList;
        

        /// <summary>
        /// SuperAdministrator HomePage
        /// </summary>
        /// <returns></returns>

        public ActionResult Default()
        {
            return View();
        }

        /// <summary>
        /// Communitity Module & Crud Operations
        /// </summary>
        /// <returns></returns>

        #region Community


        [AjaxOnly]
        public ActionResult Communities()
        {
            return PartialView("Partials/Communities/_Communities", communitiesDAL.CommunitiesList());
        }

        [AjaxOnly]
        public ActionResult CommunitiesListTable()
        {
            return PartialView("Partials/Communities/CommunitiesListTable", communitiesDAL.CommunitiesList()); 
        }

        [AjaxOnly]
        public ActionResult NewCommunity()
        {
            newCommunity = new CommunitiesModel();
            return PartialView("Partials/Communities/NewCommunity", newCommunity);
        }

        [HttpPost]
        [AjaxOnly]
        public ActionResult NewCommunity(CommunitiesModel newcommunity)
        {           
            Int16 outInsertedCommunity = 0;
            if (this.ModelState.IsValid)
            {                
                newcommunity.CommunityCreatedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                newcommunity.CommunityCreatedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                newcommunity.CommunityCreatedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
                if (Int16.TryParse(communitiesDAL.AddCommunity(newcommunity).ToString(), out outInsertedCommunity))
                {
                    Session["NewCommunityID"] = outInsertedCommunity;
                    return Json(Boolean.TrueString);
                }
                else
                    return Json(Boolean.FalseString);
                
                
            }
            else
            {
                return PartialView("Partials/Communities/NewCommunity", newcommunity);
            }
        }

        //[AjaxOnly]        
        //public ActionResult CommunityDetails(String communityid)
        //{
        //    if (CommunityIDSanctityCheck(communityid))
        //    {
        //        community = new CommunitiesModel();
        //        community.CommunityID = outCommunityID;
            
        //        return PartialView("Partials/Communities/CommunityDetails", communitiesDAL.CommunityDetails(community));
        //    }
        //    else
        //        return AjaxParamError("Community");
        //}

        [AjaxOnly]
        public ActionResult EditCommunity(String communityid)
        {           
            if (CommunityIDSanctityCheck(communityid))
            {
                community = new CommunitiesModel();
                community.CommunityID = outCommunityID;

                return PartialView("Partials/Communities/EditCommunity", communitiesDAL.EditCommunity(community));
            }
            else
                return AjaxParamError("Community");            
        }

        [HttpPost]
        [AjaxOnly]
        public ActionResult UpdateCommunity(CommunitiesModel editcommunity)
        {            
            Int16 outUpdatedCommunity;
            if (this.ModelState.IsValid)
            {
                editcommunity.CommunityModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                editcommunity.CommunityModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                editcommunity.CommunityModifiedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
                
                if (Int16.TryParse(Convert.ToString(communitiesDAL.UpdateCommunity(editcommunity)), out outUpdatedCommunity))
                {
                    Session["UpdatedCommunityID"] = editcommunity.CommunityID;
                    return Json(Boolean.TrueString);
                }
                else
                    return Json(Boolean.FalseString);
            }
            else
            {
                return PartialView("Partials/Communities/EditCommunity", editcommunity);
            }        
        }

        [AjaxOnly]
        public ActionResult DeleteCommunity(String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                community = new CommunitiesModel();
                community.CommunityID = outCommunityID;;
                community.CommunityModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                community.CommunityModifiedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
                community.CommunityModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

                return Json(communitiesDAL.DeleteCommunity(community));
            }
            else
                return AjaxParamError("Community");
        }
       
        [AjaxOnly]
        [HttpPost]
        public ActionResult DeleteCommunities(String selctedcommunities)
        {
            if (selctedcommunities != null && selctedcommunities.Count() != 0)
            {        
                return Json(communitiesDAL.DeleteCommunities(selctedcommunities, Convert.ToInt64(useMyCookie["UserID"].ToString()), Convert.ToByte(useMyCookie["RoleID"].ToString())));
            }
            else
                return AjaxParamError("Communities");
        }


        #endregion

        /// <summary>
        /// Registration of Users By Roles wise
        /// </summary>
        /// <returns></returns>        

        #region Registration of Users By Role wise


        [AjaxOnly]
        public ActionResult RegistrationPartial(String roleid, String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                if (RoleIDSanctityCheck(roleid))
                {
                    String partial = null;                   
                    Object loadModel = null;
                    switch (roleid)
                    {
                        case "2": partial = "Administrators/NewAdministrator";
                            newAdministrator = new AdministratorsModel();
                            newAdministrator.CommunityID = outCommunityID;                            
                            loadModel = newAdministrator;
                            break;
                        case "3": partial = "SecurityManagers/NewSecurityManager";
                            newSecurityManager = new SecurityManagersModel();
                            newSecurityManager.CommunityID = outCommunityID;
                            
                            loadModel = newSecurityManager;
                            break;
                        case "4": partial = "SecurityPersonnels/NewSecurityPersonnel";
                            newSecurityPersonnel = new SecurityPersonnelsModel();
                            newSecurityPersonnel.CommunityID = outCommunityID;
                           
                            loadModel = newSecurityPersonnel;
                            break;
                        case "5": partial = "HomeOwners/NewHomeOwner";
                            newHomeOwner = new HomeOwnersModel();
                            newHomeOwner.CommunityID = outCommunityID;
                          
                            loadModel = newHomeOwner;
                            break;
                        case "6": partial = "ServiceProviders/NewServiceProvider";
                            newServiceProvider = new ServiceProvidersModel();
                            newServiceProvider.CommunityID = outCommunityID;
                           
                            loadModel = newServiceProvider;
                            break;
                    }
                   
                    return PartialView("Partials/Users/" + partial, loadModel);
                }
                else
                    return AjaxParamError("Role");
            }
            else
                return AjaxParamError("Community");
        }

        private void NewServiceProvider(ref ServiceProvidersModel newserviceprovider)
        {
            serviceProvidersDAL.NewServiceProviderCommunity(ref newserviceprovider);
        }

        private void NewHomeOwnerCommunity(ref HomeOwnersModel newhomeowner)
        {
            homeOwnersDAL.NewHomeOwnerCommunity(ref newhomeowner);
        }

        private void NewSecurityPersonnelCommunity(ref SecurityPersonnelsModel newsecuritypersonnel)
        {
            securityPersonnelsDAL.NewSecurityPersonnelCommunity(ref newsecuritypersonnel);
        }

        private void NewSecurityManagerCommunity(ref SecurityManagersModel newsecuritymanager)
        {
            securityManagersDAL.NewSecurityManagerCommunity(ref newsecuritymanager);
        }

        private void NewAdministratorCommunity(ref AdministratorsModel newadministrator)
        {
            administratorsDAL.NewAdministratorCommunity(ref newadministrator);
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
                    return Json(false);               
            }
            else
                return Json(new { errors = GetErrorsFromModelState(), errorPartial = RenderPartialViewToString("Partials/Users/Administrators/NewAdministrator", administrator) });
        }

        [HttpPost]
        [AjaxOnly]
        public ActionResult NewSecurityManager(SecurityManagersModel securitymanager)
        {
            if (this.ModelState.IsValid)
            {
                securitymanager.SM_CreatedOn = Convert.ToDateTime(DateTime.Now.ToString());
                securitymanager.SM_CreatedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                securitymanager.SM_CreatedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());

                return Json(securityManagersDAL.AddSecurityManager(securitymanager));
            }
            else
                return AjaxDataError("SecurityManager");
        }

        [HttpPost]
        [AjaxOnly]
        public ActionResult NewSecurityPersonnel(SecurityPersonnelsModel securitypersonnel)
        {
            if (this.ModelState.IsValid)
            {
                securitypersonnel.SP_CreatedOn = Convert.ToDateTime(DateTime.Now.ToString());
                securitypersonnel.SP_CreatedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                securitypersonnel.SP_CreatedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());

                return Json(securityPersonnelsDAL.AddSecurityPersonnel(securitypersonnel));
            }
            else
                return AjaxDataError("SecurityPersonnel");
        }

        [AjaxOnly]
        [HttpPost]
        public ActionResult NewHomeOwner(HomeOwnersModel homeowner)
        {
            if (this.ModelState.IsValid)
            {                
                homeowner.HO_CreatedOn = Convert.ToDateTime(DateTime.Now.ToString());
                homeowner.HO_CreatedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                homeowner.HO_CreatedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
                return Json(homeOwnersDAL.AddHomeOwner(homeowner));
            }
            else
                return AjaxDataError("HomeOwner");
        }

        [AjaxOnly]
        [HttpPost]
        public ActionResult NewServiceProvider(ServiceProvidersModel serviceprovider)
        {
            if (this.ModelState.IsValid)
            {                
                serviceprovider.SRP_CreatedOn = Convert.ToDateTime(DateTime.Now.ToString());
                serviceprovider.SRP_CreatedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                serviceprovider.SRP_CreatedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
                serviceProvidersDAL.AddServiceProvider(serviceprovider);
                return null;
            }
            else
                return View(serviceprovider);
        }


        #endregion

        /// <summary>
        /// Display of Users by Role wise
        /// </summary>
        /// <returns></returns>

        #region Users By Role

        [AjaxOnly]
        public ActionResult Users()
        {
            GetCommunities();
            return View("Partials/Users/_Users");
        }

        [AjaxOnly]
        public ActionResult RolesList(String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                community = new CommunitiesModel();
                community.CommunityID = outCommunityID;;

                communityUsersByRole = new CommunityUsersByRole();
                communityUsersByRole.CommunityID = outCommunityID;;
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
                return PartialView("Partials/Users/RolesList");
            }
            return Json("Community");
        }

        [AjaxOnly]
        public ActionResult UsersList(String roleid, String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
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
                    return PartialView("Partials/Users/" + listpartial, ViewBag.Model);
                }
                else
                    return AjaxParamError("Role");
            }
            else
                return AjaxParamError("Community");
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
            administrator.CommunityID = outCommunityID;
            ViewBag.Model = administratorsDAL.AdministratorsList(administrator);
        }

        [AjaxOnly]
        public ActionResult AdministratorsListTable(String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                administrator = new AdministratorsModel();
                administrator.CommunityID = outCommunityID;;
                return PartialView("Partials/Users/Administrators/AdministratorsListTable", administratorsDAL.AdministratorsList(administrator));
            }
            else
                return Json("Community");
        }


        [AjaxOnly]
        public ActionResult AdministratorDetails(String administratorid, String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                if (AdministratorIDSanctityCheck(administratorid))
                {
                    administrator = new AdministratorsModel();
                    administrator.CommunityID = outCommunityID;
                    administrator.AdministratorID = Convert.ToInt64(administratorid);                    
                   
                    return PartialView("Partials/Users/Administrators/AdministratorDetails",administratorsDAL.AdministratorDetails(administrator));
                }
                else
                    return AjaxParamError("Administrator");
            }
            else
                return AjaxParamError("Community");
        }

        [AjaxOnly]
        public ActionResult EditAdministrator(String administratorid, String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                if (AdministratorIDSanctityCheck(administratorid))
                {
                    editAdministrator = new EditAdministratorModel();
                    editAdministrator.CommunityID = outCommunityID;
                    editAdministrator.AdministratorID = Convert.ToInt64(administratorid);
                    
                    return PartialView("Partials/Users/Administrators/EditAdministrator", administratorsDAL.EditAdministrator(editAdministrator));
                }
                else
                    return AjaxParamError("Admisitrator");
            }
            else
                return AjaxParamError("Community");
            
        }

        [AjaxOnly]
        [HttpPost]
        public ActionResult UpdateAdministrator(EditAdministratorModel editAdministrator)
        {
            if (this.ModelState.IsValid)
            {
                editAdministrator.Admin_ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                editAdministrator.Admin_ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                editAdministrator.Admin_ModifiedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());

                if (Convert.ToString(administratorsDAL.UpdateAdministrator(editAdministrator)) == "SUCCESS")
                {
                    Session["UpdatedAdministratorID"] = editAdministrator.AdministratorID;
                    return Json(Boolean.TrueString);
                }
                else
                    return Json(Boolean.FalseString);
            }
            else
            {
                return PartialView("Partials/Users/Administrators/EditAdministrator", editAdministrator);              
            }    
        }

        [AjaxOnly]
        public ActionResult DeleteAdministrator(String administratorid, String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                if (AdministratorIDSanctityCheck(administratorid))
                {
                    administrator = new AdministratorsModel();
                    administrator.CommunityID = outCommunityID;
                    administrator.AdministratorID = Convert.ToInt64(administratorid);
                    administrator.Admin_ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                    administrator.Admin_ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                    return Json(administratorsDAL.DeleteAdministrator(administrator).ToString());
                }
                else return AjaxParamError("Administrator");
            }
            else
                return AjaxParamError("Community");
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
            securityManager.CommunityID = outCommunityID;
            ViewBag.Model = securityManagersDAL.SecurityManagersList(securityManager);
        }

        [AjaxOnly]
        public ActionResult SecurityManagersListTable(String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                securityManager = new SecurityManagersModel();
                securityManager.CommunityID = outCommunityID;;
                return PartialView("Partials/Users/SecurityManagers/SecurityManagersListTable", securityManagersDAL.SecurityManagersList(securityManager));
            }
            else
                return AjaxParamError("Community");
        }

        public ActionResult SecurityManagerDetails(String securitymanagerid, String communityid)
        {
            if(CommunityIDSanctityCheck(communityid))
            {
                if (SecurityManagerIDSanctityCheck(securitymanagerid))
                {
                    securityManager = new SecurityManagersModel();
                    securityManager.CommunityID = outCommunityID;;
                    securityManager.SecurityManagerID = outSecurityManagerID;
                    
                    return PartialView("Partials/Users/SecurityManagers/SecurityManagerDetails", securityManagersDAL.SecurityManagerDetails(securityManager));
                }
                else
                    return AjaxParamError("SecurityManager");                
            }
            else
                return AjaxParamError("Community");
        }

        [AjaxOnly]
        public ActionResult EditSecurityManager(String securitymanagerid, String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                if (SecurityManagerIDSanctityCheck(securitymanagerid))
                {
                    editSecurityManager = new EditSecurityManagerModel();
                    editSecurityManager.CommunityID = outCommunityID;
                    editSecurityManager.SecurityManagerID = outSecurityManagerID;

                    return PartialView("Partials/Users/SecurityManagers/EditSecurityManager", securityManagersDAL.EditSecurityManager(editSecurityManager));
                }
                else
                    return AjaxParamError("SecurityManager");
            }
            else
                return AjaxParamError("Community");
        }

        [HttpPost]
        public ActionResult UpdateSecurityManager(EditSecurityManagerModel editsecuritymanager)
        {
            if (this.ModelState.IsValid)
            {
                editsecuritymanager.CommunityID = outCommunityID;
                editsecuritymanager.SM_ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                editsecuritymanager.SM_ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                return Json(securityManagersDAL.UpdateSecurityManager(editsecuritymanager).ToString());
            }
            else
                return AjaxDataError("SecurityManager");
        }

        public ActionResult DeleteSecurityManager(String securitymanagerid, String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                if (SecurityManagerIDSanctityCheck(securitymanagerid))
                {
                    securityManager = new SecurityManagersModel();
                    securityManager.CommunityID = outCommunityID;;
                    securityManager.SecurityManagerID = outSecurityManagerID;
                    securityManager.SM_ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                    securityManager.SM_ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

                    return Json(securityManagersDAL.DeleteSecurityManager(securityManager).ToString());
                }
                else return AjaxParamError("SecurityManager");
            }
            else
                return AjaxParamError("Community");
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
            securityPersonnel.CommunityID = outCommunityID;
            ViewBag.Model = securityPersonnelsDAL.SecurityPersonnelsList(securityPersonnel);
        }

        public ActionResult SecurityPersonnelsListTable(String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                securityPersonnel = new SecurityPersonnelsModel();
                securityPersonnel.CommunityID = outCommunityID;

                return PartialView("Partials/Users/SecurityPersonnels/SecurityPersonnelsListTable", securityPersonnelsDAL.SecurityPersonnelsList(securityPersonnel));
            }
            else
                return AjaxParamError("Community");
        }


        //public ActionResult SecurityPersonnelDetails(String securitypersonnelid, String communityid)
        //{
        //    if (CommunityIDSanctityCheck(communityid))
        //    {
        //        if (SecurityPersonnelIDSanctityCheck(securitypersonnelid))
        //        {
        //            securityPersonnel = new SecurityPersonnelsModel();
        //            securityPersonnel.CommunityID = outCommunityID;
        //            securityPersonnel.SecurityPersonnelID = Convert.ToInt64(securitypersonnelid);
                    
        //            return PartialView("Partials/Users/SecurityPersonnels/SecurityPersonnelDetails", securityPersonnelsDAL.SecurityPersonnelDetails(securityPersonnel));
        //        }
        //        else
        //            return AjaxParamError("SecurityPersonnel");
        //    }
        //    else
        //        return AjaxParamError("Community");
        //}
        
        public ActionResult EditSecurityPersonnel(String securitypersonnelid, String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                if (SecurityPersonnelIDSanctityCheck(securitypersonnelid))
                {
                    editSecurityPersonnel = new EditSecurityPersonnelModel();
                    editSecurityPersonnel.CommunityID = outCommunityID;
                    editSecurityPersonnel.SecurityPersonnelID = outSecurityPersonnelID;

                    return PartialView("Partials/Users/SecurityPersonnels/EditSecurityPersonnel", securityPersonnelsDAL.EditSecurityPersonnel(editSecurityPersonnel));
                }
                else
                    return AjaxParamError("SecurityPersonnel");
            }
            else
                return AjaxParamError("Community");
        }
        
        [HttpPost]
        public ActionResult UpdateSecurityPersonnel(EditSecurityPersonnelModel editsecuritypersonnel)
        {
            if (this.ModelState.IsValid)
            {
                editsecuritypersonnel.CommunityID = outCommunityID;
                editsecuritypersonnel.SP_ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                editsecuritypersonnel.SP_ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                editsecuritypersonnel.SP_ModifiedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
                return Json(securityPersonnelsDAL.UpdateSecurityPerson(editsecuritypersonnel));
            }
            else
                return AjaxDataError("SecurityPersonnel");
        }
        
        public ActionResult DeleteSecurityPersonnel(String securitypersonnelid, String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                if (SecurityPersonnelIDSanctityCheck(securitypersonnelid))
                {
                    securityPersonnel = new SecurityPersonnelsModel();
                    securityPersonnel.CommunityID = outCommunityID;
                    securityPersonnel.SecurityPersonnelID = outSecurityPersonnelID;
                    securityPersonnel.SP_ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                    securityPersonnel.SP_ModifiedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
                    securityPersonnel.SP_ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

                    return Json(securityPersonnelsDAL.DeleteSecurityPersonnel(securityPersonnel));
                }
                else
                    return AjaxParamError("SecurityPersonnel");
            }
            else
                return AjaxParamError("Community");
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
            homeOwner.CommunityID = outCommunityID;
            ViewBag.Model = homeOwnersDAL.HomeOwnersList(homeOwner);            
        }
        
        public ActionResult HomeOwnersListTable(String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                homeOwner = new HomeOwnersModel();
                homeOwner.CommunityID = outCommunityID;
                return PartialView("Partials/Users/HomeOwners/HomeOwnersListTable", homeOwnersDAL.HomeOwnersList(homeOwner));
            }
            else
                return AjaxParamError("Community");        
        }

        public ActionResult HomeOwnerDetails(String homeownerid, String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                if (HomeOwnerIDSanctityCheck(homeownerid))
                {
                    homeOwner = new HomeOwnersModel();
                    homeOwner.CommunityID = outCommunityID;
                    homeOwner.HomeOwnerID = Convert.ToInt64(homeownerid);
                    return PartialView("Partials/Users/HomeOwners/HomeOwnerDetails", homeOwnersDAL.HomeOwnerDetails(homeOwner));
                }
                else
                    return AjaxParamError("HomeOwner");
            }
            else
                return AjaxParamError("Community");
        }

        public ActionResult EditHomeOwner(String homeownerid, String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                if (HomeOwnerIDSanctityCheck(homeownerid))
                {
                    editHomeOwner = new EditHomeOwnerModel();
                    editHomeOwner.CommunityID = outCommunityID;
                    editHomeOwner.HomeOwnerID = Convert.ToInt64(homeownerid);
                    
                    return PartialView("Partials/Users/HomeOwners/EditHomeOwner", homeOwnersDAL.EditHomeOwner(editHomeOwner));
                }
                else
                    return AjaxParamError("HomeOwner");
            }
            else
                return AjaxParamError("Community");
        }
        
        [HttpPost]
        public ActionResult UpdateHomeOwner(HomeOwnersModel homeOwner)
        {
            if (this.ModelState.IsValid)
            {
                homeOwner.CommunityID = outCommunityID;
                homeOwner.HO_ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                homeOwner.HO_ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                return Json(homeOwnersDAL.UpdateHomeOwner(homeOwner));
            }
            else
                return AjaxDataError("HomeOwner");
        }

        public ActionResult DeleteHomeOwner(String homeownerid, String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                if (HomeOwnerIDSanctityCheck(homeownerid))
                {
                    homeOwner = new HomeOwnersModel();
                    homeOwner.CommunityID = outCommunityID;
                    homeOwner.HomeOwnerID = Convert.ToInt64(homeownerid);
                    homeOwner.HO_ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                    homeOwner.HO_ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

                    return Json(homeOwnersDAL.DeleteHomeOwner(homeOwner));
                }
                else
                    return AjaxParamError("HomeOwner");
            }
            else
                return AjaxParamError("Community");
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
            serviceProvider.CommunityID = outCommunityID;
            ViewBag.Model = serviceProvidersDAL.ServiceProvidersList(serviceProvider);
        }

        [AjaxOnly]
        public ActionResult ServiceProvidersListTable(String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                serviceProvider = new ServiceProvidersModel();
                serviceProvider.CommunityID = outCommunityID;
                return PartialView("Partials/Users/ServiceProviders/ServiceProvidersListTable", serviceProvidersDAL.ServiceProvidersList(serviceProvider));
            }
            else
                return AjaxParamError("Community");
        }

        [AjaxOnly]
        public ActionResult ServiceProviderDetails(String serviceproviderid, String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                if (ServiceProviderIDSanctityCheck(serviceproviderid))
                {
                    serviceProvider = new ServiceProvidersModel();
                    serviceProvider.CommunityID = outCommunityID;
                    serviceProvider.ServiceProviderID = outServiceProviderID;
                    return PartialView("Partials/Users/ServiceProviders/ServiceProviderDetails", serviceProvidersDAL.ServiceProviderDetails(serviceProvider));
                }
                else
                    return AjaxParamError("ServiceProvider");
            }
            else
                return AjaxParamError("Community");
        }

        [AjaxOnly]
        public ActionResult EditServiceProvider(String serviceproviderid, String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                if (ServiceProviderIDSanctityCheck(serviceproviderid))
                {
                    serviceProvider = new ServiceProvidersModel();
                    serviceProvider.CommunityID = outCommunityID;
                    serviceProvider.ServiceProviderID = outServiceProviderID;
                    
                    return PartialView("Partials/Users/ServiceProviders/EditServiceProvider", serviceProvidersDAL.EditServiceProvider(serviceProvider));
                }
                else
                    return AjaxParamError("ServiceProvider");
            }
            else
                return AjaxParamError("Community");
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
        public ActionResult DeleteServiceProvider(String serviceproviderid, String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                if (ServiceProviderIDSanctityCheck(serviceproviderid))
                {
                    serviceProvider = new ServiceProvidersModel();
                    serviceProvider.CommunityID = outCommunityID;
                    serviceProvider.ServiceProviderID = outServiceProviderID;
                    serviceProvider.SRP_ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                    serviceProvider.SRP_ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

                    return Json(serviceProvidersDAL.DeleteServiceProvider(serviceProvider));
                }
                else
                    return AjaxParamError("ServiceProvider");
            }
            else
                return AjaxParamError("Community");
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
            return View("Partials/Visitors/_Visitors");
        }       

        [AjaxOnly]
        public ActionResult NewVisitor(String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                community = new CommunitiesModel();
                community.CommunityID = outCommunityID;
                return PartialView("Partials/Visitors/NewVisitor", community);
            }
            else
                return AjaxParamError("Community");
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

        [AjaxOnly]
        public ActionResult VisitorsList(String communityid)
        {
            return PartialView("");
        }

        [AjaxOnly]
        public ActionResult VisitorsListTable(String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                ViewBag.VisitorsList = visitorsDAL.VisitorsList(visitor);
                return PartialView("Partials/Visitors/VisitorsListTable");
            }
            else
                return AjaxParamError("Community");
        }
        
        public ActionResult VisitorDetails(String visitorid)
        {
            if (VisitorIDSanctityCheck(visitorid))
            {
                visitor = new VisitorsModel();
                visitor.VisitorID = Convert.ToInt64(visitorid.ToString());
                ViewBag.VisitorDetails = visitorsDAL.VisitorDetails(visitor);
                return View();
            }
            else
                return AjaxParamError("Visitor");
        }
        
        public ActionResult EditVisitor(String visitorid)
        {
            visitor = new VisitorsModel();
            visitor.VisitorID = Convert.ToInt64(visitorid.ToString());
            ViewBag.VisitorDetails = visitorsDAL.VisitorDetails(visitor);
            return View();
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

        public JsonResult CommunityHouseOwners(String communityid)
        {
            if (Request.IsAjaxRequest())
            {
                community = new CommunitiesModel();
                community.CommunityID = outCommunityID;
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

        [AjaxOnly]
        public ActionResult Maintenances()
        {
            GetCommunities();
            return PartialView("Partials/Maintenances/_Maintenances");
        }

        [AjaxOnly]
        public ActionResult MaintenancesList(String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                maintenance = new MaintenancesModel();
                maintenance.CommunityID = outCommunityID;
                return PartialView("Partials/Maintenances/MaintenancesList", maintenancesDAL.MaintenanceList(maintenance));
            }
            else
                return AjaxParamError("Community");
        }

        [AjaxOnly]
        public ActionResult MaintenancesListTable(String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                maintenance = new MaintenancesModel();
                maintenance.CommunityID = outCommunityID;                
                return PartialView("Partials/Maintenances/MaintenancesListTable", maintenancesDAL.MaintenanceList(maintenance));
            }
            else
                return AjaxParamError("Community");
        }

        [AjaxOnly]
        public ActionResult NewMaintenance(String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                maintenance = new MaintenancesModel();
                maintenance.CommunityID = outCommunityID;
                return PartialView("Partials/Maintenances/NewMaintenance", maintenance);
            }
            else
                return AjaxParamError("Community");
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
        public ActionResult MaintenanceDetails(String maintenanceid, String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                if (MaintenanceIDSanctityCheck(maintenanceid))
                {
                    maintenance = new MaintenancesModel();
                    maintenance.CommunityID = outCommunityID;
                    maintenance.MaintenanceID = Convert.ToInt64(maintenanceid.ToString());

                    return PartialView("Partials/Maintenances/MaintenanceDetails", maintenancesDAL.MaintenanceDetails(maintenance));
                }
                else
                    return AjaxParamError("Maintenance");
            }
            else
                return AjaxParamError("Community");
        }

        [AjaxOnly]
        public ActionResult EditMaintenance(String maintenanceid, String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                if (MaintenanceIDSanctityCheck(maintenanceid))
                {
                    maintenance = new MaintenancesModel();
                    maintenance.CommunityID = outCommunityID;
                    maintenance.MaintenanceID = Convert.ToInt64(maintenanceid.ToString());

                    return PartialView("Partials/Maintenances/EditMaintenance", maintenancesDAL.EditMaintenance(maintenance));
                }
                else
                    return AjaxParamError("Maintenance");
            }
            else
                return AjaxParamError("Community");
        }

        [AjaxOnly]
        [HttpPost]
        public ActionResult UpdateMaintenance(MaintenancesModel maintenance)
        {
            if (ModelState.IsValid)
            {
                maintenance.ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                maintenance.ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

                return Json(maintenancesDAL.UpdateMaintenance(maintenance));
            }
            else
                return AjaxDataError("Maitenance");
        }

        [AjaxOnly]
        public ActionResult DeleteMaintenance(String maintenanceid, String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                if (MaintenanceIDSanctityCheck(maintenanceid))
                {
                    maintenance.CommunityID = outCommunityID;
                    maintenance.MaintenanceID = outMaintenanceID;
                    maintenance.ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                    maintenance.ModifiedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
                    maintenance.ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

                    return Json(maintenancesDAL.DeleteMaintenance(maintenance));
                }
                else
                    return AjaxParamError("Maintenance");
            }
            else
                return AjaxParamError("Community");
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

        [AjaxOnly]
        public ActionResult LostFounds(String communityid)
        {
            GetCommunities();
            return View("Partials/LostFounds/_LostFounds");
        }

        [AjaxOnly]
        public ActionResult LostFoundsList(String communityid)
        {
            lostFound = new LostFoundsModel();
            lostFound.CommunityID = outCommunityID;

            lostFoundsDAL = new LostFoundsDAL();
            ViewBag.LostFoundsList = lostFoundsDAL.LostFoundList(lostFound);
            return View("Partials/LostFounds/LostFoundsList");
        }

        [AjaxOnly]
        public PartialViewResult LostFoundsListTable(String communityid)
        {
            lostFound = new LostFoundsModel();
            lostFound.CommunityID = outCommunityID;

            lostFoundsDAL = new LostFoundsDAL();
            ViewBag.LostFoundsList = lostFoundsDAL.LostFoundList(lostFound);
            return PartialView("Partials/LostFounds/LostFoundsListTable");
        }

        [AjaxOnly]
        public ActionResult NewLostFound(String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                lostFound.CommunityID = outCommunityID;
                return PartialView("Partials/LostFounds/NewLostFound", lostFound);
            }
            else
                return AjaxParamError("Community");
        }


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


        public ActionResult LostFoundDetails(String lostfoundid, String communityid)
        {
            lostFound = new LostFoundsModel();
            lostFound.CommunityID = outCommunityID;
            lostFound.LostFoundID = Convert.ToInt64(lostfoundid.ToString());

            lostFoundsDAL = new LostFoundsDAL();
            ViewBag.LostFoundDetails = lostFoundsDAL.LostFoundDetails(lostFound);

            return View();
        }


        public ActionResult EditLostFound(String lostfoundid, String communityid)
        {
            lostFound = new LostFoundsModel();
            lostFound.CommunityID = outCommunityID;
            lostFound.LostFoundID = Convert.ToInt64(lostfoundid);

            lostFoundsDAL = new LostFoundsDAL();
            ViewBag.LostFoundDetails = lostFoundsDAL.LostFoundDetails(lostFound);

            return View();
        }


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


        public ActionResult DeleteLostFound(String lostfoundid, String communityid)
        {
            if (Request.IsAjaxRequest())
            {
                if (CommunityIDSanctityCheck(communityid))
                {
                    //lostFound = new LostFoundsModel();
                    //lostFound.CommunityID = outCommunityID;
                    //lostFound.LostFoundID = Convert.ToInt64(lostfoundid);
                    //lostFound.ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                    //lostFound.ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());

                    //lostFoundsDAL.DeleteLostFound(lostFound);
                    return Json("success");
                }
                else
                    return Json("dataerror", JsonRequestBehavior.AllowGet);
            }
            else
                return Json("ajaxerror", JsonRequestBehavior.AllowGet);
        }

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

        [AjaxOnly]
        public ActionResult Notices()
        {
            GetCommunities();
            return PartialView("Partials/Notices/_Notices");
        }

        [AjaxOnly]
        public ActionResult NoticesList(String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                notice = new NoticesModel();
                notice.CommunityID = outCommunityID;                

                if (TempData["NewNoticeID"] != null)
                {
                    ViewBag.NewNoticeID = TempData["NewNoticeID"];
                    Session.Remove("NewNoticeID");  
                }

                return PartialView("Partials/Notices/NoticesList", noticesDAL.NoticesList(notice));
            }
            else
                return AjaxParamError("community");
        }

        [AjaxOnly]
        public PartialViewResult NoticesListTable(String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                notice = new NoticesModel();
                notice.CommunityID = outCommunityID;

                return PartialView("Partials/Notices/NoticesListTable", noticesDAL.NoticesList(notice));
            }
            else
                return null;
        }

        [AjaxOnly]
        public ActionResult NewNotice(String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                notice = new NoticesModel();
                notice.CommunityID = outCommunityID;
                return PartialView("Partials/Notices/NewNotice", notice);
            }
            else
                return AjaxParamError("Community");
        }

        [HttpPost]
        [AjaxOnly]
        public ActionResult NewNotice(NoticesModel notice)
        {
            if (this.ModelState.IsValid)
            {
                notice.CreatedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                notice.CreatedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
                notice.CreatedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                return Json(noticesDAL.AddNotice(notice).ToString());
            }
            else
                return Json("dataerror", JsonRequestBehavior.AllowGet);
        }

        [AjaxOnly]
        public ActionResult NoticeDetails(String noticeid, String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                if (NoticeIDSanctityCheck(noticeid))
                {
                    notice = new NoticesModel();
                    notice.NoticeID = Convert.ToInt64(noticeid);
                    notice.CommunityID = outCommunityID;

                    return PartialView("Partials/Notices/NoticeDetails", noticesDAL.NoticeDetails(notice));
                }
                else
                    return AjaxParamError("Notice");
            }
            else
                return AjaxParamError("Community");
        }

        [AjaxOnly]
        public ActionResult EditNotice(String noticeid, String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                if (NoticeIDSanctityCheck(noticeid))
                {
                    notice = new NoticesModel();
                    notice.NoticeID = Convert.ToInt64(noticeid);
                    notice.CommunityID = outCommunityID;

                    return PartialView("Partials/Notices/EditNotice", noticesDAL.EditNotice(notice));
                }
                else
                    return AjaxParamError("Notice");
            }
            else
                return AjaxParamError("Community");        
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
        public ActionResult DeleteNotice(String noticeid, String communityid)
        {
            if (CommunityIDSanctityCheck(communityid))
            {
                if (NoticeIDSanctityCheck(noticeid))
                {
                    notice = new NoticesModel();
                    notice.NoticeID = outNoticeID;
                    notice.CommunityID = outCommunityID;
                    notice.ModifiedUserID = Convert.ToInt64(useMyCookie["UserID"].ToString());
                    notice.ModifiedRoleID = Convert.ToByte(useMyCookie["RoleID"].ToString());
                    notice.ModifiedOn = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                    return Json(noticesDAL.DeleteNotice(notice));
                }
                else
                    return AjaxParamError("Notice");
            }
            else
                return AjaxParamError("Community");
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

        private bool SecurityPersonnelIDSanctityCheck(String sentSecurityPersonnelID)
        {
            if (!String.IsNullOrEmpty(sentSecurityPersonnelID) && Int64.TryParse(sentSecurityPersonnelID, out outSecurityPersonnelID) == true)
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
            if (!String.IsNullOrEmpty(sentCommunityID) && Int16.TryParse(sentCommunityID, out outCommunityID))
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

        private void GetCommunities()
        {
            ViewBag.CommunitiesList = communitiesDAL.CommunitiesList();
        }


        //private JsonResult GetHomeOwners(String communityid)
        //{
        //    var list = new object[] { };

        //    homeOwner = new HomeOwnersModel();
        //    homeOwner.CommunityID = outCommunityID;

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