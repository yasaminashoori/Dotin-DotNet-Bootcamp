using Entities.ModelBinding.Simple;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Permissions;

namespace MVCExamples.Part10_ModelBinding.Controllers
{
    public class PhoneController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
       
        public IActionResult GetPhonesSection()
        {
            return PartialView("_PhonePartial");
        }
    }
}

