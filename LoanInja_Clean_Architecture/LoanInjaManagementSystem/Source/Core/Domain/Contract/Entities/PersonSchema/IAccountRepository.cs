using Domain.Contract.Base;

namespace Domain.Concrete.Entities.PersonSchema
{
    public interface IAccountRepository : IBaseRepository<Account>, IIdRepository<Account>
    {
    }
}
