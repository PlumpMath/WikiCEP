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
    public class TutorialesYouTubeController : Controller
    {
        private WikiCEPDBEntities db = new WikiCEPDBEntities();

        // GET: TutorialesYouTube
        public ActionResult Index()
        {
            return View(db.TutorialesYouTubes.ToList());
        }

        // GET: TutorialesYouTube/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TutorialesYouTube tutorialesYouTube = db.TutorialesYouTubes.Find(id);
            if (tutorialesYouTube == null)
            {
                return HttpNotFound();
            }
            return View(tutorialesYouTube);
        }

        [Authorize]
        // GET: TutorialesYouTube/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: TutorialesYouTube/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDTutorial,Titulo,LinkYouTube")] TutorialesYouTube tutorialesYouTube)
        {
            if (ModelState.IsValid)
            { 
                db.TutorialesYouTubes.Add(tutorialesYouTube);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tutorialesYouTube);
        }
        [Authorize]
        // GET: TutorialesYouTube/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TutorialesYouTube tutorialesYouTube = db.TutorialesYouTubes.Find(id);
            if (tutorialesYouTube == null)
            {
                return HttpNotFound();
            }
            return View(tutorialesYouTube);
        }

        // POST: TutorialesYouTube/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDTutorial,Titulo,LinkYouTube")] TutorialesYouTube tutorialesYouTube)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tutorialesYouTube).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tutorialesYouTube);
        }
        [Authorize]
        // GET: TutorialesYouTube/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TutorialesYouTube tutorialesYouTube = db.TutorialesYouTubes.Find(id);
            if (tutorialesYouTube == null)
            {
                return HttpNotFound();
            }
            return View(tutorialesYouTube);
        }

        // POST: TutorialesYouTube/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TutorialesYouTube tutorialesYouTube = db.TutorialesYouTubes.Find(id);
            db.TutorialesYouTubes.Remove(tutorialesYouTube);
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
