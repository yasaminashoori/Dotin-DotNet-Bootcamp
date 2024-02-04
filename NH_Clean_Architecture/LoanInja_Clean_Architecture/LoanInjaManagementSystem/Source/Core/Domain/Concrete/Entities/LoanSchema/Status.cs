using Domain.Concrete.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Concrete.Entities.LoanSchema
{
    /// <summary>
    ///نشان دهنده وضعیت وام 
    /// </summary>
    public class LoanStatusType : BaseEntity
    {
        public LoanStatusType()
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
