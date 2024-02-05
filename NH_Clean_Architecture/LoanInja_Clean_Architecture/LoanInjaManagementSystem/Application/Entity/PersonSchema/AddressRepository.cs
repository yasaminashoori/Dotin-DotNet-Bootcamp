using NHibernate;
using Application.Base;
using Domain.Concrete.Entities.PersonSchema;

namespace Application.Schema.HR;

public class AddressRepository : BaseRepository<Address>, IAddressRepository
{
    public AddressRepository(ISession session) : base(session)
    {
    }

    public Address GetById(int id)
    {
        throw new NotImplementedException();
    }
}