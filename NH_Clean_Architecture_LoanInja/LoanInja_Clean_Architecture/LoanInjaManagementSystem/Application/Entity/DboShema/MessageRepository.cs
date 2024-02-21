
using Application.Base;
using NHibernate;

public class MessageRepository : BaseRepository<Message>, IMessageRepositoryRepository
{
    public MessageRepository(ISession session) : base(session)
    {
    }

    public override bool IsEntityValidate(Message entity)
    {
        throw new NotImplementedException();
    }
}

