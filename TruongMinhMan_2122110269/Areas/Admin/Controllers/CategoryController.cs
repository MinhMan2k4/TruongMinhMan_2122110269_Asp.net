using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TruongMinhMan_2122110269.Context;

namespace TruongMinhMan_2122110269.Areas.Admin.Controllers
{
    public class CategoryController : Controller
    {
        WebsiteBanHangEntities objWebsiteBanHangEntities = new WebsiteBanHangEntities();

        // GET: Admin/Category
        public ActionResult Index()
        {
            var lstCategory = objWebsiteBanHangEntities.Categories.ToList();

            return View(lstCategory);
        }
        [HttpGet]
        public ActionResult Details(int id)
        {
            var objCategory = objWebsiteBanHangEntities.Categories.Where(n => n.Id == id).FirstOrDefault();
            return View(objCategory);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Category objCategory)
        {
            try
            {
                if (objCategory.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objCategory.ImageUpload.FileName);

                    string extension = Path.GetExtension(objCategory.ImageUpload.FileName);

                    fileName = fileName + extension + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;

                    objCategory.Avatar = fileName;

                    objCategory.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/items/"), fileName));
                }
                objWebsiteBanHangEntities.Categories.Add(objCategory);
                objWebsiteBanHangEntities.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return RedirectToAction("Index");
            }
        }
    }
}