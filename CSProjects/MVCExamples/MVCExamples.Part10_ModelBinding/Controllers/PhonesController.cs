﻿using Entities.ModelBinding.Simple;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Permissions;

namespace MVCExamples.Part10_ModelBinding.Controllers
{
    public class PersonController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public JsonResult Create(Person person)
        {
            return Json(person);
        }

        [HttpGet]
        public IActionResult CreateWithAddress()
        {
            return View();
        }

        [HttpPost]
        public JsonResult CreateWithAddress(Person person)
        {
            return Json(person);
        }


        [HttpGet]
        public IActionResult CreateWithAddressAndRole()
        {
            var data = Enum.GetNames(typeof(EnRole));
            Microsoft.AspNetCore.Mvc.Rendering.SelectList roles = new(items: data);

            ViewBag.RoleEnum = roles;

            return View();
        }




        //[HttpPost]
        //public JsonResult CreateWithAddressAndRole(Person person)
        //{
        //    return Json(person);
        //}


        [HttpPost]
        public IActionResult CreateWithAddressAndRole(Person person)
        {
            if (ModelState.IsValid == false)
            {
                // plz enter .........
                // ViewBag مجدد مقدار دهی کنید
                return View(person);
            }

            return RedirectToAction(nameof(Index));
        }



        [HttpGet]
        public IActionResult CreateWithAddressAndRoleAndFavorites()
        {
            var data = Enum.GetNames(typeof(Entities.ModelBinding.Advance.EnRole));
            Microsoft.AspNetCore.Mvc.Rendering.SelectList roles = new(items: data);
            ViewBag.RoleEnum = roles;
            return View();
        }

        [HttpPost]
        public JsonResult CreateWithAddressAndRoleAndFavorites(Entities.ModelBinding.Advance.Person person)
        {
            return Json(person);
        }


        public IActionResult GetFavoritesSection()
        {
            return PartialView("_FavoritePartial");
        }

        public IActionResult GetPhonesSection()
        {
            return PartialView("_PhonePartial");
        }
    }
}

