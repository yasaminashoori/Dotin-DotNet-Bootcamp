using Domain.Concrete.Base;

namespace Domain.Concrete.Entities.PersonSchema
{
    public class Address : BaseEntity
    {
        public Address()
        {
            City = string.Empty;
            District = string.Empty;
            MainAddress = string.Empty;
            Street = string.Empty;
            PostalCode = string.Empty;
        }

        public virtual int ID { get; set; }
        public virtual string City { get; set; }
        public virtual string District { get; set; }
        public virtual string MainAddress { get; set; }
        public virtual string Street { get; set; }
        public virtual string PostalCode { get; set; }

        /// <summary>
        /// موجودیت های اصلی مدل آدرس را نمایش میدهد
        /// </summary>
        /// <returns>{ID}, {City}, {District}, {MainAddress}, {Street}, {PostalCode}</returns>
        public override string ToString()
        {
            return $"{ID}, {City}, {District}, {MainAddress}, {Street}, {PostalCode}";
        }
    }
}
