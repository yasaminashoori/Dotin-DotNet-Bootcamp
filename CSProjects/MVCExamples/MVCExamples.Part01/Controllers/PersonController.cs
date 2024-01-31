// PersonController.cs
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using MVCExamples.Part01.Models;

namespace MVCExamples.Part01.Controllers
{
    public class PersonController : Controller
    {
        private List<Person> GetPersons()
        {
            return new List<Person>
            {
                new Person { Id = 1, FirstName = "John", LastName = "Doe" },
                new Person { Id = 2, FirstName = "Jane", LastName = "Smith" },
                new Person { Id = 3, FirstName = "Mary", LastName = "Doubra" },
                new Person { Id = 4, FirstName = "Roz", LastName = "Ocanner" },


            };
        }

        public IActionResult GetAll()
        {
            List<Person> persons = GetPersons();
            return View(persons);
        }
    }
}




