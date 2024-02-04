using Domain.Concrete.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Concrete.Entities.LoanSchema
{
    public class LoanTaskInstance : BaseEntity
    {
        /// <summary>
        /// نگهداری از تسک های مربوط به وام شامل درخواست و کد آن
        /// </summary>
        public LoanTaskInstance()
        {
        }

        public virtual int ID { get; set; }
        public virtual int LoanRequestID { get; set; }
        public virtual byte LoanStatusCode { get; set; }
        public virtual int PersonID { get; set; }
        public virtual string Body { get; set; }
        public virtual DateTime CreatedAt { get; set; } = DateTime.Now;

        public override string ToString()
        {
            return $"{LoanRequestID},{PersonID},{Body}";
        }
    }

}
