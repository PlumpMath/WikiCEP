using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace ServicioDefiniciones
{
	/// <summary>
	/// Descripción breve de ServicioDefiniciones
	/// </summary>
	[WebService(Namespace = "http://tempuri.org/")]
	[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
	[System.ComponentModel.ToolboxItem(false)]
	// Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
	// [System.Web.Script.Services.ScriptService]
	public class ServicioDefiniciones : System.Web.Services.WebService
	{
		private WikiCEPDBEntities db = new WikiCEPDBEntities();

		[WebMethod]
		public List<vDefinicionReciente> DefinicionesRecientes()
		{
			List<vDefinicionReciente> definicionesRecientes = db.vDefinicionesRecientes.ToList();
			return definicionesRecientes;
		}
	}
}
