using Domain.Concrete.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Concrete.Entities.LoanSchema
{
    public class LoanInterest : BaseEntity
    {
        /// <summary>
        /// برای نگهداری سود وام، زمان ایجاد آن  و عنوان آن 
        /// </summary>
        public LoanInterest()
        {
        }

        public virtual byte Code { get; set; }
        public virtual string InterestTitle { get; set; }
        public virtual decimal Interest { get; set; }
        public virtual DateTime CreatedAt { get; set; } = DateTime.Now;
        public override string ToString()
        {
            return $"{Code},{InterestTitle},{Interest}";
        }
    }

}
