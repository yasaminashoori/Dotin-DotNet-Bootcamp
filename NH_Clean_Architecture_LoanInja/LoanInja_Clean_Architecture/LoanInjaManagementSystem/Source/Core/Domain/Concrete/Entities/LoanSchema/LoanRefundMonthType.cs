using Domain.Concrete.Base;

namespace Domain.Concrete.Entities.LoanSchema
{
    /// <summary>
    /// بازپرداخت وام 
    /// </summary>
    public class LoanRefundMonthType : BaseEntity
    {
        public LoanRefundMonthType()
        {
        }

        public virtual byte Code { get; set; }
        public virtual string MonthTitle { get; set; }
        public virtual int MonthCount { get; set; }
        public virtual bool Status { get; set; }
        public virtual decimal Commission { get; set; }

        public override string ToString()
        {
            return $"{MonthTitle},{MonthCount},{Status},{Commission}";
        }
    }

}
