using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using LMS_Web.Areas.Settings.ViewModels;
using LMS_Web.Data;
using LMS_Web.Models;
using LMS_Web.SecurityExtension;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace LMS_Web.Areas.Settings.Controllers
{
    [Area("Settings")]
    public class RoleController : Controller
    {
        private RoleManager<IdentityRole> _roleManager;
        
        public RoleController(RoleManager<IdentityRole> roleManager)
        {
            _roleManager = roleManager;
            
        }
        //[MiddlewareFilter(typeof(MyCustomAuthenticationMiddlewarePipeline))]
        public IActionResult Create()
        {
           
                var roleList = _roleManager.Roles.ToList();
                List<RolesVm> roles = new List<RolesVm>();
                foreach (var role in roleList)
                {
                    RolesVm r = new RolesVm();
                    r.Id = role.Id;
                    r.Name = role.Name;
                    roles.Add(r);
                }

                ViewBag.SuccessMessage = TempData["Message"];
                ViewBag.ErrorMessage = TempData["Error"];
                return View(roles);
           


        }
        [HttpPost]
        public async Task<IActionResult> CreateRole(string roleName)
        {
            bool x = await _roleManager.RoleExistsAsync(roleName);
            if (!x)
            {
                var role = new IdentityRole();
                role.Name = roleName;
                await _roleManager.CreateAsync(role);
                TempData["Message"] = "Successfully Added";
            }
            else
            {
                TempData["Error"] = "Role not saved. Please try again";
            }

            return RedirectToAction("Create");
            
        }
    }
}
