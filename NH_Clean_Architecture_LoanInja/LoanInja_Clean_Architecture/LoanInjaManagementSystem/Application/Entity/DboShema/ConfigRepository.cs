
using Application.Base;
using Domain.Contract.Entities.DboShema;
using NHibernate;


public class ConfigRepository : BaseRepository<Config>, IConfigRepository
{
    public ConfigRepository(ISession session) : base(session)
    {
    }

    public Config GetByCode(byte code)
    {
        throw new NotImplementedException();
    }

    public byte GetNextValue()
    {
        throw new NotImplementedException();
    }
}

