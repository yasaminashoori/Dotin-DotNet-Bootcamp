using Application.Base;
using Domain.Contract.Entities.LoanSchema;
using NHibernate;


public class LoanStatusRepository : BaseRepository<LoanStatus>, ILoanStatusRepository
{
    public LoanStatusRepository(ISession session) : base(session)
    {
    }

    public LoanStatus GetById(int id)
    {
        throw new NotImplementedException();
    }
}

