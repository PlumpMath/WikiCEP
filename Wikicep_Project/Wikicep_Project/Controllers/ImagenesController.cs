using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Wikicep_Project.Models;

namespace Wikicep_Project.Controllers
{
    public class ImagenesController : Controller
    {
<<<<<<< HEAD
		//Prueba
        private WikiCEPDBEntities1 db = new WikiCEPDBEntities1();
=======
		//Prueba 123
        private WikiCEPDBEntities db = new WikiCEPDBEntities();
>>>>>>> b54419e317c1940e6ac0cf596711b62f38d418c8

        // GET: Imagenes
        public ActionResult Index()
        {
            var imagenes = db.Imagenes.Include(i => i.AspNetUsers);
            return View(imagenes.ToList());
        }

        // GET: Imagenes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Imagenes imagenes = db.Imagenes.Find(id);
            if (imagenes == null)
            {
                return HttpNotFound();
            }
            return View(imagenes);
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
        public ActionResult Create([Bind(Include = "IDImagen,Titulo,FechaCreacion,IDAutor")] Imagenes imagenes)
        {
            if (ModelState.IsValid)
            {
                db.Imagenes.Add(imagenes);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email", imagenes.IDAutor);
            return View(imagenes);
        }

        // GET: Imagenes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Imagenes imagenes = db.Imagenes.Find(id);
            if (imagenes == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email", imagenes.IDAutor);
            return View(imagenes);
        }

        // POST: Imagenes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDImagen,Titulo,FechaCreacion,IDAutor")] Imagenes imagenes)
        {
            if (ModelState.IsValid)
            {
                db.Entry(imagenes).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email", imagenes.IDAutor);
            return View(imagenes);
        }

        // GET: Imagenes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Imagenes imagenes = db.Imagenes.Find(id);
            if (imagenes == null)
            {
                return HttpNotFound();
            }
            return View(imagenes);
        }

        // POST: Imagenes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Imagenes imagenes = db.Imagenes.Find(id);
            db.Imagenes.Remove(imagenes);
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
