using NHibernate;
using NHibernate.Mapping.ByCode;
using NHibernate.Mapping.ByCode.Conformist;
using NHibernate_LoanInjaDB.Models;

namespace NHExamples.EndPoint2.Mapping
{
    public class RoleMap : ClassMapping<Role>
    {
        public RoleMap()
        {
            Id(r => r.Id, m =>
            {
                m.Generator(Generators.Assigned);
                m.Type(NHibernateUtil.Byte);
                m.Column("Code");
            });

            Property(r => r.TitleFa, m =>
            {
                m.Length(50);
                m.NotNullable(true);
            });

            Property(r => r.TitleEn, m =>
            {
                m.Length(50);
                m.NotNullable(true);
            });

            Property(r => r.CreatedAt, m =>
            {
                m.Type(NHibernateUtil.DateTime);
                Map(x => x.SubmitionDate).Default("getdate()").Not.Nullable();
                m.NotNullable(true).;
            });

            Property(r => r.Note, m =>
            {
                m.Length(255);
            });

            Table("Role");
        }
    }
}
