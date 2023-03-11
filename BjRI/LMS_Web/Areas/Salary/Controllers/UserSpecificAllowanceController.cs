using LMS_Web.Areas.Salary.Interface.Manager;
using LMS_Web.Areas.Salary.Manager;
using LMS_Web.Areas.Salary.Models;
using LMS_Web.Areas.Settings.Manager;
using LMS_Web.Areas.Settings.Models;
using LMS_Web.Data;
using LMS_Web.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;

namespace LMS_Web.Areas.Salary.Controllers
{
    [Area("Salary")]
    public class UserSpecificAllowanceController : Controller
    {
       
        private UserManager<AppUser> userManager;
        private readonly UserSpecificAllowanceManager userSpecificAllowanceManager;
        private readonly PayScaleManager payScaleManager;

        public UserSpecificAllowanceController(ApplicationDbContext db, UserManager<AppUser> _userManager)
        {
            userManager = _userManager;
            userSpecificAllowanceManager = new UserSpecificAllowanceManager(db);
            payScaleManager = new PayScaleManager(db);

        }
        [HttpGet]
        public IActionResult Add(int? id)
        {
            UserSpecificAllowance userSpecificAllowance = new UserSpecificAllowance();
            if (id != null)
            {
                userSpecificAllowance = userSpecificAllowanceManager.GetById((int)id);
            }
            ViewBag.users = userManager.Users.ToList();
            ViewBag.payScale = payScaleManager.GetUserSpecific();
            return View(userSpecificAllowance);
        }
        [HttpPost]
        public IActionResult Add(UserSpecificAllowance h, String btnValue)
        {
            if (btnValue == "Save")
            {
                var result = userSpecificAllowanceManager.Add(h);
                if (result)
                {
                    TempData["Success"] = "Successfully Added";
                }
                else
                {
                    TempData["Error"] = "Failed to save";
                }
            }
            else
            {
                var SpecificAllowance = userSpecificAllowanceManager.GetById(h.Id);

                if (SpecificAllowance != null)
                {
                    SpecificAllowance.Id = h.Id;
                    SpecificAllowance.AppUserId = h.AppUserId;
                    SpecificAllowance.PayScaleId = h.PayScaleId;
                    SpecificAllowance.Amount = h.Amount;
                    SpecificAllowance.Month = h.Month;
                    SpecificAllowance.Year = h.Year;
                    
                    

                    var result = userSpecificAllowanceManager.Update(h);
                    if (result)
                    {
                        TempData["Success"] = "Successfully Update";
                    }
                    else
                    {
                        TempData["Error"] = "Failed Update";
                    }

                }
            }
            return RedirectToAction("List");
        }
        public IActionResult List()
        {
            ViewBag.SuccessMessage = TempData["Success"];
            ViewBag.ErrorMessage = TempData["Error"];
            var list = userSpecificAllowanceManager.GetList();
            return View(list);
        }
    }
}
