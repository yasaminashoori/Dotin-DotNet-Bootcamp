namespace ViewModels.Schema.HR;


public class PersonViewModel : IBaseViewModel
{
    public PersonViewModel()
    {
        FullName = string.Empty;
        RoleTitle = string.Empty;
        Mobile = string.Empty;
    }

    public int Id { get; set; }
    public string FullName { get; set; }
    public string RoleTitle { get; set; }
    public byte RoleCode { get; set; }

    public string Mobile { get; set; }

    /// <summary>
    /// هرکلاسی که IBasesViewModel رو ایمپلیمنت کرده باید این پراپرتی هم ایمپلیمنت کنه 
    /// </summary>
    public int RowNumber { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }

    public override string ToString()
    {
        return $"{Id} {FullName} {RoleTitle} {Mobile}";
    }
}