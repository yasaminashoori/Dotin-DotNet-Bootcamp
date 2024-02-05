using Application.Base;
using Domain.Concrete.Entities.LoanSchema;
using NHibernate;

public class LoanRequestRepository : BaseRepository<LoanRefundMonthType>, ILoanRequestRepository
{
    public LoanRequestRepository(ISession session) : base(session)
    {
    }

    public LoanRefundMonthType GetById(int id)
    {
        throw new NotImplementedException();
    }

    public bool ValidateEntity(LoanRefundMonthType entity)
    {
        throw new NotImplementedException();
    }
}

internal interface ILoanRequestRepository
{
}