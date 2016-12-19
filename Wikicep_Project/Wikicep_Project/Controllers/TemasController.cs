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
    public class TemasController : Controller
    {
        private WikiCEPDBEntities db = new WikiCEPDBEntities();

        // GET: Temas
        public ActionResult Index()
        {
            return View(db.Temas.ToList());
        }

        // GET: Temas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Temas temas = db.Temas.Find(id);
            if (temas == null)
            {
                return HttpNotFound();
            }
            return View(temas);
        }

        // GET: Temas/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Temas/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDTema,Descripcion")] Temas temas)
        {
            if (ModelState.IsValid)
            {
                db.Temas.Add(temas);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(temas);
        }

        // GET: Temas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Temas temas = db.Temas.Find(id);
            if (temas == null)
            {
                return HttpNotFound();
            }
            return View(temas);
        }

        // POST: Temas/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDTema,Descripcion")] Temas temas)
        {
            if (ModelState.IsValid)
            {
                db.Entry(temas).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(temas);
        }

        // GET: Temas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Temas temas = db.Temas.Find(id);
            if (temas == null)
            {
                return HttpNotFound();
            }
            return View(temas);
        }

        // POST: Temas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Temas temas = db.Temas.Find(id);
            db.Temas.Remove(temas);
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
