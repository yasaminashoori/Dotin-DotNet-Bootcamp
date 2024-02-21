using Domain.Contract.Base;

namespace Domain.Concrete.Entities.PersonSchema
{
    public interface IAttachmentRepository : IBaseRepository<Attachment>, IIdRepository<Attachment>
    {
    }
}