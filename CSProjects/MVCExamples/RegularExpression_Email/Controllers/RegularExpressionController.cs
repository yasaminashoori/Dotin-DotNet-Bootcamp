using Microsoft.AspNetCore.Mvc;
using RegularExpression_Email.Models;

namespace RegularExpression_Email.Controllers
{
    public class RegularExpressionController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Submit(RegularExpressionModel model)
        {
            if (ModelState.IsValid)
            {
                // Valid email, perform further actions
                // model.Email contains the validated email address
                return RedirectToAction("Success");
            }

            // Invalid email, return to the view with validation errors
            return View("Index", model);
        }

        public IActionResult Success()
        {
            return View();
        }
    }
}



