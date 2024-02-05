using Domain.Concrete.Base;

/// <summary>
/// موجودیت شهر
/// </summary>
public class City : BaseEntity
{
    public City()
    {

    }

    public virtual byte Code { get; set; }
    public virtual string TitleFa { get; set; }
    public virtual string TitleEn { get; set; }

    /// <summary>
    /// موجودیت های اصلی مدل شهر را نمایش میدهد
    /// </summary>
    /// <returns>{Code}, {TitleFa}, {TitleEn}</returns>
    public override string ToString()
    {
        return $"{Code}, {TitleFa}, {TitleEn}";
    }
}
