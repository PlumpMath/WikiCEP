using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WikiCEP_Project.Models;

namespace WikiCEP_Project.Controllers
{
    public class ImagenesController : Controller
    {
        private WikiCEPDBEntities db = new WikiCEPDBEntities();

        // GET: Imagenes
        public ActionResult Index()
        {
            try
            {
                var imagenes = db.Imagenes.Include(i => i.AspNetUser);
                if (imagenes.Count() == 0)
                {
                    return View();
                }
                else
                {
                    return View(imagenes.ToList());
                }

            }
            catch (Exception)
            {
                return View("Error");
            }
        }

        // GET: Imagenes/Details/5
        public ActionResult Details(int? id)
        {
            try
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Imagene imagene = db.Imagenes.Find(id);
                if (imagene == null)
                {
                    return HttpNotFound();
                }
                return View(imagene);
            }
            catch (Exception)
            {
                return View("Error");
            }
        }

		[Authorize]
        // GET: Imagenes/Create
        public ActionResult Create(int? pIdDefinicion)
        {
            if(pIdDefinicion != null) {
                Session["IdIsNotNull"] = true;
                Session["pIdDefinicion"] = pIdDefinicion;
            }
            
            ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email");
            return View();
        }

        // POST: Imagenes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Authorize]
        public ActionResult Create(Imagene imagene, HttpPostedFileBase image) {
            int pIdDefinicion = Convert.ToInt32(Session["pIdDefinicion"]);
            if (Convert.ToBoolean(Session["IdIsNotNull"])) {
                if (ModelState.IsValid) {
                    
                    imagene.IDAutor = (from a in db.AspNetUsers
                                       where a.Email == User.Identity.Name
                                       select a.Id).Single();
                    imagene.FechaCreacion = DateTime.Today;
                    imagene.ImageMimeType = image.ContentType;
                    imagene.Imagen = new byte[image.ContentLength];
                    image.InputStream.Read(imagene.Imagen, 0, image.ContentLength);
					imagene.Definiciones.Add(db.Definiciones.Find(pIdDefinicion));
					db.Imagenes.Add(imagene);
					db.SaveChanges();
					return RedirectToAction("Index");
                }
            } else {
                try {
                    if (ModelState.IsValid && image != null) {
                        imagene.FechaCreacion = DateTime.Today;
                        imagene.IDAutor = (from a in db.AspNetUsers
                                           where a.Email == User.Identity.Name
                                           select a.Id).Single();
                        imagene.ImageMimeType = image.ContentType;
                        imagene.Imagen = new byte[image.ContentLength];
                        image.InputStream.Read(imagene.Imagen, 0, image.ContentLength);
                        db.Imagenes.Add(imagene);
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }

                    return View(imagene);
                } catch (Exception) {
                    return View("Error");
                }
            }
            return View("Index");
        }

		[Authorize(Roles = "Administrador")]
		// GET: Imagenes/Delete/5
		public ActionResult Delete(int? id)
        {
            try
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Imagene imagene = db.Imagenes.Find(id);
                if (imagene == null)
                {
                    return HttpNotFound();
                }
                return View(imagene);
            }
            catch (Exception)
            {
                return View("Error");
            }
        }

        // POST: Imagenes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            try
            {
                Imagene imagene = db.Imagenes.Find(id);
                db.Imagenes.Remove(imagene);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)
           {
                return View("Error");
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

		[ChildActionOnly]
		public ActionResult CargarImagenes(int? idDefinicion)
		{
			try
			{
				var imagenes = from i in db.Imagenes select i;
				if (idDefinicion != null)
				{
					imagenes = imagenes.Where(i => i.Definiciones.Any(d => d.IDDefinicion == idDefinicion));
				}
				return PartialView("_CargarImagenes", imagenes.ToList());
			}
			catch(Exception)
			{
				return View("Error");
			}
		}


		//This action gets the photo file for a given Photo ID
		public FileContentResult GetImage(int idImagen)
		{
            try
            {
                //Get the right photo
                Imagene imagen = db.Imagenes.FirstOrDefault(p => p.IDImagen == idImagen);
                if (imagen != null)
                {
                    return File(imagen.Imagen, imagen.ImageMimeType);
                }
                else
                {
                    return null;
                }
            }
            catch (Exception)
            {
                return null;
            }
		}
	}
}
