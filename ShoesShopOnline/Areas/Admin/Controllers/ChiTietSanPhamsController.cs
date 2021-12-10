using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ShoesShopOnline.Models;

namespace ShoesShopOnline.Areas.Admin.Controllers
{
    public class ChiTietSanPhamsController : Controller
    {
        private Shoes db = new Shoes();

        // GET: Admin/ChiTietSanPhams
        public ActionResult Index()
        {
            var chiTietSanPhams = db.ChiTietSanPhams.Include(c => c.AnhMoTa).Include(c => c.SizeGiay);
            return View(chiTietSanPhams.ToList());
        }

        // GET: Admin/ChiTietSanPhams/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ChiTietSanPham chiTietSanPham = db.ChiTietSanPhams.Find(id);
            if (chiTietSanPham == null)
            {
                return HttpNotFound();
            }
            return View(chiTietSanPham);
        }

        // GET: Admin/ChiTietSanPhams/Create
        public ActionResult Create()
        {
            ViewBag.MaAnh = new SelectList(db.AnhMoTas, "MaAnh", "MaSP");
            ViewBag.KichCo = new SelectList(db.SizeGiays, "KichCo", "Loai");
            return View();
        }

        // POST: Admin/ChiTietSanPhams/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaAnh,KichCo,GiaBan")] ChiTietSanPham chiTietSanPham)
        {
            if (ModelState.IsValid)
            {
                db.ChiTietSanPhams.Add(chiTietSanPham);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaAnh = new SelectList(db.AnhMoTas, "MaAnh", "MaSP", chiTietSanPham.MaAnh);
            ViewBag.KichCo = new SelectList(db.SizeGiays, "KichCo", "Loai", chiTietSanPham.KichCo);
            return View(chiTietSanPham);
        }

        // GET: Admin/ChiTietSanPhams/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ChiTietSanPham chiTietSanPham = db.ChiTietSanPhams.Find(id);
            if (chiTietSanPham == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaAnh = new SelectList(db.AnhMoTas, "MaAnh", "MaSP", chiTietSanPham.MaAnh);
            ViewBag.KichCo = new SelectList(db.SizeGiays, "KichCo", "Loai", chiTietSanPham.KichCo);
            return View(chiTietSanPham);
        }

        // POST: Admin/ChiTietSanPhams/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaAnh,KichCo,GiaBan")] ChiTietSanPham chiTietSanPham)
        {
            if (ModelState.IsValid)
            {
                db.Entry(chiTietSanPham).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaAnh = new SelectList(db.AnhMoTas, "MaAnh", "MaSP", chiTietSanPham.MaAnh);
            ViewBag.KichCo = new SelectList(db.SizeGiays, "KichCo", "Loai", chiTietSanPham.KichCo);
            return View(chiTietSanPham);
        }

        // GET: Admin/ChiTietSanPhams/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ChiTietSanPham chiTietSanPham = db.ChiTietSanPhams.Find(id);
            if (chiTietSanPham == null)
            {
                return HttpNotFound();
            }
            return View(chiTietSanPham);
        }

        // POST: Admin/ChiTietSanPhams/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            ChiTietSanPham chiTietSanPham = db.ChiTietSanPhams.Find(id);
            db.ChiTietSanPhams.Remove(chiTietSanPham);
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
