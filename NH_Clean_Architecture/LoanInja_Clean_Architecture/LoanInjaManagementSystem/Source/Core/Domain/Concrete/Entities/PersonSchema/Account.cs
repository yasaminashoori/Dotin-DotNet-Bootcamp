using Domain.Concrete.Base;

namespace Domain.Concrete.Entities.PersonSchema
{
    /// <summary>
    /// موجودیت اکانت
    /// </summary>
    public class Account : BaseEntity
    {
        public Account()
        {
            UserName = string.Empty;
            SSN = string.Empty;
            Note = string.Empty;
        }

        public virtual int PersonID { get; set; }
        public virtual string UserName { get; set; }
        public virtual string SSN { get; set; }
        public virtual DateTime CreatedAt { get; set; } = DateTime.Now;
        public virtual bool IsActive { get; set; } = false;
        public virtual bool IsVerified { get; set; } = false;
        public virtual string Note { get; set; }

        /// <summary>
        /// موجودیت های اصلی مدل اکانت را نمایش میدهد
        /// </summary>
        /// <returns>{PersonID}, {UserName}, {SSN}, {CreatedAt}, {IsActive}, {IsVerified}</returns>
        public override string ToString()
        {
            return $"{PersonID}, {UserName}, {SSN}, {CreatedAt}, {IsActive}, {IsVerified}";
        }
    }

}


