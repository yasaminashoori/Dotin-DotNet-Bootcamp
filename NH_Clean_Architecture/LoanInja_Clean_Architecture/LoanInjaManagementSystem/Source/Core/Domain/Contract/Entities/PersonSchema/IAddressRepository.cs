using Domain.Contract.Base;

namespace Domain.Concrete.Entities.PersonSchema
{
    public interface IAddressRepository : IBaseRepository<Address>, IIdRepository<Address>
    {
    }
}
