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
			List<vDefinicionesReciente> definicionesRecientes = null;
            try
            {
				bool isLogin = Convert.ToBoolean(System.Web.HttpContext.Current.Application["IsLogin"]);
				if (isLogin && User.IsInRole("Administrador"))
				{
					System.Web.HttpContext.Current.Application["CantidadAdmins"] = Convert.ToInt32(System.Web.HttpContext.Current.Application["CantidadAdmins"]) + 1;
					System.Web.HttpContext.Current.Application["IsLogin"] = false;
                }
				ServicioDefiniciones.ServicioDefiniciones servicioDefiniciones = new ServicioDefiniciones.ServicioDefiniciones();
				List<ServicioDefiniciones.vDefinicionReciente> definiciones = servicioDefiniciones.DefinicionesRecientes().ToList();
                definicionesRecientes = Castear(definiciones);
            }
			catch (Exception ex)
			{
				return View("Error", new HandleErrorInfo(ex, "Home", "Index"));
			} 
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

		public List<vDefinicionesReciente> Castear(List<ServicioDefiniciones.vDefinicionReciente> definiciones)
		{
			List<vDefinicionesReciente> definicionesRecientes = new List<vDefinicionesReciente>();
			foreach (ServicioDefiniciones.vDefinicionReciente definicion in definiciones)
			{
				vDefinicionesReciente definicionReciente = new vDefinicionesReciente();
				definicionReciente.IDDefinicion = definicion.IDDefinicion;
				definicionReciente.Texto = definicion.Texto;
				if (definicionReciente.Texto.Length > 100)
					definicionReciente.Texto = definicionReciente.Texto.Substring(0, 100) + "...";
				definicionReciente.Titulo = definicion.Titulo;
				definicionesRecientes.Add(definicionReciente);
			}
			return definicionesRecientes;
        }
	}
}