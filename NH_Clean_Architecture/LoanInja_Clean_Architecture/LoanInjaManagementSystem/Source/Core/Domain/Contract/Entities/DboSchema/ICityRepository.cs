using Domain.Contract.Base;

namespace Domain.Contract.Entities.DboShema
{
    public interface ICityRepository : IBaseRepository<City>, ICodeRepository<Config>
    {
    }
}
