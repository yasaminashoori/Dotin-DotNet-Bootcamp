using Domain.Contract.Base;

namespace Domain.Contract.Entities.InstallmentSchema
{
    public interface IInstallmentRepository : IBaseRepository<InstallmentStatus>, IIdRepository<InstallmentStatus>
    {

    }
}
