using LMS_Web.Areas.Salary.Manager;
using LMS_Web.Areas.Salary.Models;
using LMS_Web.Data;
using LMS_Web.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LMS_Web.Areas.Salary.Controllers
{
    [Area("Salary")]
    public class DeductionController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private UserDeductionManager _userDeductionManager;
        private DeductionManager _deductionManager;
        private FixedDeductionManager _fixedDeductionManager;

        public DeductionController(ApplicationDbContext dbContext, UserManager<AppUser> userManager)
        {
            _userManager = userManager;
            _userDeductionManager = new UserDeductionManager(dbContext);
            _deductionManager = new DeductionManager(dbContext);
            _fixedDeductionManager = new FixedDeductionManager(dbContext);
        }
        [HttpGet]
        public IActionResult FixedDeduction(int? id)
        {

            ViewBag.SuccessMessage = TempData["Success"];
            ViewBag.ErrorMessage = TempData["Error"];
            ViewBag.FixedDeduction = _deductionManager.GetFixedList();
            ViewBag.List = _fixedDeductionManager.GetList();
            var getData = _fixedDeductionManager.GetById(id ?? 0);
            return View(getData);
        }
        [HttpPost]
        public IActionResult FixedDeduction(FixedDeduction fixedDeduction)
        {
          
            if (fixedDeduction.Id != 0)
            {
                var data = _fixedDeductionManager.GetById(fixedDeduction.Id);
                if (data != null)
                {
                    data.Amount = fixedDeduction.Amount;
                    data.UpdatedById = _userManager.GetUserId(User);
                    data.UpdatedDateTime = DateTime.Now;
                    var update = _fixedDeductionManager.Update(fixedDeduction);
                    if (update)
                    {
                        TempData["Success"] = "Successfully updated";
                    }
                    else
                    {
                        TempData["Error"] = "Fail to update";
                    }
                }
            }
            else
            {
                var data = _fixedDeductionManager.GetById(fixedDeduction.DeductionId);
                if (data != null)
                {
                    TempData["Error"] = "Already saved. Please update";
                    return RedirectToAction("FixedDeduction");
                }
                fixedDeduction.CreatedById = _userManager.GetUserId(User);
                fixedDeduction.CreatedDateTime = DateTime.Now;
                var save = _fixedDeductionManager.Add(fixedDeduction);
                if (save)
                {
                    TempData["Success"] = "Successfully saved";
                }
                else
                {
                    TempData["Error"] = "Fail to save";
                }
            }
          
            return RedirectToAction("FixedDeduction");
        }



        [HttpGet]
        public IActionResult AddUserDeduction(int? id)
        {
            UserDeduction userDeduction = new UserDeduction();
            if (id != null)
            {
                userDeduction = _userDeductionManager.GetById((int)id);
            }
            ViewBag.Deduction = _deductionManager.GetAll();
            ViewBag.users = _userManager.Users.ToList();


            ViewBag.SuccessMessage = TempData["Success"];
            ViewBag.ErrorMessage = TempData["Error"];
            return View(userDeduction);
        }

        [HttpPost]
        public IActionResult AddUserDeduction(UserDeduction u, String btnValue)
        {
            if (u.IsSameEveryMonth)
            {
                u.Month = 0;
                u.Year = 0;
            }
            if (btnValue == "Save")
            {
                var result = _userDeductionManager.Add(u);
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
                var oldUserDeduction = _userDeductionManager.GetById(u.Id);

                if (oldUserDeduction != null)
                {
                    oldUserDeduction.DeductionId = u.DeductionId;
                    oldUserDeduction.AppUserId = u.AppUserId;
                    oldUserDeduction.IsSameEveryMonth = u.IsSameEveryMonth;
                    oldUserDeduction.Amount = u.Amount;
                    oldUserDeduction.Month = u.Month;
                    oldUserDeduction.Year = u.Year;

                    var result = _userDeductionManager.Update(u);
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
            var list = _userDeductionManager.GetList();           
            return View(list);
        }
    }
}
