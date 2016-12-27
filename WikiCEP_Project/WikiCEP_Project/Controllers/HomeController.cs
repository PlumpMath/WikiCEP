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
			List<vDefinicionesReciente> definicionesRecientes = db.vDefinicionesRecientes.ToList();
			CortarTextos(definicionesRecientes);
			return View(definicionesRecientes);
		}

		public ActionResult About()
		{
			ViewBag.Message = "Acerca de WikiCEP";

			return View();
		}

		public ActionResult Contact()
		{
			return View();
		}

		private void CortarTextos(List<vDefinicionesReciente> definiciones)
		{
			foreach (vDefinicionesReciente definicion in definiciones)
			{
				if (definicion.Texto.Length > 100)
					definicion.Texto = definicion.Texto.Substring(0, 100) + "...";
			}
		}
	}
}