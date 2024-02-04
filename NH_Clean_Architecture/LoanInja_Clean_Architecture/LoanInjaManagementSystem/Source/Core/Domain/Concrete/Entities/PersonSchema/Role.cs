using Domain.Concrete.Base;

namespace Domain.Concrete.Entities.PersonSchema
{
    /// <summary>
    /// نقش افراد در سیستم تسهیلات
    /// </summary>
    public class Role : BaseEntity
    {
        public Role()
        {
            TitleFa = string.Empty;
            TitleEn = string.Empty;
            Note = string.Empty;
        }
        public virtual byte Code { get; set; }
        public virtual string TitleFa { get; set; }
        public virtual string TitleEn { get; set; }
        public virtual DateTime CreatedAt { get; set; }
        public virtual string Note { get; set; }

        public override string ToString()
        {
            return $"{Code} {TitleFa}";
        }
    }
}
