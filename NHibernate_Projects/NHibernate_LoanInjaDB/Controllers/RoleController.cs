using Microsoft.AspNetCore.Mvc;
using NHibernate.Linq;
using NHibernate_LoanInjaDB.Repository;

namespace NHibernate_LoanInjaDB.Controllers;

public class RoleController : Controller
{
    private readonly RoleRepository _RoleRepository;

    private readonly NHibernate.ISession _session;

    public RoleController(NHibernate.ISession session)
    {
        _session = session;
        _RoleRepository = new RoleRepository(_session);
    }

    public JsonResult Index()
    {
        var people = _RoleRepository.Roles.ToList();

        return Json(people);
    }

    public JsonResult Index2()
    {
        var Roles = _RoleRepository.Roles
                            .Where(b => b.TitleFa.StartsWith("A"))
                            .ToList();

        return Json(Roles);
    }

    public async Task<JsonResult> Index3()
    {
        var Roles = await _RoleRepository.Roles
                                  .Where(b => b.TitleFa.StartsWith("S"))
                                  .ToListAsync();
        return Json(Roles);
    }


    public async Task<JsonResult> TryEdit()
    {
        var Role = await _RoleRepository.Roles.FirstOrDefaultAsync();
        Role.TitleFa += " (of the user)";
        await _RoleRepository.Save(Role);
        return Json(Role);
    }


    public async Task<JsonResult> Edit()
    {
        try
        {
            _RoleRepository.BeginTransaction();

            var Role = await _RoleRepository.Roles.FirstOrDefaultAsync();
            Role.TitleFa += " (of the user)";

            await _RoleRepository.Save(Role);
            await _RoleRepository.Commit();

            return Json(Role);

        }
        catch
        {
            await _RoleRepository.Rollback();
            return Json(BadRequest());
        }
        finally
        {
            _RoleRepository.CloseTransaction();
        }
    }

    public async Task<JsonResult> Create()
    {
        try
        {
            _RoleRepository.BeginTransaction();

            var Role = new Models.Role
            {
                TitleFa = $"Role No {new Random().Next()}"
            };

            await _RoleRepository.Save(Role);
            await _RoleRepository.Commit();

            return Json(Role);

        }
        catch
        {
            await _RoleRepository.Rollback();
            return Json(BadRequest());
        }
        finally
        {
            _RoleRepository.CloseTransaction();
        }
    }


    public async Task<JsonResult> Delete(int id)
    {
        try
        {
            _RoleRepository.BeginTransaction();

            var Role = _RoleRepository.Roles.Where(b => b.Id == id).SingleOrDefault();

            if (Role == null)
                return Json(BadRequest());

            await _RoleRepository.Delete(Role);
            await _RoleRepository.Commit();

            return Json(Role);

        }
        catch
        {
            await _RoleRepository.Rollback();
            return Json(BadRequest());
        }
        finally
        {
            _RoleRepository.CloseTransaction();
        }
    }
}
