using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WikiCep_Project.Models;

namespace WikiCep_Project.Controllers
{
    public class DefinicionesController : Controller
    {
        private WikiCEPDBEntities db = new WikiCEPDBEntities();

        // GET: Definiciones
        public ActionResult Index()
        {
            var definiciones = db.Definiciones.Include(d => d.AspNetUsers);
            return View(definiciones.ToList());
        }

        // GET: Definiciones/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Definiciones definiciones = db.Definiciones.Find(id);
            if (definiciones == null)
            {
                return HttpNotFound();
            }
            return View(definiciones);
        }

        // GET: Definiciones/Create
        public ActionResult Create()
        {
            ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email");
            return View();
        }

        // POST: Definiciones/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDDefinicion,Titulo,IDAutor,FechaCreacion,Texto")] Definiciones definiciones)
        {
            if (ModelState.IsValid)
            {
                db.Definiciones.Add(definiciones);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email", definiciones.IDAutor);
            return View(definiciones);
        }

        // GET: Definiciones/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Definiciones definiciones = db.Definiciones.Find(id);
            if (definiciones == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email", definiciones.IDAutor);
            return View(definiciones);
        }

        // POST: Definiciones/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDDefinicion,Titulo,IDAutor,FechaCreacion,Texto")] Definiciones definiciones)
        {
            if (ModelState.IsValid)
            {
                db.Entry(definiciones).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email", definiciones.IDAutor);
            return View(definiciones);
        }

        // GET: Definiciones/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Definiciones definiciones = db.Definiciones.Find(id);
            if (definiciones == null)
            {
                return HttpNotFound();
            }
            return View(definiciones);
        }

        // POST: Definiciones/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Definiciones definiciones = db.Definiciones.Find(id);
            db.Definiciones.Remove(definiciones);
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
