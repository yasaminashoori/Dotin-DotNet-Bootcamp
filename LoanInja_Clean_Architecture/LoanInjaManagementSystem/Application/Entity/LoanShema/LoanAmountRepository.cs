using Application.Base;
using Domain.Concrete.Entities.LoanSchema;
using Domain.Contract.Base;
using Domain.Contract.Entities.LoanSchema;
using NHibernate;

public class LoanAmountRepository : BaseRepository<LoanAmount>, ILoanAmountRepository
{
    public LoanAmountRepository(ISession session) : base(session)
    {
    }

    public void Delete(LoanAmount entity)
    {
        throw new NotImplementedException();
    }

    public LoanAmount GetByCode(byte code)
    {
        throw new NotImplementedException();
    }

    public byte GetNextValue()
    {
        throw new NotImplementedException();
    }

    public void Insert(LoanAmount entity)
    {
        throw new NotImplementedException();
    }

    public void Update(LoanAmount entity)
    {
        throw new NotImplementedException();
    }

    LoanAmount IBaseRepository<LoanAmount>.Get(int id)
    {
        throw new NotImplementedException();
    }

    IQueryable<LoanAmount> IBaseRepository<LoanAmount>.GetAll()
    {
        throw new NotImplementedException();
    }
}

