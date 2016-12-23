using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WikiCEP_Project.Models;

namespace WikiCEP_Project.Controllers
{

	public class HomeController : Controller
	{
		private WikiCEPDBEntities db = new WikiCEPDBEntities();

		public ActionResult Index()
		{
			var definicionesRecientes = db.vDefinicionesRecientes;
			return View(definicionesRecientes.ToList());
		}

		public ActionResult About()
		{
			ViewBag.Message = "Acerca de WikiCEP";

			return View();
		}

		public ActionResult Contact()
		{
			ViewBag.Message = "Contacto";

			return View();
		}
	}
}