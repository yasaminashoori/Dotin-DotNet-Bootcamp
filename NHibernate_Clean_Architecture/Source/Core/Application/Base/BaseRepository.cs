using Domain.Concrete.Base;
using Domain.Contract.Base;
using NH = NHibernate;
using ViewModels.Schema.HR;

namespace Application.Base;

public abstract class BaseRepository<T, TViewModel> : IBaseRepository<T, TViewModel> where T : BaseEntity
                                                                                      where TViewModel : IBaseViewModel
{
    protected readonly NH.ISession _session;
    protected readonly IBaseEntityValidation<T> _entityValidation;
    private IBaseEntityValidation<T>? entityValidation;

    public BaseRepository(NH.ISession session, BaseRepository<Domain.Concrete.Schema.HR.Actor, ActorViewModel>.BaseEntityValidation<Domain.Concrete.Schema.HR.Actor> entityValidation)
    {
        _session = session;
        _entityValidation = (IBaseEntityValidation<T>?)entityValidation;
    }

    public bool IsValid(T entity)
    {
        return entity.IsValid() && _entityValidation.ValidateInDatabase(entity);
    }

    public void Delete(T entity)
    {
        _session.Delete(entity);
    }

    public IQueryable<T> GetAll()
    {
        return _session.Query<T>();
    }

    public void Insert(T entity)
    {
        _session.Save(entity);
    }


    public void Update(T entity)
    {
        _session.Update(entity);
    }

    
    public abstract TViewModel ToViewModel(T entity);
    public abstract T ToEntity(TViewModel model);
    public abstract List<TViewModel> GetViewModels();

    public interface IBaseForEntitiesValidation<T> where T : BaseEntity
    {
        bool ValidateInDatabase(T entity);
    }

    public class BaseEntityValidation<T> : IBaseForEntitiesValidation<T> where T : BaseEntity
    {
        private readonly NH.ISession _session;

        public BaseEntityValidation(NH.ISession session)
        {
            _session = session;
        }

        public bool ValidateInDatabase(T entity)
        {
            // پرس و جوهای پایگاه داده و منطق اعتبار سنجی 
            // مثال: بررسی کردن اینکه آیا رکورد مشابهی در پایگاه داده وجود دارد یا خیر
            var existingEntity = _session.Query<T>().FirstOrDefault(e => e.Property == entity.Property);
            return existingEntity == null;
        }
    }
}

public class ActorViewModel
{
}

public interface IBaseEntityValidation<T> where T : BaseEntity
{
    bool ValidateInDatabase<T>(T entity) where T : BaseEntity;
}