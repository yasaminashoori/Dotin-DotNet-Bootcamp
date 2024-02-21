using NHibernate;
using Application.Base;
using Domain.Concrete.Entities.PersonSchema;

namespace Application.Entity.PersonSchema;

public class RoleRepository : BaseRepository<Role>, IRoleRepository
{
    public RoleRepository(ISession session) : base(session)
    {
    }
}