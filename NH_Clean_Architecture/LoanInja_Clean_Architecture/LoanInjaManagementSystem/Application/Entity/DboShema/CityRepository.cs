using Application.Base;
using NHibernate;

public class CityRepository : BaseRepository<City>, ICityRepositoryRepository
{
    public CityRepository(ISession session) : base(session)
    {
    }
}

internal interface ICityRepositoryRepository
{
}

internal interface IMessageRepositoryRepository
{
}