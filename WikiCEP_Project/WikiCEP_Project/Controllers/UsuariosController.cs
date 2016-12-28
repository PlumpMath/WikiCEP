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
	[Authorize(Roles = "Administrador")]
	public class UsuariosController : Controller
    {
        private WikiCEPDBEntities db = new WikiCEPDBEntities();

        // GET: Usuarios
        public ActionResult Index(string strBusqueda)
        {
            try {
                var usuarios = from u in db.v_RolesUsuarios
                                   select u;
                if (!String.IsNullOrEmpty(strBusqueda)) {
                    usuarios = usuarios.Where(s => s.Usuario.Contains(strBusqueda));
                }
                return View(usuarios.ToList());
            } catch (Exception) {
                return View("Error");
            }
        }

        // GET: Usuarios/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Usuarios/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Email,EmailConfirmed,PasswordHash,SecurityStamp,PhoneNumber,PhoneNumberConfirmed,TwoFactorEnabled,LockoutEndDateUtc,LockoutEnabled,AccessFailedCount,UserName")] AspNetUser aspNetUser)
        {
            if (ModelState.IsValid)
            {
                db.AspNetUsers.Add(aspNetUser);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(aspNetUser);
        }

        // GET: Usuarios/Edit/5
        public ActionResult Edit(string id)
        {
            List<AspNetRole> lista = db.AspNetRoles.ToList();
            ViewBag.Roles = lista;
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AspNetUser aspNetUser = db.AspNetUsers.Find(id);
            if (aspNetUser == null)
            {
                return HttpNotFound();
            }
            
            return View(aspNetUser);
        }

        // POST: Usuarios/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(AspNetUser aspNetUser, List<int> listaRoles)
        {
            try {
                if (ModelState.IsValid) {

                    db.Entry(aspNetUser).State = EntityState.Modified;
                    db.SaveChanges();
                    AspNetUser user = db.AspNetUsers.Include(a => a.AspNetRoles).ToList().Find(r => r.Id == aspNetUser.Id);
                    user.AspNetRoles.Clear();
                    foreach (var item in listaRoles) {
                        AspNetRole rol = (from r in db.AspNetRoles
                                          where r.Id == item.ToString()
                                          select r).Single() ;
                        aspNetUser.AspNetRoles.Add(rol);
                    }
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
             
                return View(aspNetUser);
            } catch (Exception) {
                return View("Error");
            }
        }

        // GET: Usuarios/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AspNetUser aspNetUser = db.AspNetUsers.Find(id);
            if (aspNetUser == null)
            {
                return HttpNotFound();
            }
            return View(aspNetUser);
        }

        // POST: Usuarios/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            AspNetUser aspNetUser = db.AspNetUsers.Find(id);
            db.AspNetUsers.Remove(aspNetUser);
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
