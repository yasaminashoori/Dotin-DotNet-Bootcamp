using Domain.Contract.Base;

namespace Domain.Concrete.Entities.PersonSchema
{
    public interface IAttachmentTypeRepository : IBaseRepository<AttachmentType>, IIdRepository<AttachmentType>
    {
    }
}