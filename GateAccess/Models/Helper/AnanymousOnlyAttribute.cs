using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GateAccess.Models.Helper
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class AnonymousOnlyAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (filterContext.HttpContext.Request.IsAuthenticated)
            {
                if (filterContext.ActionDescriptor.ActionName != "LogOff")
                {
                    if (filterContext.HttpContext.Request.Cookies["myCookie"] != null)
                    {
                        HttpCookie useCookie = filterContext.HttpContext.Request.Cookies["myCookie"];

                        switch (useCookie["RoleID"].ToString())
                        {
                            case "1": filterContext.HttpContext.Response.Redirect("/SuperAdministrator/Default"); break;
                            case "2": filterContext.HttpContext.Response.Redirect("/Administrator/Default"); break;
                            case "3": filterContext.HttpContext.Response.Redirect("/SecurityManager/Default"); break;
                            case "4": filterContext.HttpContext.Response.Redirect("/SecurityPersonnel/Default"); break;
                            case "5": filterContext.HttpContext.Response.Redirect("/HomeOwner/Default"); break;
                            case "6": filterContext.HttpContext.Response.Redirect("/ServiceProvider/Default"); break;
                        }
                    }
                }
                else
                    base.OnActionExecuting(filterContext);
            }
            else
            {
                if (filterContext.HttpContext.Request.Cookies["myCookie"] != null)
                    filterContext.HttpContext.Request.Cookies.Remove("myCookie");
                base.OnActionExecuting(filterContext);
            }
        }
    }
}