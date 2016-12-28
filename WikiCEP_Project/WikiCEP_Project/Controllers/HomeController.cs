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
            System.Web.HttpContext.Current.Application["Mensaje"] = "Soporte en Linea Disponible";
            ViewBag.admin = "Disponible";
			List<vDefinicionesReciente> definicionesRecientes = null;
            try
            {
				ServicioDefiniciones.ServicioDefiniciones servicioDefiniciones = new ServicioDefiniciones.ServicioDefiniciones();
				List<ServicioDefiniciones.vDefinicionReciente> definiciones = servicioDefiniciones.DefinicionesRecientes().ToList();
                definicionesRecientes = Castear(definiciones);
            }
            catch (Exception)
            {

                return View("Error");
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