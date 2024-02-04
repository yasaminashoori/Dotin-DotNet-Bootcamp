using Domain.Concrete.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Concrete.Entities.LoanSchema
{

    /// <summary>
    /// درخواست وام شامل اطلاعات درخواست دهنده با جزئیات آن
    /// </summary>
    public class LoanRequest : BaseEntity
    {
        public LoanRequest()
        {
        }
        public virtual int ID { get; set; }
        public virtual int PersonID { get; set; }
        public virtual int ReviewerID { get; set; }
        public virtual byte LoanRequestStatusCode { get; set; }
        public virtual byte LoanInterestTypeCode { get; set; }
        public virtual byte LoanAmountTypeCode { get; set; }
        public virtual byte LoanRefundMonthTypeCode { get; set; }
        public virtual string FollowUpCode { get; set; }
        public virtual DateTime CreatedAt { get; set; } = DateTime.Now;
        public virtual DateTime UpdatedAt { get; set; }
        public override string ToString()
        {
            return $"{PersonID},{ReviewerID},{FollowUpCode},{CreatedAt}";
        }
    }

}
