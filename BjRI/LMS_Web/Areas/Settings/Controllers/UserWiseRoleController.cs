using LMS_Web.Areas.Settings.Interface;
using LMS_Web.Areas.Settings.Manager;
using LMS_Web.Areas.Settings.Models;
using LMS_Web.Data;
using LMS_Web.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace LMS_Web.Areas.Settings.Controllers
{
    [Area("Settings")]
    public class UserWiseRoleController : Controller
    {
       
        private RoleManager<IdentityRole> roleManager;
        private UserManager<AppUser> userManager;


        public UserWiseRoleController(ApplicationDbContext db, RoleManager<IdentityRole> _roleManager, UserManager<AppUser> _userManager)
        {
            roleManager = _roleManager;            
            userManager = _userManager;

        }
        [HttpGet]
        public async Task<IActionResult> Add()
        {
            ViewBag.users = userManager.Users.ToList();
            ViewBag.RoleList = roleManager.Roles.ToList();
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Add(string AppUserId,string RoleId,string btnValue)
        {
            //if (btnValue == "Save")
            //{
            //    var result =UserManager.Add();
            //    if (result)
            //    {
            //        TempData["Success"] = "Successfully Added";
            //    }
            //    else
            //    {
            //        TempData["Error"] = "Failed to save";
            //    }
            //}
            //ViewBag.SuccessMessage = TempData["Success"];
            //ViewBag.ErrorMessage = TempData["Error"];
            var user = userManager.Users.FirstOrDefault(c => c.Id == AppUserId);
            await userManager.AddToRoleAsync(user, RoleId);
            return RedirectToAction("Add");
        }
        
    }
}
