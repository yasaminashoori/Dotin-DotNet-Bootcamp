using Domain.Concrete.Entities.LoanSchema;
using Domain.Contract.Base;

namespace Domain.Contract.Entities.LoanSchema
{
    public interface ILoanRefundMonthTypeRepository : IBaseRepository<LoanRefundMonthType>, ICodeRepository<LoanRefundMonthType>
    {
    }
}

