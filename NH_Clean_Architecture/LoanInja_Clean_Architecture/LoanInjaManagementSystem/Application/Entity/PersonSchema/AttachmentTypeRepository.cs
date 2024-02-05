using NHibernate;
using Application.Base;
using Domain.Concrete.Entities.PersonSchema;


namespace Application.Entity.PersonSchema;

public class AttachmentTypeRepository : BaseRepository<AttachmentType>, IAttachmentTypeRepository
{
    public AttachmentTypeRepository(ISession session) : base(session)
    {
    }

    public AttachmentType GetById(int id)
    {
        throw new NotImplementedException();
    }
}

