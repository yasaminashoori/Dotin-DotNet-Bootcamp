using NHibernate;
using Application.Base;
using Domain.Concrete.Entities.PersonSchema;

namespace Application.Entity.PersonSchema;
public class PasswordHistoryRepository : BaseRepository<PasswordHistory>, IPasswordHistoryRepository
{
    public PasswordHistoryRepository(ISession session) : base(session)
    {
    }

    public PasswordHistory GetById(int id)
    {
        throw new NotImplementedException();
    }
}