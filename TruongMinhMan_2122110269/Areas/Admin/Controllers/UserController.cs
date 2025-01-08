using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TruongMinhMan_2122110269.Context;

namespace TruongMinhMan_2122110269.Areas.Admin.Controllers
{
    public class UserController : Controller
    {
        WebsiteBanHangEntities objWebsiteBanHangEntities = new WebsiteBanHangEntities();
        // GET: Admin/User
        public ActionResult Index()
        {
            var lstUser = objWebsiteBanHangEntities.Users.ToList();
            return View(lstUser);
        }
        public ActionResult Details(int id)
        {
            var objUser = objWebsiteBanHangEntities.Users.Where(n => n.Id == id).FirstOrDefault();
            return View(objUser);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(User objUser)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    // Thêm user mới vào database
                    objWebsiteBanHangEntities.Users.Add(objUser);
                    objWebsiteBanHangEntities.SaveChanges();
                    return RedirectToAction("Index");
                }
                return View(objUser);
            }
            catch (Exception ex)
            {
                // Ghi log lỗi (nếu cần)
                Console.WriteLine(ex.Message);
                return RedirectToAction("Index");
            }
        }
    }
}