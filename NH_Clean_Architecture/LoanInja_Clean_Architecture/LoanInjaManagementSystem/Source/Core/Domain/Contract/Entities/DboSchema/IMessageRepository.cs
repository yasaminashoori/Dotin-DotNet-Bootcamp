using Domain.Contract.Base;

namespace Domain.Contract.Entities.DboShema
{
    public interface IMessageRepository : IBaseRepository<Message>, ICodeRepository<Message>
    {
    
    }
}
