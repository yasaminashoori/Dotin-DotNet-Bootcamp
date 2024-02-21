using Domain.Concrete.Schema.HR;
using NHibernate;

namespace Application.Schema.HR;


public class ActorRepository : BaseRepository<Actor>, IActorRepository
{
    
    public ActorRepository(ISession session, BaseEntityValidation<Actor> entityValidation)
            : base(session, entityValidation)
    {
    }
}

public class BaseEntityValidation<T>
{
}

public class BaseRepository<T>
{
    private ISession session;

    public BaseRepository(ISession session)
    {
        this.session = session;
    }

    public BaseRepository(ISession session, BaseEntityValidation<Actor> entityValidation) : this(session)
    {
    }
}

internal interface IActorRepository
{
}