using Application.Base;
using Domain.Contract.Entities.InstallmentSchema;
using NHibernate;

public class InstallmentStatusRepository : BaseRepository<InstallmentStatus>, IInstallmentStatusRepository
{
    public InstallmentStatusRepository(ISession session) : base(session)
    {
    }

    public InstallmentStatus GetByCode(short code)
    {
        throw new NotImplementedException();
    }

    public InstallmentStatus GetByCode(byte code)
    {
        throw new NotImplementedException();
    }

    public short GetNextValue(short maxValue)
    {
        throw new NotImplementedException();
    }

    public byte GetNextValue()
    {
        throw new NotImplementedException();
    }

    public bool ValidateEntity(InstallmentStatus entity)
    {
        throw new NotImplementedException();
    }
}

