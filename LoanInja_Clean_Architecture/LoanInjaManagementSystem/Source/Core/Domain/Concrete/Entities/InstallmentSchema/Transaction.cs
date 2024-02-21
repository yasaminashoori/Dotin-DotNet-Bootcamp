using Domain.Concrete.Base;

/// <summary>
/// موجودیت تراکنش
/// </summary>
public class Transaction : BaseEntity
{
    public Transaction()
    {
  
    }

    public virtual int ID { get; set; }
    public virtual int InstallmentID { get; set; }
    public virtual bool Status { get; set; } = false;
    public virtual DateTime CreatedAt { get; set; } = DateTime.Now;

    /// <summary>
    /// موجودیت های اصلی مدل تراکنش را نمایش میدهد
    /// </summary>
    /// <returns>{Status},{CreatedAt}</returns>
    public override string ToString()
    {
        return $"{Status},{CreatedAt}";
    }
}
