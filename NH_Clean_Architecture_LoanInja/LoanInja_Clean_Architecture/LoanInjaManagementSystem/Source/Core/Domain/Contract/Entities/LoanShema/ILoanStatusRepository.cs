using Domain.Concrete.Entities.LoanSchema;
using Domain.Contract.Base;

namespace Domain.Contract.Entities.LoanSchema
{
    public interface ILoanStatusRepository : IBaseRepository<LoanStatus>, IIdRepository<LoanStatus>
    {
    }
}
