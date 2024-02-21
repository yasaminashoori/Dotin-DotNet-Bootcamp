using Domain.Concrete.Base;

namespace Domain.Concrete.Entities.PersonSchema
{
    /// <summary>
    /// اطلاعات افراد در سیستم تسهیلات
    /// </summary>
    public class Person : BaseEntity
    {
        public Person()
        {
            FirstName = string.Empty;
            LastName = string.Empty;
            MobileNumber = null!;
        }

        public virtual int ID { get; set; }
        public virtual byte RoleCode { get; set; }
        public virtual string FirstName { get; set; }
        public virtual string LastName { get; set; }
        public virtual DateTime BirthDate { get; set; }
        public virtual bool Gender { get; set; }
        public virtual string MobileNumber { get; set; }

        public override string ToString()
        {
            return $"{ID} {FirstName} {LastName}";
        }
    }
}
