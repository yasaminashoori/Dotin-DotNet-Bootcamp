using Domain.Concrete.Base;

/// <summary>
/// موجودیت تنظیمات
/// </summary>
public class Config : BaseEntity
{
    public Config()
    {
    }

    public virtual byte Code { get; set; }
    public virtual decimal InstallmentPenalty { get; set; }

    /// <summary>
    /// موجودیت های اصلی مدل تنظیمات را نمایش میدهد
    /// </summary>
    /// <returns>{InstallmentPenalty}</returns>
    public override string ToString()
    {
        return $"{InstallmentPenalty}";
    }
}
