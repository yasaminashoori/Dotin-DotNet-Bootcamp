using NHibernate;
using NHibernate_LoanInjaDB.Models;

namespace NHibernate_LoanInjaDB.Repository;

public class PersonRepository
{
    private readonly NHibernate.ISession _session;
    private ITransaction _transaction;

    public PersonRepository(NHibernate.ISession session)
    {
        _session = session;
    }


    public IQueryable<Person> Persons => _session.Query<Person>();

    public void BeginTransaction()
    {
        _transaction = _session.BeginTransaction();
    }

    public async Task Commit()
    {
        await _transaction.CommitAsync();
    }

    public async Task Rollback()
    {
        await _transaction.RollbackAsync();
    }

    public void CloseTransaction()
    {
        if (_transaction != null)
        {
            _transaction.Dispose();
            _transaction = null;
        }
    }

    public async Task Save(Person entity)
    {
        await _session.SaveOrUpdateAsync(entity);
    }

    public async Task Delete(Person entity)
    {
        await _session.DeleteAsync(entity);
    }
}