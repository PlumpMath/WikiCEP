﻿using System;
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

    public class EjemplosController : Controller
    {
        private WikiCEPDBEntities db = new WikiCEPDBEntities();

        // GET: Ejemplos
        public ActionResult Index(string strBusqueda)
        {
			return View();
		}

        // GET: Ejemplos/Details/5
        public ActionResult Details(int? id)
        {
            try
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Ejemplo ejemplo = db.Ejemplos.Find(id);
                if (ejemplo == null)
                {
                    return HttpNotFound();
                }
                return View(ejemplo);
            }
            catch (Exception ex)
            {
                return View("Error",new HandleErrorInfo(ex,"Ejemplos","Details"));
            }
            
        }

        [Authorize]
        // GET: Ejemplos/Create
        public ActionResult Create(int? pIdDefinicion)
        {
            try
            {
                ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email");
                List<Tema> lista = db.Temas.ToList();
                ViewBag.Autores = lista;
                return View();
            }
			catch (Exception ex)
			{
				return View("Error", new HandleErrorInfo(ex, "Ejemplos", "Create"));
			}
           
        }

        // POST: Ejemplos/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Ejemplo ejemplo, int? pIdDefinicion)
        {
            if(pIdDefinicion != null) {
                if (ModelState.IsValid) {
                    
                    ejemplo.IDAutor = (from a in db.AspNetUsers
                                       where a.Email == User.Identity.Name
                                       select a.Id).Single();
                    db.insertarEjemplo(ejemplo.Titulo, ejemplo.Texto, DateTime.Now, ejemplo.IDAutor, pIdDefinicion);
                    return RedirectToAction("Index");
                }
            } else {
                try {
                    if (ModelState.IsValid) {
                        ejemplo.FechaCreacion = DateTime.Now;
                        ejemplo.IDAutor = (from a in db.AspNetUsers
                                           where a.Email == User.Identity.Name
                                           select a.Id).Single();
                        db.Ejemplos.Add(ejemplo);
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }

                    ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email", ejemplo.IDAutor);
                    return View(ejemplo);
                }
				catch (Exception ex)
				{
					return View("Error", new HandleErrorInfo(ex, "Ejemplos", "Create"));
				}
            }
            return View("Error");
        }

        [Authorize]
        // GET: Ejemplos/Edit/5
        public ActionResult Edit(int? id)
        {
            try
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Ejemplo ejemplo = db.Ejemplos.Find(id);
                if (ejemplo == null)
                {
                    return HttpNotFound();
                }
                ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email", ejemplo.IDAutor);
                return View(ejemplo);
            }
			catch (Exception ex)
			{
				return View("Error", new HandleErrorInfo(ex, "Ejemplos", "Edit"));
			}
           
        }

        // POST: Ejemplos/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Ejemplo ejemplo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    ejemplo.FechaCreacion = DateTime.Now;
                    db.Entry(ejemplo).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                ViewBag.IDAutor = new SelectList(db.AspNetUsers, "Id", "Email", ejemplo.IDAutor);
                return View(ejemplo);
            }
			catch (Exception ex)
			{
				return View("Error", new HandleErrorInfo(ex, "Ejemplos", "Edit"));
			}
           
        }

		[Authorize(Roles = "Administrador")]
		// GET: Ejemplos/Delete/5
		public ActionResult Delete(int? id)
        {
            try
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Ejemplo ejemplo = db.Ejemplos.Find(id);
                if (ejemplo == null)
                {
                    return HttpNotFound();
                }
                return View(ejemplo);
            }
			catch (Exception ex)
			{
				return View("Error", new HandleErrorInfo(ex, "Ejemplos", "Delete"));
			}
            
        }

        // POST: Ejemplos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            try
            {
                Ejemplo ejemplo = db.Ejemplos.Find(id);
                db.Ejemplos.Remove(ejemplo);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
			catch (Exception ex)
			{
				return View("Error", new HandleErrorInfo(ex, "Ejemplos", "DeleteConfirmed"));

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

		public ActionResult ExportExcel()
		{
            try
            {
                GridView gv = new GridView();
                gv.DataSource = db.Ejemplos.ToList();
                gv.DataBind();
                Response.ClearContent();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment; filename=Ejemplos.xls");
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
				return View("Error", new HandleErrorInfo(ex, "Ejemplos", "ExportExcel"));
			}
        }

		[ChildActionOnly]
		public ActionResult CargarEjemplos(string strBusquedaEjemplo, int? idDefinicion)
		{
			try
			{
				var ejemplos = (from e in db.Ejemplos select e).Include(e => e.AspNetUser);
				if (idDefinicion != null)
				{
					ejemplos = ejemplos.Where(e => e.Definiciones.Any(d => d.IDDefinicion == idDefinicion));
				}
				if (!String.IsNullOrEmpty(strBusquedaEjemplo))
				{
					ejemplos = ejemplos.Where(e => e.Titulo.Contains(strBusquedaEjemplo));
				}
				return PartialView("_CargarEjemplos", ejemplos.ToList());
			}
			catch (Exception ex)
			{
				return View("Error", new HandleErrorInfo(ex, "Ejemplos", "CargarEjemplos"));
			}
		}
	}
}
