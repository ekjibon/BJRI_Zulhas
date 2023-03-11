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
    public class UserHouseRentController : Controller
    {
        private UserHouseRentManager userHouseRentManager;
        private UserManager<AppUser> userManager;
        private ResidentStatusManager residentStatusManager;
        public UserHouseRentController(ApplicationDbContext db, UserManager<AppUser> _userManager)
        {
            userManager = _userManager;
            userHouseRentManager = new UserHouseRentManager(db);
            residentStatusManager= new ResidentStatusManager(db);

        }
        [HttpGet]
        public IActionResult Add(int? id)
        {
            UserHouseRent userHouseRent  = new UserHouseRent();
            if (id != null)
            {
                userHouseRent = userHouseRentManager.GetById((int)id);
            }
            ViewBag.users = userManager.Users.ToList();
            ViewBag.residentStatus = residentStatusManager.GetList();
            return View(userHouseRent);
        }
        [HttpPost]
        public IActionResult Add(UserHouseRent h, String btnValue)
        {
            if (btnValue == "Save")
            {
                var result = userHouseRentManager.Add(h);
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
                var houseRent = userHouseRentManager.GetById(h.Id);

                if (houseRent != null)
                {
                    houseRent.Id = h.Id;
                    houseRent.AppUserId = h.AppUserId;
                    houseRent.ResidentStatusId = h.ResidentStatusId;
                    houseRent.Amount = h.Amount;
                    

                    var result = userHouseRentManager.Update(h);
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
            var list = userHouseRentManager.GetList();
            return View(list);
        }
    }
}
