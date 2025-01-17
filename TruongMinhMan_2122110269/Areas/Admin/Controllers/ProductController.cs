using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TruongMinhMan_2122110269.Context;
using static TruongMinhMan_2122110269.Common;

namespace TruongMinhMan_2122110269.Areas.Admin.Controllers
{
    public class ProductController : Controller
    {
        WebsiteBanHangEntities objWebsiteBanHangEntities = new WebsiteBanHangEntities();

        // GET: Admin/Product
        public ActionResult Index(string SearchString)
        {
            // Lấy danh sách sản phẩm từ cơ sở dữ liệu
            var lstProduct = objWebsiteBanHangEntities.Products.Where(n => n.Name.Contains(SearchString)).ToList();

            // Trả về danh sách sản phẩm dưới dạng List
            return View(lstProduct);
        }
        [HttpGet]
        public ActionResult Create()
        {
            this.LoadData();
            return View();
        }
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Create(Product objProduct)
        {
            this.LoadData();
            try
            {
                if (objProduct.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objProduct.ImageUpload.FileName);

                    string extension = Path.GetExtension(objProduct.ImageUpload.FileName);

                    fileName = fileName + extension + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;

                    objProduct.Avatar = fileName;

                    objProduct.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/items/"), fileName));
                }
                objWebsiteBanHangEntities.Products.Add(objProduct);
                objWebsiteBanHangEntities.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception )
            {
                return RedirectToAction("Index");
            }
        }
        [HttpGet]
        public ActionResult Details(int id)
        {
            var objProduct = objWebsiteBanHangEntities.Products.Where(n => n.Id == id).FirstOrDefault();
            return View(objProduct);
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            var objProduct = objWebsiteBanHangEntities.Products.Where(n => n.Id == id).FirstOrDefault();
            return View(objProduct);
        }
        [HttpPost]
        public ActionResult Delete(Product objPro)
        {
            var objProduct = objWebsiteBanHangEntities.Products.Where(n => n.Id == objPro.Id).FirstOrDefault();
            objWebsiteBanHangEntities.Products.Remove(objProduct);
            objWebsiteBanHangEntities.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var objProduct = objWebsiteBanHangEntities.Products.Where(n => n.Id == id).FirstOrDefault();
            return View(objProduct);
        }
        [HttpPost]
        public ActionResult Edit(int id, Product objProduct)
        {
            var existingProduct = objWebsiteBanHangEntities.Products.FirstOrDefault(n => n.Id == id);

            if (existingProduct == null)
            {
                return HttpNotFound(); // Xử lý nếu sản phẩm không tồn tại
            }

            if (objProduct.ImageUpload != null)
            {
                // Xử lý upload ảnh mới
                string fileName = Path.GetFileNameWithoutExtension(objProduct.ImageUpload.FileName);
                string extension = Path.GetExtension(objProduct.ImageUpload.FileName);
                fileName = fileName + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + extension;
                objProduct.Avatar = fileName;

                // Lưu ảnh vào thư mục
                objProduct.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/items/"), fileName));
            }
            else
            {
                // Nếu không tải lên ảnh mới, giữ lại ảnh cũ
                objProduct.Avatar = existingProduct.Avatar;
            }

            // Cập nhật các thuộc tính khác
            existingProduct.Name = objProduct.Name;
            existingProduct.CategoryId = objProduct.CategoryId;
            existingProduct.ShortDes = objProduct.ShortDes;
            existingProduct.FullDescription = objProduct.FullDescription;
            existingProduct.Price = objProduct.Price;
            existingProduct.PriceDiscount = objProduct.PriceDiscount;
            existingProduct.ShowOnHomePage = objProduct.ShowOnHomePage;
            existingProduct.DisplayOrder = objProduct.DisplayOrder;
            existingProduct.Avatar = objProduct.Avatar;

            // Lưu thay đổi
            objWebsiteBanHangEntities.Entry(existingProduct).State = EntityState.Modified;
            objWebsiteBanHangEntities.SaveChanges();

            return RedirectToAction("Index");
        }

        void LoadData()
        {
            Common objCommon = new Common();
            var lstCat = objWebsiteBanHangEntities.Categories.ToList();
            ListtoDataTableConverter converter = new ListtoDataTableConverter();
            DataTable dtCategory = converter.ToDataTable(lstCat);
            ViewBag.ListCategory = objCommon.ToSelectList(dtCategory, "Id", "Name");

            var lstBrand = objWebsiteBanHangEntities.Brands.ToList();
            DataTable dtBrand = converter.ToDataTable(lstBrand);
            ViewBag.ListBrand = objCommon.ToSelectList(dtBrand, "Id", "Name");

            List<ProductType> lstProductType = new List<ProductType>();
            ProductType objProductType = new ProductType();
            objProductType.Id = 01;
            objProductType.Name = "Giảm giá sốc";
            lstProductType.Add(objProductType);

            objProductType = new ProductType();
            objProductType.Id = 02;
            objProductType.Name = "Đề xuất";
            lstProductType.Add(objProductType);

            DataTable dtProductType = converter.ToDataTable(lstProductType);
            ViewBag.ProductType = objCommon.ToSelectList(dtProductType, "Id", "Name");
        }
    }
}