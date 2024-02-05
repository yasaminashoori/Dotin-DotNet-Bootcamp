using Domain.Concrete.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Concrete.Entities.LoanSchema
{
    public class LoanStatus : BaseEntity
    {
        /// <summary>
        /// برای نگهداری وضعیت وام، کد وضعیت و وضعیت به زبان فارسی و انگلیسی
        /// </summary>
        public LoanStatus()
        {
        }

        public virtual byte Code { get; set; }
        public virtual string TitleFA { get; set; }
        public virtual string TitleEN { get; set; }

        public override string ToString()
        {
            return $"{Code},{TitleFA},{TitleEN}";
        }
    }
}
