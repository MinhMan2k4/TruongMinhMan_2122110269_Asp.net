using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TruongMinhMan_2122110269.Context;

namespace TruongMinhMan_2122110269.Models
{
    public class HomeModel
    {
        public List<TruongMinhMan_2122110269.Models.Product> ListProduct { get; set; }
        public List<Category> ListCategory { get; set; }

    }
}