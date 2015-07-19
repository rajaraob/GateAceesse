using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GateAccess.Models.Helper;

namespace GateAccess.Controllers
{
    
    public class HomeController : Controller
    {
        [AnonymousOnly]         
        public ActionResult Default()
        {            
            ViewBag.Message = "Welcome to GateAccess Community Information";
            return View("Default");
        }

       [AnonymousOnly]
        public ActionResult About()
        {
            if (Request.IsAjaxRequest())
                return PartialView("_About");
            else
                return View("About");
        }
    }
}
