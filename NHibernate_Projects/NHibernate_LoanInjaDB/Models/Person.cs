namespace NHibernate_LoanInjaDB.Models
{
    public class Person
    {
      
        public virtual int Id { get; set; }
        public virtual byte RoleCode { get; set; }
        public virtual string FirstName { get; set; }
        public virtual string LastName { get; set; }
        public virtual DateTime BirthDate { get; set; }
        public virtual bool Gender { get; set; }
        public virtual string MobileNumber { get; set; }

    }
}
