using NHibernate;
using Application.Base;
using Domain.Contract.Schema.HR;
using Domain.Concrete.Entities.PersonSchema;

namespace Application.Schema.HR;

public class RoleRepository : BaseRepository<Role>, IRoleRepository
{
    public RoleRepository(ISession session) : base(session)
    {
    }
}