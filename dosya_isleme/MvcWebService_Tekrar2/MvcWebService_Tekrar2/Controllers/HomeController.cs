using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcWebService_Tekrar2.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
           ServiceReference1.Service1Client service1Client = new ServiceReference1.Service1Client();
            return View(service1Client.GetNewVendorData());
        }

        public ActionResult About()
        {

            ServiceReference1.Service1Client service1Client = new ServiceReference1.Service1Client();
            return View(service1Client.GetNewVendorData());
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}