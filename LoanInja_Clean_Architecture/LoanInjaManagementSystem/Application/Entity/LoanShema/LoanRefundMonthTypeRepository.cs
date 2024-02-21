using Application.Base;
using Domain.Concrete.Entities.LoanSchema;
using Domain.Contract.Entities.LoanSchema;
using NHibernate;

public class LoanRefundMonthTypeRepository : BaseRepository<LoanRefundMonthType>, ILoanRefundMonthTypeRepository
{
    public LoanRefundMonthTypeRepository(ISession session) : base(session)
    {
    }

    public LoanRefundMonthType GetByCode(short code)
    {
        throw new NotImplementedException();
    }

    public LoanRefundMonthType GetByCode(byte code)
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

    public bool ValidateEntity(LoanRefundMonthType entity)
    {
        throw new NotImplementedException();
    }
}

