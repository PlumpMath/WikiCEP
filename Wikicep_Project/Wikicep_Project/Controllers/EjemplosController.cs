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
    public class EjemplosController : Controller
    {
        private WikiCEPDBEntities db = new WikiCEPDBEntities();

        // GET: Ejemplos
        public ActionResult Index()
        {
            var ejemplos = db.Ejemplos.Include(e => e.AspNetUsers);
            return View(ejemplos.ToList());
        }

        // GET: Ejemplos/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ejemplos ejemplos = db.Ejemplos.Find(id);
            if (ejemplos == null)
            {
                return HttpNotFound();
            }
            return View(ejemplos);
        }

        // GET: Ejemplos/Create
        public ActionResult Create()
        {
            ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email");
            return View();
        }

        // POST: Ejemplos/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDEjemplo,Titulo,Texto,FechaCreacion,IDAutor")] Ejemplos ejemplos)
        {
            if (ModelState.IsValid)
            {
                db.Ejemplos.Add(ejemplos);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email", ejemplos.IDAutor);
            return View(ejemplos);
        }

        // GET: Ejemplos/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ejemplos ejemplos = db.Ejemplos.Find(id);
            if (ejemplos == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email", ejemplos.IDAutor);
            return View(ejemplos);
        }

        // POST: Ejemplos/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDEjemplo,Titulo,Texto,FechaCreacion,IDAutor")] Ejemplos ejemplos)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ejemplos).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email", ejemplos.IDAutor);
            return View(ejemplos);
        }

        // GET: Ejemplos/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ejemplos ejemplos = db.Ejemplos.Find(id);
            if (ejemplos == null)
            {
                return HttpNotFound();
            }
            return View(ejemplos);
        }

        // POST: Ejemplos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Ejemplos ejemplos = db.Ejemplos.Find(id);
            db.Ejemplos.Remove(ejemplos);
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
