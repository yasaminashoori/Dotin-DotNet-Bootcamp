namespace Domain.Concrete.Base
{
    public abstract class BaseEntity
    {
        public DateTime CreateDateTime { get; set; }

        public DateTime UpdateDateTime { get; set; }
        public byte Code { get; set; }
    }
}
