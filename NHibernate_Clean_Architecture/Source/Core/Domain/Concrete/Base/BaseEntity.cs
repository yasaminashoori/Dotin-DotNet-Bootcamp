namespace Domain.Concrete.Base;

/// <summary>
/// موجودیت پایه
/// </summary>
public abstract class BaseEntity
{
    public object Property { get; set; }

    public abstract bool IsValid();
}