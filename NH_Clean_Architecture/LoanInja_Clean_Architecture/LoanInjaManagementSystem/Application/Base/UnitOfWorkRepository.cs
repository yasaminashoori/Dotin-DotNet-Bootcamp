using NHibernate;
using Domain.Contract.Schema.HR;
using Application.Schema.HR;
using Domain.Contract.Base;
using Domain.Concrete.Entities.PersonSchema;

namespace Application.Base
{
    public class UnitOfWork : IUnitOfWork // rename the file name
    {
        private readonly ISessionFactory _sessionFactory;
        private readonly ITransaction _transaction;
        private readonly ISession _session;

        public UnitOfWork(ISessionFactory sessionFactory)
        {
            _sessionFactory = sessionFactory;
            _session = _sessionFactory.OpenSession();
            _transaction = _session.BeginTransaction();
        }

        private IPersonRepository _personRepository;
        private IRoleRepository _roleRepository;

        private ICodeRepository<Person> _personCodeRepository; // WHAT ??!!
        private ICodeRepository<Role> _roleCodeRepository; // WHAT ??!!

        private IIdRepository<Person> _personIdRepository; // WHAT ??!!
        private IIdRepository<Role> _roleIdRepository; // WHAT ??!!

        public IPersonRepository PersonRepository
        {
            get
            {
                _personRepository ??= new PersonRepository(_session);
                return _personRepository;
            }
        }

        public IRoleRepository RoleRepository
        {
            get
            {
                _roleRepository ??= new RoleRepository(_session);
                return _roleRepository;
            }
        }

        public ICodeRepository<Person> PersonCodeRepository
        {
            get
            {
                _personCodeRepository ??= new CodeRepository<Person>(_session);
                return _personCodeRepository;
            }
        }

        public ICodeRepository<Role> RoleCodeRepository
        {
            get
            {
                _roleCodeRepository ??= new CodeRepository<Role>(_session);
                return _roleCodeRepository;
            }
        }

        public IIdRepository<Person> PersonIdRepository
        {
            get
            {
                _personIdRepository ??= new IdRepository<Person>(_session);
                return _personIdRepository;
            }
        }

        public IIdRepository<Role> RoleIdRepository
        {
            get
            {
                _roleIdRepository ??= new IdRepository<Role>(_session);
                return _roleIdRepository;
            }
        }

        public void Commit()
        {
            if (!_transaction.IsActive)
            {
                throw new InvalidOperationException("No active transaction");
            }

            _transaction.Commit();
        }

        public void Dispose()
        {
            if (_session.IsOpen)
            {
                _session.Close();
            }
        }

        public void RollBack()
        {
            if (_transaction.IsActive)
            {
                _transaction.Rollback();
            }
        }
    }
}
