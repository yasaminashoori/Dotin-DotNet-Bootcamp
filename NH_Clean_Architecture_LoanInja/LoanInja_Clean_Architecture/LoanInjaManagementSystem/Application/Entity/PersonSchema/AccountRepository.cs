using NHibernate;
using Application.Base;
using Domain.Concrete.Entities.PersonSchema;
using Domain.Contract.Base;

namespace Application.Schema.HR;

public class AccountRepository : BaseRepository<Account>, IAccountRepository
{
    public AccountRepository(ISession session) : base(session)
    {
    }

    public Address GetById(int id)
    {
        throw new NotImplementedException();
    }

    Account IIdRepository<Account>.GetById(int id)
    {
        throw new NotImplementedException();
    }
}