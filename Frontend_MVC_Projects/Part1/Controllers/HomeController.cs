using Microsoft.AspNetCore.Mvc;

namespace Part1.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
