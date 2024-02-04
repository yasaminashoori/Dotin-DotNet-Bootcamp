using Domain.Concrete.Base;
using Domain.Contract.Base;
using NH = NHibernate;
namespace Application.Base
{
    public class CodeRepository<T> : BaseRepository<T>, ICodeRepository<T> where T : BaseEntity
    {
        public CodeRepository(NH.ISession session) : base(session)
        {
        }

        public T GetByCode(byte code)
        {
            
            return _session.Query<T>().FirstOrDefault(x => x.Code == code);
            throw new NotImplementedException();
        }

        public byte GetNextValue()
        {
            
            return (byte)(_session.Query<T>().Max(x => x.Code) + 1);
            throw new NotImplementedException();
        }
    }
}
