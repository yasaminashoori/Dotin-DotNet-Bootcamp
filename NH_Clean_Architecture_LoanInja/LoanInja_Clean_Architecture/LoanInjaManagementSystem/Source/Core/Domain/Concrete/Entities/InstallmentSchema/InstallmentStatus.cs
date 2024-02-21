using Domain.Concrete.Base;

/// <summary>
/// موجودیت وضعیت قسط
/// </summary>
public class InstallmentStatus : BaseEntity
{
    public InstallmentStatus()
    {
    }

    public virtual byte Code { get; set; }
    public virtual string Title { get; set; }

    /// <summary>
    /// موجودیت های اصلی مدل وضعیت قسط را نمایش میدهد
    /// </summary>
    /// <returns>{Code},{Title}</returns>
    public override string ToString()
    {
        return $"{Code},{Title}";
    }
}
