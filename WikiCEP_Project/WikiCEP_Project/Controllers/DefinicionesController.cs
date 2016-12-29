using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;
using WikiCEP_Project.Models;

namespace WikiCEP_Project.Controllers
{
    public class DefinicionesController : Controller
    {
        private WikiCEPDBEntities db = new WikiCEPDBEntities();

        // GET: Definiciones
        public ActionResult Index(string strBusqueda) {
            try
            {
                var definiciones = from d in db.vDefiniciones
                                   select d;
                if (!String.IsNullOrEmpty(strBusqueda))
                {
                    definiciones = definiciones.Where(s => s.Definicion.Contains(strBusqueda));
                }
                return View(definiciones.ToList());
            }
			catch (Exception ex)
			{
				return View("Error", new HandleErrorInfo(ex, "Definiciones", "Index"));
			}
        }

        public ActionResult Details(int? id)
        {
            try
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Definicione definicione = db.Definiciones.Find(id);
                if (definicione == null)
                {
                    return HttpNotFound();
                }
                return View(definicione);
            }
			catch (Exception ex)
			{
				return View("Error", new HandleErrorInfo(ex, "Definiciones", "Details"));
			}
        }

        [Authorize]
        // GET: Definiciones/Create
        public ActionResult Create()
        {
            try
            {
                List<Tema> lista = db.Temas.ToList();
                ViewBag.Temas = lista;
                ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email");
                return View();
            }
			catch (Exception ex)
			{
				return View("Error", new HandleErrorInfo(ex, "Definiciones", "Create"));
			}
        }
        // POST: Definiciones/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Definicione definicione, List<int> lista)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    foreach (var item in lista)
                    {
                        Tema tem = db.Temas.Find(item);
                        definicione.Temas.Add(tem);

                    }
                    definicione.FechaCreacion = DateTime.Now;
                    definicione.IDAutor = (from a in db.AspNetUsers
                                           where a.Email == User.Identity.Name
                                           select a.Id).Single();
                    db.Definiciones.Add(definicione);
                    db.SaveChanges();
                    Session["IdDefinicion"] = definicione.IDDefinicion;

