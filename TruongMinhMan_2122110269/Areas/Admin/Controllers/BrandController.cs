using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TruongMinhMan_2122110269.Context;

namespace TruongMinhMan_2122110269.Areas.Admin.Controllers
{
    public class BrandController : Controller
    {
        WebsiteBanHangEntities objWebsiteBanHangEntities = new WebsiteBanHangEntities();
        // GET: Admin/Brand
        public ActionResult Index()
        {
            var lstBrand = objWebsiteBanHangEntities.Brands.ToList();
            return View(lstBrand);
        }
        [HttpGet]
        public ActionResult Details(int id)
        {
            var objBrand = objWebsiteBanHangEntities.Brands.Where(n => n.Id == id).FirstOrDefault();
            return View(objBrand);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Brand objBrand)
        {
            try
            {
                if (objBrand.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objBrand.ImageUpload.FileName);

                    string extension = Path.GetExtension(objBrand.ImageUpload.FileName);

                    fileName = fileName + extension + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;

                    objBrand.Avatar = fileName;

                    objBrand.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/items/"), fileName));
                }
                objWebsiteBanHangEntities.Brands.Add(objBrand);
                objWebsiteBanHangEntities.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return RedirectToAction("Index");
            }
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var objBrand = objWebsiteBanHangEntities.Brands.Where(n => n.Id == id).FirstOrDefault();
            return View(objBrand);
        }
    }
}