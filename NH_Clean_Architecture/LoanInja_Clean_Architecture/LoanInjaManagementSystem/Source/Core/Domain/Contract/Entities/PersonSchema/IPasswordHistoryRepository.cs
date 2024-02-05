using Domain.Contract.Base;

namespace Domain.Concrete.Entities.PersonSchema
{
    public interface IPasswordHistoryRepository : IBaseRepository<PasswordHistory>, IIdRepository<PasswordHistory>
    {
    }
}
