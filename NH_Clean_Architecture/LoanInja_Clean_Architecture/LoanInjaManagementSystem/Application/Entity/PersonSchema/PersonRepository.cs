using NHibernate;
using Application.Base;
using Domain.Contract.Schema.HR;
using Domain.Concrete.Entities.PersonSchema;
namespace Application.Schema.HR;


public class PersonRepository : BaseRepository<Person>, IPersonRepository
{
    public PersonRepository(ISession session) : base(session)
    {
    }
}