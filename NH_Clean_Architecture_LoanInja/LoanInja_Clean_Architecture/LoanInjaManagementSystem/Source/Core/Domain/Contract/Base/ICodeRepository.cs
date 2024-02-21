using Domain.Concrete.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Contract.Base
{
    public interface ICodeRepository<T> : IBaseRepository<T> where T : BaseEntity
    {
        T GetByCode(byte code);
        byte GetNextValue();
    }
}
