using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using GateAccess.Models.Helper;
using System.Web.Security;

namespace GateAccess
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
            //filters.Add(new RequireAuthenticationAttribute());            
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "HomeDefault", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Default", id = UrlParameter.Optional } // Parameter defaults
            );

            routes.MapRoute(
                "SuperAdministratorDefault", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "SuperAdministrator", action = "Default", id = UrlParameter.Optional, communityid = UrlParameter.Optional, visitroid = UrlParameter.Optional, lostfoundid = UrlParameter.Optional, maintenanceid = UrlParameter.Optional, noticeid = UrlParameter.Optional, administratorid = UrlParameter.Optional, securitymanagerid = UrlParameter.Optional, securitypersonnelid = UrlParameter.Optional, homeownerid = UrlParameter.Optional, serviceproviderid = UrlParameter.Optional } // Parameter defaults
            );

            routes.MapRoute(
                "AdministratorDefault", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Administrator", action = "Default", id = UrlParameter.Optional, communityid = UrlParameter.Optional, visitroid = UrlParameter.Optional, lostfoundid = UrlParameter.Optional, maintenanceid = UrlParameter.Optional, noticeid = UrlParameter.Optional } // Parameter defaults
            );

            routes.MapRoute(
                "SecurityManagerDefault", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "SecurityManager", action = "Default", id = UrlParameter.Optional, communityid = UrlParameter.Optional, visitroid = UrlParameter.Optional, lostfoundid = UrlParameter.Optional, maintenanceid = UrlParameter.Optional, noticeid = UrlParameter.Optional } // Parameter defaults
            );

            routes.MapRoute(
                "SecurityPersonDefault", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "SecurityPersonnel", action = "Default", id = UrlParameter.Optional, communityid = UrlParameter.Optional, visitroid = UrlParameter.Optional, lostfoundid = UrlParameter.Optional, maintenanceid = UrlParameter.Optional, noticeid = UrlParameter.Optional } // Parameter defaults
            );

            routes.MapRoute(
                "HomeOwnerDefault", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "HomeOwner", action = "Default", id = UrlParameter.Optional, communityid = UrlParameter.Optional, visitroid = UrlParameter.Optional, lostfoundid = UrlParameter.Optional, maintenanceid = UrlParameter.Optional, noticeid = UrlParameter.Optional } // Parameter defaults
            );

            routes.MapRoute(
                "ServiceProviderDefault", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "ServiceProvider", action = "Default", id = UrlParameter.Optional, communityid = UrlParameter.Optional, visitroid = UrlParameter.Optional, lostfoundid = UrlParameter.Optional, maintenanceid = UrlParameter.Optional, noticeid = UrlParameter.Optional } // Parameter defaults
            );

            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Default", id = UrlParameter.Optional, communityid = UrlParameter.Optional, visitroid = UrlParameter.Optional, lostfoundid = UrlParameter.Optional, maintenanceid = UrlParameter.Optional, noticeid = UrlParameter.Optional } // Parameter defaults
            );
        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterRoutes(RouteTable.Routes);
        }

        //protected void Application_AuthenticateRequest(object sender, EventArgs e)
        //{
        //    if (HttpContext.Current.User != null)
        //    {

        //        // see if this user is authenticated, any authenticated cookie (ticket) exists for this user

        //        if (HttpContext.Current.User.Identity.IsAuthenticated)
        //        {

        //            // see if the authentication is done using FormsAuthentication

        //            if (HttpContext.Current.User.Identity is FormsIdentity)
        //            {

        //                // Get the roles stored for this request from the ticket

        //                // get the identity of the user

        //                FormsIdentity identity = (FormsIdentity)HttpContext.Current.User.Identity;

        //                // get the forms authetication ticket of the user

        //                FormsAuthenticationTicket ticket = identity.Ticket;

        //                // get the roles stored as UserData into the ticket

        //                string[] roles = ticket.UserData.Split(',');

        //                // create generic principal and assign it to the current request

        //                HttpContext.Current.User = new System.Security.Principal.GenericPrincipal(identity, roles);

        //            }
        //        }
        //    }
        //}
    }
}