using NHibernate;
using NHibernate.Mapping.ByCode;
using NHibernate.Mapping.ByCode.Conformist;
using NHibernate_LoanInjaDB.Models;

namespace NHibernate_LoanInjaDB.Mapping
{
    public class PersonMap : ClassMapping<Person>
    {
        public PersonMap()
        {

            Id(x => x.Id, m =>
            {
                m.Generator(Generators.Identity);
                m.Type(NHibernateUtil.Int32);
                m.Column("ID");
                m.UnsavedValue(0);
            });

            Property(p => p.RoleCode, m =>
            {
                m.Type(NHibernateUtil.Byte);
                m.NotNullable(true);
            });

            Property(p => p.FirstName, m =>
            {
                m.Length(50);
                m.Type(NHibernateUtil.String);
                m.NotNullable(true);
            });

            Property(p => p.LastName, m =>
            {
                m.Length(50);
                m.Type(NHibernateUtil.String);
                m.NotNullable(true);
            });

            Property(p => p.BirthDate, m =>
            {
                m.Type(NHibernateUtil.Date);
                m.NotNullable(true);
            });

            Property(p => p.Gender, m =>
            {
                m.Type(NHibernateUtil.Boolean);
                m.NotNullable(true);
            });

            Property(p => p.MobileNumber, m =>
            {
                m.Length(11);
                m.Type(NHibernateUtil.String);
                m.NotNullable(true);
            });

            Table("Person");
        }

    }
}

