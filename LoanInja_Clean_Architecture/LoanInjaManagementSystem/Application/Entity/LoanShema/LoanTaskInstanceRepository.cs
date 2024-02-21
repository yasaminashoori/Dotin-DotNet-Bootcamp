using Application.Base;
using Domain.Concrete.Entities.LoanSchema;
using Domain.Contract.Base;
using Domain.Contract.Entities.LoanSchema;
using NHibernate;

public class LoanTaskInstanceRepository : BaseRepository<LoanTaskInstance>, ILoanTaskInstanceRepository
{
    public LoanTaskInstanceRepository(ISession session) : base(session)
    {
    }

    public void Delete(LoanTaskInstance entity)
    {
        throw new NotImplementedException();
    }

    public LoanTaskInstance GetById(int id)
    {
        throw new NotImplementedException();
    }

    public void Insert(LoanTaskInstance entity)
    {
        throw new NotImplementedException();
    }

    public void Update(LoanTaskInstance entity)
    {
        throw new NotImplementedException();
    }

    LoanTaskInstance IBaseRepository<LoanTaskInstance>.Get(int id)
    {
        throw new NotImplementedException();
    }

    IQueryable<LoanTaskInstance> IBaseRepository<LoanTaskInstance>.GetAll()
    {
        throw new NotImplementedException();
    }
}

