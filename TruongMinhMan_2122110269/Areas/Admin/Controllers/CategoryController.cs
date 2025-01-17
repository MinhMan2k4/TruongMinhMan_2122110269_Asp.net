using System;
using System.Collections.Generic;
using System.Data.Entity;
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
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var objCategory = objWebsiteBanHangEntities.Categories.Where(n => n.Id == id).FirstOrDefault();
            //Category category = objWebsiteBanHangEntities.Categories.Find(id);
            return View(objCategory);
        }
        [HttpPost]
        public ActionResult Edit(int id, Category objCategory)
        {
            var existingCategory = objWebsiteBanHangEntities.Categories.FirstOrDefault(n => n.Id == id);

            if (existingCategory == null)
            {
                return HttpNotFound(); // Xử lý nếu sản phẩm không tồn tại
            }

            if (objCategory.ImageUpload != null)
            {
                // Xử lý upload ảnh mới
                string fileName = Path.GetFileNameWithoutExtension(objCategory.ImageUpload.FileName);
                string extension = Path.GetExtension(objCategory.ImageUpload.FileName);
                fileName = fileName + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + extension;
                objCategory.Avatar = fileName;

                // Lưu ảnh vào thư mục
                objCategory.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/items/"), fileName));
            }
            else
            {
                // Nếu không tải lên ảnh mới, giữ lại ảnh cũ
                objCategory.Avatar = existingCategory.Avatar;
            }

            // Cập nhật các thuộc tính khác
            existingCategory.Name = objCategory.Name;
            existingCategory.Slug = objCategory.Slug;
            existingCategory.ShowOnHomePage = objCategory.ShowOnHomePage;
            existingCategory.DisplayOrder = objCategory.DisplayOrder;
            existingCategory.Avatar = objCategory.Avatar;

            // Lưu thay đổi
            objWebsiteBanHangEntities.Entry(existingCategory).State = EntityState.Modified;
            objWebsiteBanHangEntities.SaveChanges();

            return RedirectToAction("Index");
        }
    }
}