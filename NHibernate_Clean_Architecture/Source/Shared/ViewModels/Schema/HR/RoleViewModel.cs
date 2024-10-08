﻿namespace ViewModels.Schema.HR;

public class RoleViewModel : IBaseViewModel
{
    public RoleViewModel()
    {
        Title = string.Empty;
    }

   
    public string Title { get; set; }
    public int Id { get ; set ; }
    public int RowNumber { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }

    public override string ToString()
    {
        return $"{Id} {Title}";
    }
}
