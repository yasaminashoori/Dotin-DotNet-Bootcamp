using Microsoft.AspNetCore.Http.HttpResults;
using System;

namespace NHibernate_LoanInjaDB.Models
{
    public class Role
    {
        public virtual byte Id { get; set; }
        public virtual string TitleFa { get; set; }
        public virtual string TitleEn { get; set; }
        public virtual DateTime CreatedAt { get; set; }
        public virtual string Note { get; set; }
    }
}
