﻿using NHibernate;
using Application.Base;
using Domain.Concrete.Schema.HR;
using Domain.Contract.Schema.HR;
using ViewModels.Schema.HR;

namespace Application.Schema.HR;

public class RoleRepository : BaseCodeRepository<Role, RoleViewModel>, IRoleRepository
{
    public RoleRepository(ISession session) : base(session)
    {
    }

    public override byte GetNextValue()
    {
        var max = (byte)0;

        
        var maxOfIt = (byte?)_session.Query<Role>().OrderByDescending(x => x.CurrentDate)
            .Select(a => a.Code).FirstOrDefault();

        if (maxOfIt == null || maxOfIt == 0)
        {
            max = (byte)1;
        }
        else
        {
            max = maxOfIt.Value;
            max++;
        }

        return max;
    }


    public override List<RoleViewModel> GetViewModels()
    {
        var result = _session.Query<Role>().Select(x => new RoleViewModel
        {
            Title = x.Title,
            Id = x.Code,
        }).ToList();

        return result;
    }

    public override bool IsValid(Role entity)
    {
        return entity.Code > 0;
    }

    public override Role ToEntity(RoleViewModel model)
    {
        return new Role
        {
            Title = model.Title,
            Code = (byte)model.Id,
        };
    }

    public override RoleViewModel ToViewModel(Role entity)
    {
        return new RoleViewModel
        {
            Title = entity.Title,
            Id = entity.Code
        };
    }
}