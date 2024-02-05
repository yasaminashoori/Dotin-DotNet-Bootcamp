using Application.Base;
using Domain.Concrete.Entities.LoanSchema;
using Domain.Contract.Base;
using Domain.Contract.Entities.LoanSchema;
using NHibernate;

public class LoanInterestRepository : BaseRepository<LoanInterest>, ILoanInterestRepository
{
    public LoanInterestRepository(ISession session) : base(session)
    {
    }

    public void Delete(LoanInterest entity)
    {
        throw new NotImplementedException();
    }

    public LoanInterest GetByCode(byte code)
    {
        throw new NotImplementedException();
    }

    public byte GetNextValue()
    {
        throw new NotImplementedException();
    }

    public void Insert(LoanInterest entity)
    {
        throw new NotImplementedException();
    }

    public void Update(LoanInterest entity)
    {
        throw new NotImplementedException();
    }

    LoanInterest IBaseRepository<LoanInterest>.Get(int id)
    {
        throw new NotImplementedException();
    }

    IQueryable<LoanInterest> IBaseRepository<LoanInterest>.GetAll()
    {
        throw new NotImplementedException();
    }
}