                    return RedirectToAction("AgregarEjemplo");
                }

                return View(definicione);
            }
			catch (Exception ex)
			{
				return View("Error", new HandleErrorInfo(ex, "Definiciones", "Create"));
			}
        }

        public ActionResult AgregarEjemplo()
         {
            
            ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email");
            return View();
        }

        // POST: Definiciones/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AgregarEjemplo(Ejemplo ejemplo)
        {
            try
            {
                int pIdDefinicion = Convert.ToInt32(Session["IdDefinicion"]);
                if (ModelState.IsValid)
                {
                    Definicione definicione = db.Definiciones.Find(pIdDefinicion);
                    ejemplo.IDAutor = definicione.IDAutor;
                    db.insertarEjemplo(ejemplo.Titulo, ejemplo.Texto, DateTime.Now, ejemplo.IDAutor, pIdDefinicion);
                    return RedirectToAction("AgregarEjemplo");
                   
                }

                return View();
            }
			catch (Exception ex)
			{
				return View("Error", new HandleErrorInfo(ex, "Definiciones", "AgregarEjemplo"));
			}
        }

        public ActionResult AgregarImagen()
        {
            ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email");
            return View();
        }

        // POST: Definiciones/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AgregarImagen(Imagene imagen, HttpPostedFileBase image)
        {
            try
            {
                int pIdDefinicion = Convert.ToInt32(Session["IdDefinicion"]);
                if (ModelState.IsValid)
                {
                    Definicione definicione = db.Definiciones.Find(pIdDefinicion);
					imagen.IDAutor = (from a in db.AspNetUsers
									   where a.Email == User.Identity.Name
									   select a.Id).Single();
					imagen.FechaCreacion = DateTime.Today;
					imagen.ImageMimeType = image.ContentType;
					imagen.Imagen = new byte[image.ContentLength];
					image.InputStream.Read(imagen.Imagen, 0, image.ContentLength);
					imagen.Definiciones.Add(db.Definiciones.Find(pIdDefinicion));
					db.Imagenes.Add(imagen);
					db.SaveChanges();
					return RedirectToAction("AgregarImagen");
                }

                return View();
            }
			catch (Exception ex)
			{
				return View("Error", new HandleErrorInfo(ex, "Definiciones", "AgregarImagen"));
			}
            
        }


        public ActionResult agregarTutorial()
        {
            try
            {
                ViewBag.Temas = db.Temas.ToList();
                ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email");
                return View();
            }
			catch (Exception ex)
			{
				return View("Error", new HandleErrorInfo(ex, "Definiciones", "agregarTutorial"));
			}
        }
        // POST: Definiciones/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult agregarTutorial(TutorialesYouTube tutorial)
        {
            try
            {
                int pIdDefinicion = Convert.ToInt32(Session["IdDefinicion"]);
                if (ModelState.IsValid)
                {
                    Definicione definicione = db.Definiciones.Find(pIdDefinicion);
                    db.insertarTutorial(tutorial.Titulo, tutorial.LinkYouTube, pIdDefinicion);
                    return RedirectToAction("agregarTutorial");
                }

                return View();
            }
			catch (Exception ex)
			{
				return View("Error", new HandleErrorInfo(ex, "Definiciones", "agregarTutorial"));
			}
        }


        [Authorize]
        // GET: Definiciones/Edit/5
        public ActionResult Edit(int? id)
        {
            try
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Definicione definicione = db.Definiciones.Find(id);
                if (definicione == null)
                {
                    return HttpNotFound();
                }
                List<Tema> lista = db.Temas.ToList();
                ViewBag.Autores = lista;
                ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email", definicione.IDAutor);
                return View(definicione);
            }
			catch (Exception ex)
			{
				return View("Error", new HandleErrorInfo(ex, "Definiciones", "Edit"));
			}
        }
        // POST: Definiciones/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Definicione definicione, List<int> lista)
        {
            try
            {
                if (ModelState.IsValid)
            {
                    definicione.FechaCreacion = DateTime.Now;
                    db.Entry(definicione).State = EntityState.Modified;
                    db.SaveChanges();
                    Definicione def = db.Definiciones.Include(a => a.Temas).ToList().Find(l => l.IDDefinicion == definicione.IDDefinicion);
                    def.Temas.Clear();
                    foreach (var item in lista)
                    {
                        Tema tem = db.Temas.Find(item);
                        definicione.Temas.Add(tem);
                    }
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email", definicione.IDAutor);
                return View(definicione);
            }

			catch (Exception ex)
			{
				return View("Error", new HandleErrorInfo(ex, "Definiciones", "Edit"));
			}
        }

		[Authorize(Roles = "Administrador")]
		// GET: Definiciones/Delete/5
		public ActionResult Delete(int? id)
        {
            try
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Definicione definicione = db.Definiciones.Find(id);
                if (definicione == null)
                {
                    return HttpNotFound();
                }
                return View(definicione);
            }
			catch (Exception ex)
			{
				return View("Error", new HandleErrorInfo(ex, "Definiciones", "Delete"));
			}
        }
        // POST: Definiciones/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            try {
                Definicione definicione = db.Definiciones.Find(id);
                db.Definiciones.Remove(definicione);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
			catch (Exception ex)
			{
				return View("Error", new HandleErrorInfo(ex, "Definiciones", "DeleteConfirmed"));
			}
       }


        public ActionResult ExportExcel()
        {
            try
            {
                GridView gv = new GridView();
                gv.DataSource = db.Definiciones.ToList();
                gv.DataBind();
                Response.ClearContent();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment; filename=Libro1.xls");
                Response.ContentType = "application/ms-excel";
                Response.Charset = "";
                StringWriter sw = new StringWriter();
                HtmlTextWriter htw = new HtmlTextWriter(sw);
                gv.RenderControl(htw);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();

                return RedirectToAction("Index");
            }
			catch (Exception ex)
			{
				return View("Error", new HandleErrorInfo(ex, "Definiciones", "ExportExcel"));
			}
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }


    }
}