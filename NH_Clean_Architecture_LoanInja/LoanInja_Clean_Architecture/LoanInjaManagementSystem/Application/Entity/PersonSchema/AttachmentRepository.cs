using NHibernate;
using Application.Base;
using Domain.Concrete.Entities.PersonSchema;
using Domain.Contract.Base;

namespace Application.Schema.HR;

public class AttachmentRepository : BaseRepository<Attachment>, IAttachmentRepository
{
    public AttachmentRepository(ISession session) : base(session)
    {
    }

    public void Delete(Attachment entity)
    {
        throw new NotImplementedException();
    }

    public Attachment GetById(int id)
    {
        throw new NotImplementedException();
    }

    public void Insert(Attachment entity)
    {
        throw new NotImplementedException();
    }

    public void Update(Attachment entity)
    {
        throw new NotImplementedException();
    }

    Attachment IBaseRepository<Attachment>.Get(int id)
    {
        throw new NotImplementedException();
    }

    IQueryable<Attachment> IBaseRepository<Attachment>.GetAll()
    {
        throw new NotImplementedException();
    }
}

