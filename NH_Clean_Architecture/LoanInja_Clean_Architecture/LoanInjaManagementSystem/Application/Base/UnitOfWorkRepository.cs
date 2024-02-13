using Domain.Concrete.Entities.PersonSchema;
using Domain.Contract.Base;
using Domain.Contract.Entities.DboShema;
using Domain.Contract.Entities.InstallmentSchema;
using Domain.Contract.Entities.LoanSchema;
using NHibernate;

namespace Application.Base
{
    public class UnitOfWork : IUnitOfWork
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

        private ILoanStatusRepository _loanStatusRepository = null!;
        private ILoanInterestRepository _loanInterestTypeRepository = null!;
        private ILoanRequestRepository _loanRequestRepository = null!;
        private ILoanAmountRepository _loanAmountTypeRepository = null!;
        private ILoanRefundMonthTypeRepository _loanRefundMonthTypeRepository = null!;
        private ILoanTaskInstanceRepository _loanTaskInstanceRepository = null!;
        private IAttachmentRepository _attachmentRepository = null!;
        private IAttachmentTypeRepository _attachmentTypeRepository = null!;
        private IAccountRepository _accountRepository = null!;
        private IPersonRepository _personRepository = null!;
        private IRoleRepository _roleRepository = null!;
        private IAddressRepository _addressRepository = null!;
        private IPasswordHistoryRepository _passwordHistoryRepository = null!;
        private IInstallmentRepository _installmentRepository = null!;
        private IInstallmentStatusRepository _installmentStatusRepository = null!;
        private ITransactionRepository _paymentRepository = null!;
        private ICityRepository _cityRepository = null!;
        private IMessageRepository _messageRepository = null!;
        private IConfigRepository _configRepository = null!;

        public IConfigRepository ConfigRepository
        {
            get
            {
                _configRepository ??= new ConfigRepository(_session);
                return _configRepository;
            }
        }

        public IMessageRepository MessageRepository
        {
            get
            {
                _messageRepository ??= new MessageRepository(_session);
                return _messageRepository;
            }
        }

        public ICityRepository CityRepository
        {
            get
            {
                _cityRepository ??= new CityRepository(_session);
                return _cityRepository;
            }
        }

        public IPaymentRepository PaymentRepository
        {
            get
            {
                _messageRepository ??= new MessageRepository(_session);
                return _paymentRepository;
            }
        }

        public IInstallmentRepository InstallmentRepository
        {
            get
            {
                _installmentRepository ??= new InstallmentRepository(_session);
                return _installmentRepository;
            }
        }

        public IInstallmentStatusRepository InstallmentStatusRepository
        {
            get
            {
                _installmentStatusRepository ??= new InstallmentStatusRepository(_session);
                return _installmentStatusRepository;
            }
        }

        public IAddressRepository AddressRepository
        {
            get
            {
                _addressRepository ??= new Schema.person.AddressRepository(_session);
                return _addressRepository;
            }
        }

        public IAccountRepository AccountRepository
        {
            get
            {
                _accountRepository ??= new Schema.person.AccountRepository(_session);
                return _accountRepository;
            }
        }

        public IPersonRepository PersonRepository
        {
            get
            {
                _personRepository ??= new Schema.person.PersonRepository(_session);
                return _personRepository;
            }
        }

        public IRoleRepository RoleRepository
        {
            get
            {
                _roleRepository ??= new Schema.person.RoleRepository(_session);
                return _roleRepository;
            }
        }

        public IPasswordHistoryRepository PasswordHistoryRepository
        {
            get
            {
                _passwordHistoryRepository ??= new Schema.person.PasswordHistoryRepository(_session);
                return _passwordHistoryRepository;
            }
        }

        public IAttachmentTypeRepository AttachmentTypeRepository
        {
            get
            {
                _attachmentTypeRepository ??= new Schema.person.AttachmentTypeRepository(_session);
                return _attachmentTypeRepository;
            }
        }

        public IAttachmentRepository AttachmentRepository
        {
            get
            {
                _attachmentRepository ??= new Schema.person.AttachmentRepository(_session);
                return _attachmentRepository;
            }
        }

        public ILoanTaskInstanceRepository LoanTaskInstanceRepository
        {
            get
            {
                _loanTaskInstanceRepository ??= new LoanTaskInstanceRepository(_session);
                return _loanTaskInstanceRepository;
            }
        }

        public ILoanRefundMonthTypeRepository LoanRefundMonthTypeRepository
        {
            get
            {
                _loanRefundMonthTypeRepository ??= new LoanRefundMonthTypeRepository(_session);
                return _loanRefundMonthTypeRepository;
            }
        }

        public ILoanAmountTypeRepository LoanAmountTypeRepository
        {
            get
            {
                _loanAmountTypeRepository ??= new LoanAmountTypeRepository(_session);
                return _loanAmountTypeRepository;
            }
        }

        public ILoanRequestRepository LoanRequestRepository
        {
            get
            {
                _loanRequestRepository ??= new LoanRequestRepository(_session);
                return _loanRequestRepository;
            }
        }

        public ILoanStatusRepository LoanStatusRepository
        {
            get
            {
                _loanStatusRepository ??= new LoanStatusRepository(_session);
                return _loanStatusRepository;
            }
        }

        public ILoanInterestTypeRepository LoanInterestTypeRepository
        {
            get
            {
                _loanInterestTypeRepository ??= new LoanInterestTypeRepository(_session);
                return _loanInterestTypeRepository;
            }
        }

        IRoleRepository IUnitOfWork.RoleRepository => throw new NotImplementedException();

        IPersonRepository IUnitOfWork.PersonRepository => throw new NotImplementedException();

        public ICodeRepository<Person> PersonCodeRepository => throw new NotImplementedException();

        public ICodeRepository<Role> RoleCodeRepository => throw new NotImplementedException();

        public IIdRepository<Person> PersonIdRepository => throw new NotImplementedException();

        public IIdRepository<Role> RoleIdRepository => throw new NotImplementedException();

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