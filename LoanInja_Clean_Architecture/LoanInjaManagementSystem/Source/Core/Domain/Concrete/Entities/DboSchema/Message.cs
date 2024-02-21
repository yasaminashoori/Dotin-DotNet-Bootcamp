using Domain.Concrete.Base;

/// <summary>
/// موجودیت تنظیمات
/// </summary>
public class Message : BaseEntity
{
    public Message()
    {
        Body = string.Empty;
    }

    public virtual byte Code { get; set; }
    public virtual byte LoanStatusCode { get; set; }
    public virtual string Body { get; set; }
    public virtual DateTime CreatedAt { get; set; } = DateTime.Now;



    /// <summary>
    /// موجودیت های اصلی مدل پیام را نمایش میدهد
    /// </summary>
    /// <returns>{Code},{LoanStatusCode},{Body}</returns>
    public override string ToString()
    {
        return $"{Code},{LoanStatusCode},{Body}";
    }
}
