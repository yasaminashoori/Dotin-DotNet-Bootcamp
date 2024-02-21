using Domain.Concrete.Base;

/// <summary>
/// موجودیت قسط
/// </summary>
public class Installment : BaseEntity
{
    public Installment()
    {
    }

    public virtual int ID { get; set; }
    public virtual int LoanRequestID { get; set; }
    public virtual byte InstallmentStatusCode { get; set; }
    public virtual long InstallmentAmount { get; set; }
    public virtual int InstallmentNumber { get; set; }

    public virtual DateTime InstallmentDate { get; set; }
    public virtual string Note { get; set; }


    /// <summary>
    /// موجودیت های اصلی مدل قسط را نمایش میدهد
    /// </summary>
    /// <returns>{InstallmentAmount},{InstallmentNumber},{Note}</returns>
    public override string ToString()
    {
        return $"{InstallmentAmount},{InstallmentNumber},{Note}";
    }
}
