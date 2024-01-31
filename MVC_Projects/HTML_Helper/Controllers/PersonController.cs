using Microsoft.AspNetCore.Mvc;
using System.Linq;

namespace HTML_Helper.Controllers;

public class PersonController : Controller
{
    public IActionResult Index()
    {
        var people = SampleData.Personel.GetPeople();
        return View(people);
    }
}

