using Domain.Contract.Base;

namespace Domain.Contract.Entities.InstallmentSchema
{
    public interface ITransactionRepository : IBaseRepository<Transaction>, IIdRepository<Transaction>
    {

    }
    
}
