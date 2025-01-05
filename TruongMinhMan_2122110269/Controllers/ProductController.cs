using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TruongMinhMan_2122110269.Context;

namespace TruongMinhMan_2122110269.Controllers
{
    public class ProductController : Controller
    {
        WebsiteBanHangEntities objWebsiteBanHangEntities = new WebsiteBanHangEntities();

        // GET: Product
        public ActionResult Detail(int Id)
        {

            var ọbjProduct = objWebsiteBanHangEntities.Products.Where(n=>n.Id == Id).FirstOrDefault();
            return View(ọbjProduct);
        }
    }
}