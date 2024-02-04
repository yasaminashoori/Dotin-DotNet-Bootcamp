using Domain.Concrete.Base;
using Domain.Contract.Base;
using NH = NHibernate;

namespace Application.Base
{
    public class IdRepository<T> : BaseRepository<T>, IIdRepository<T> where T : BaseEntity
    {
        public IdRepository(NH.ISession session) : base(session)
        {
        }

        public T GetById(int id)
        {
            return base._session.Get<T>(id);
        }
    }
}
