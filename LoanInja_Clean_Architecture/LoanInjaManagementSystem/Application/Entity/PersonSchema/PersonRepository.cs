using NHibernate;
using Application.Base;
using Domain.Concrete.Entities.PersonSchema;

namespace Application.Entity.PersonSchema;
public class PersonRepository : BaseRepository<Person>, IPersonRepository
{
    public PersonRepository(ISession session) : base(session)
    {
    }
}