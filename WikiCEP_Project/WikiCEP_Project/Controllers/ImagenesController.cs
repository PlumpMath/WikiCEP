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
            return View(imagenes.ToList());
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
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDImagen,Titulo,FechaCreacion,IDAutor,Imagen")] Imagene imagene)
        {
            if (ModelState.IsValid)
            {
                db.Imagenes.Add(imagene);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email", imagene.IDAutor);
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
    }
}
