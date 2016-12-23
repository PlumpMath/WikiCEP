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
            var imagenes = db.Imagenes.Include(i => i.AspNetUser);
            if (imagenes.Count()==0)
            {
                return View();
            }
            else
            {
                return View(imagenes.ToList());
            }
            
        }

        // GET: Imagenes/Details/5
        public ActionResult Details(int? id)
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

		[Authorize]
        // GET: Imagenes/Create
        public ActionResult Create()
        {
            ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email");
            return View();
        }

        // POST: Imagenes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Authorize]
        public ActionResult Create(Imagene imagene, HttpPostedFileBase image)
        {
			if (ModelState.IsValid && image != null)
			{
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
		}

        // GET: Imagenes/Edit/5
        public ActionResult Edit(int? id)
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
            ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email", imagene.IDAutor);
            return View(imagene);
        }

        // POST: Imagenes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDImagen,Titulo,FechaCreacion,IDAutor,Imagen")] Imagene imagene)
        {
            if (ModelState.IsValid)
            {
                db.Entry(imagene).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email", imagene.IDAutor);
            return View(imagene);
        }

        // GET: Imagenes/Delete/5
        public ActionResult Delete(int? id)
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

        // POST: Imagenes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Imagene imagene = db.Imagenes.Find(id);
            db.Imagenes.Remove(imagene);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

		// GET: A Partial View for displaying many photos as cards
		[ChildActionOnly] //This attribute means the action cannot be accessed from the brower's address bar
		public ActionResult _CargarImagenes(int numero = 0)
		{
			//We want to display only the latest photos when a positive integer is supplied to the view.
			//Otherwise we'll display them all
			List<Imagene> imagenes;

			if (numero == 0)
			{
				imagenes = db.Imagenes.ToList();
			}
			else
			{
				imagenes = (from i in db.Imagenes
							orderby i.FechaCreacion descending
						  select i).Take(numero).ToList();
			}

			return PartialView("_CargarImagenes", imagenes);
		}

		//This action gets the photo file for a given Photo ID
		public FileContentResult GetImage(int idImagen)
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
	}
}
