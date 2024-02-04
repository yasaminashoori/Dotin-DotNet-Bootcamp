using Domain.Concrete.Entities.PersonSchema;
using Domain.Contract.Base;
using Domain.Contract.Schema.HR;

namespace Domain.Contract.Base
{
    public interface IUnitOfWork : IDisposable
    {
        void Commit();
        void RollBack();
        IRoleRepository RoleRepository { get; }
        IPersonRepository PersonRepository { get; }
        ICodeRepository<Person> PersonCodeRepository { get; }
        ICodeRepository<Role> RoleCodeRepository { get; }

        IIdRepository<Person> PersonIdRepository { get; }
        IIdRepository<Role> RoleIdRepository { get; }
    }
}
