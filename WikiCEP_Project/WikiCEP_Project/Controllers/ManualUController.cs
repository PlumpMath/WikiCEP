using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WikiCEP_Project.Controllers
{
    public class ManualUController : Controller
    {
        // GET: ManualU
        public ActionResult Index()
        {
            return View();
        }
        public FileStreamResult GetManual()
        {
            FileStream fs = new FileStream(@"C:\WikiCEP\manual.pdf", FileMode.Open, FileAccess.Read);
            return File(fs, "application/pdf");
        }
    }
}