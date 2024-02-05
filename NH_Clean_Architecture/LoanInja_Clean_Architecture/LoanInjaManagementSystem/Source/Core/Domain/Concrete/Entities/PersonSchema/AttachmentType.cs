using Domain.Concrete.Base;

/// <summary>
/// موجودیت نوع پیوست
/// </summary>
public class AttachmentType : BaseEntity
{
    public AttachmentType()
    {
        TypeName = typeof(AttachmentType).Name;
    }

    public virtual byte Code { get; set; }
    public virtual string TypeName { get; set; }

    public override string ToString()
    {
        return $"{Code}, {TypeName}";
    }
}

