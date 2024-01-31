using Microsoft.AspNetCore.Mvc;
using NHibernate.Linq;
using NHibernate_LoanInjaDB.Repository;
using NHibernate_LoanInjaDB.Models;

namespace NHibernate_LoaninjaDB.Controllers
{
    public class PersonController : Controller
    {
        private readonly PersonRepository _personRepository;
        private readonly NHibernate.ISession _session;

        public PersonController(NHibernate.ISession session)
        {
            _session = session;
            _personRepository = new PersonRepository(_session);
        }

        public JsonResult Index()
        {
            var people = _personRepository.Persons.ToList();
            return Json(people);
        }

        public JsonResult Index2()
        {
            var persons = _personRepository.Persons
                .Where(b => b.FirstName.StartsWith("a"))
                .ToList();

            return Json(persons);
        }

        public async Task<JsonResult> Index3()
        {
            var persons = await _personRepository.Persons
                .Where(b => b.FirstName.StartsWith("s"))
                .ToListAsync();
            return Json(persons);
        }

        public async Task<JsonResult> TryEdit()
        {
            var person = await _personRepository.Persons.FirstOrDefaultAsync();
            person.FirstName += " (of the user)";
            await _personRepository.Save(person);
            return Json(person);
        }

        public async Task<JsonResult> Edit()
        {
            try
            {
                _personRepository.BeginTransaction();

                var person = await _personRepository.Persons.FirstOrDefaultAsync();
                person.FirstName += " (of the user)";

                await _personRepository.Save(person);
                await _personRepository.Commit();

                return Json(person);
            }
            catch
            {
                await _personRepository.Rollback();
                return Json(BadRequest());
            }
            finally
            {
                _personRepository.CloseTransaction();
            }
        }

        public async Task<JsonResult> Create()
        {
            try
            {
                _personRepository.BeginTransaction();

                var person = new NHibernate_LoanInjaDB.Models.Person
                {
                    FirstName = $"Person No {new Random().Next()}"
                };

                await _personRepository.Save(person);
                await _personRepository.Commit();

                return Json(person);
            }
            catch
            {
                await _personRepository.Rollback();
                return Json(BadRequest());
            }
            finally
            {
                _personRepository.CloseTransaction();
            }
        }

        public async Task<JsonResult> Delete(int id)
        {
            try
            {
                _personRepository.BeginTransaction();

                var person = _personRepository.Persons.Where(b => b.Id == id).SingleOrDefault();

                if (person == null)
                    return Json(BadRequest());

                await _personRepository.Delete(person);
                await _personRepository.Commit();

                return Json(person);
            }
            catch
            {
                await _personRepository.Rollback();
                return Json(BadRequest());
            }
            finally
            {
                _personRepository.CloseTransaction();
            }
        }
    }
}
