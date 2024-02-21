using Domain.Concrete.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Concrete.Entities.PersonSchema
{
    /// <summary>
    /// ذخیره پسورد و نگهداری پسورد های رمزگذاری شده
    /// </summary>
    public class PasswordHistory : BaseEntity
    {
        public PasswordHistory()
        {
            PasswordHash = Array.Empty<byte>();
            Salt = Array.Empty<byte>();
        }
        public virtual int ID { get; set; }
        public virtual int PersonID { get; set; }
        public virtual byte[] PasswordHash { get; set; }
        public virtual byte[] Salt { get; set; }
        public virtual DateTime CreatedAt { get; set; } = DateTime.Now;

        public override string ToString()
        {
            return $"{ID}, {PersonID}, {CreatedAt}";
        }
    }
}
