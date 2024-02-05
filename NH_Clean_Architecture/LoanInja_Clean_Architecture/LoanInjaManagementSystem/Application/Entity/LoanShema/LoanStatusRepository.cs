using Application.Base;
using Domain.Concrete.Entities.LoanSchema;
using Domain.Contract.Base;
using Domain.Contract.Entities.LoanSchema;
using NHibernate;

/// <summary>
/// NOTE: for solving the error You should use
/// 'LoanStatus' as the generic type parameter
/// for 'BaseRepository' since 'LoanStatus' inherits from 'BaseEntity'
/// </summary>
public class LoanStatusRepository : BaseRepository<LoanStatus>, ILoanStatusRepository
{
    public LoanStatusRepository(ISession session) : base(session)
    {
    }

    public void Delete(LoanStatus entity)
    {
        throw new NotImplementedException();
    }

    public LoanStatus GetById(int id)
    {
        throw new NotImplementedException();
    }

    public void Insert(LoanStatus entity)
    {
        throw new NotImplementedException();
    }

    public void Update(LoanStatus entity)
    {
        throw new NotImplementedException();
    }

    LoanStatus IBaseRepository<LoanStatus>.Get(int id)
    {
        throw new NotImplementedException();
    }

    IQueryable<LoanStatus> IBaseRepository<LoanStatus>.GetAll()
    {
        throw new NotImplementedException();
    }
}


