using Domain.Concrete.Base;

namespace Domain.Concrete.Entities.PersonSchema
{
    /// <summary>
    /// موارد مهم برای پیوست اشخاص
    /// </summary>
    public class Attachment : BaseEntity
    {
        public Attachment()
        {
        }

        public virtual int ID { get; set; }
        public virtual int PersonID { get; set; }
        public virtual byte AttachmentTypeCode { get; set; }
        public virtual DateTime CreatedAt { get; set; } = DateTime.Now;

        public override string ToString()
        {
            return $"{ID}, {PersonID}, {AttachmentTypeCode}";
        }
    }
}
