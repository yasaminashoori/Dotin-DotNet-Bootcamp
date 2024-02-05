using Application.Base;
using Domain.Contract.Entities.InstallmentSchema;
using NHibernate;

public class TransactionRepository : BaseRepository<Transaction>, ITransactionRepository
{
    public TransactionRepository(ISession session) : base(session)
    {
    }

    public Transaction GetById(int id)
    {
        throw new NotImplementedException();
    }

    public bool ValidateEntity(Transaction entity)
    {
        throw new NotImplementedException();
    }
}

