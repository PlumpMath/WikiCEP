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
        public ActionResult Index()
        {
            //var definiciones = db.vDefiniciones.Include(d => d.AspNetUser);
            return View(db.vDefiniciones.ToList());
        }
        //GET: Definiciones/Details/5
        public ActionResult Details(int? id)
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

        [Authorize]
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
        public ActionResult Create([Bind(Include = "IDDefinicion,Titulo,IDAutor,Texto")] Definicione definicione)
        {
            if (ModelState.IsValid)
            {
                definicione.FechaCreacion = DateTime.Now;
                db.Definiciones.Add(definicione);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email", definicione.IDAutor);
            return View(definicione);
        }

        [Authorize]
        // GET: Definiciones/Edit/5
        public ActionResult Edit(int? id)
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
            ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email", definicione.IDAutor);
            return View(definicione);
        }
        // POST: Definiciones/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDDefinicion,Titulo,IDAutor,Texto")] Definicione definicione)
        {
            if (ModelState.IsValid)
            {
                definicione.FechaCreacion = DateTime.Now;
                db.Entry(definicione).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email", definicione.IDAutor);
            return View(definicione);
        }

        [Authorize]
        // GET: Definiciones/Delete/5
        public ActionResult Delete(int? id)
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
        // POST: Definiciones/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Definicione definicione = db.Definiciones.Find(id);
            db.Definiciones.Remove(definicione);
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
    


public JsonResult GetDefiniciones(string sidx, string sort, int page, int rows)
        {

            sort = (sort == null) ? "ASC" : sort;
            int pageIndex = Convert.ToInt32(page) - 1;
            int pageSize = rows;
            var listaEscritores = db.Definiciones.Select(
                    e => new
                    {
                        e.Titulo,
                        e.FechaCreacion,
                        e.AspNetUser.Email
                        
                        
                    });
            int totalRecords = listaEscritores.Count();
            var totalPages = (int)Math.Ceiling((float)totalRecords / (float)rows);
            if (sort.ToUpper() == "DESC")
            {
                listaEscritores = listaEscritores.OrderByDescending(e => e.Titulo);
                listaEscritores = listaEscritores.Skip(pageIndex * pageSize).Take(pageSize);
            }
            else
            {
                listaEscritores = listaEscritores.OrderBy(e => e.Titulo);
                listaEscritores = listaEscritores.Skip(pageIndex * pageSize).Take(pageSize);
            }
            var jsonData =
            new
            {
                total = totalPages,
                page,
                records = totalRecords,
                rows = listaEscritores
            };
            return Json(jsonData, JsonRequestBehavior.AllowGet);
        }
        public ActionResult ExportToExcel()
        {
            var grid = new GridView
            {
                DataSource = (from a in db.Definiciones select a).ToList()
            };

            grid.DataBind();
            Response.ClearContent();
            Response.AddHeader("content-disposition", "inline; filename=Autores.xls");

            Response.ContentType = "application/excel";

            StringWriter sw = new StringWriter();

            HtmlTextWriter htw = new HtmlTextWriter(sw);

            grid.RenderControl(htw);

            Response.Write(sw.ToString());

            Response.End();
            return View("Index");
        }
    }
}