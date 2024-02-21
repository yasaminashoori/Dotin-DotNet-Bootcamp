using Application.Base;
using Domain.Contract.Entities.InstallmentSchema;
using NHibernate;

public class InstallmentRepository : BaseRepository<InstallmentStatus>, IInstallmentRepository
{
    public InstallmentRepository(ISession session) : base(session)
    {
    }

    public InstallmentStatus GetById(int id)
    {
        throw new NotImplementedException();
    }

    public bool ValidateEntity(InstallmentStatus entity)
    {
        throw new NotImplementedException();
    }
}

