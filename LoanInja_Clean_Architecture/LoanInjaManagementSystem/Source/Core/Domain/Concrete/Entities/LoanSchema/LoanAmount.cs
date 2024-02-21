using Domain.Concrete.Base;


namespace Domain.Concrete.Entities.LoanSchema
{
    /// <summary>
    /// نشان دهنده مقادیر وام  و زمان ایجاد آن است
    /// </summary>
    public class LoanAmount : BaseEntity
    {
        public LoanAmount()
        {

        }

        public virtual byte Code { get; set; }
        public virtual string AmountTitle { get; set; }
        public virtual decimal Amount { get; set; }
        public virtual DateTime CreatedAt { get; set; } = DateTime.Now;

        public override string ToString()
        {
            return $"{AmountTitle},{Amount}";
        }
    }

}
