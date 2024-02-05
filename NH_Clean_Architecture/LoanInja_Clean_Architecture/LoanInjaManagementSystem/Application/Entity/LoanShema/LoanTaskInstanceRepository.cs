using Application.Base;
using Domain.Concrete.Entities.LoanSchema;
using NHibernate;


public class LoanTaskInstanceRepository : BaseRepository<LoanTaskInstance>, ILoanTaskInstanceRepository
{
    public LoanTaskInstanceRepository(ISession session) : base(session)
    {
    }
}
