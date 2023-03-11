using System;
using System.Collections.Generic;
using System.Linq;
using LMS_Web.Areas.Loan.Manager;
using LMS_Web.Areas.Loan.Models;
using LMS_Web.Areas.Settings.Interface;
using LMS_Web.Areas.Settings.Manager;
using LMS_Web.Areas.Settings.Models;
using LMS_Web.Data;
using LMS_Web.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace LMS_Web.Areas.Settings.Controllers
{
    [Area("Settings")]
    public class TaxController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly UserTaxManager _userTaxManager;
        private readonly TaxInstallmentInfoManager _taxInstallmentInfoManager;
        private readonly FiscalYearManager _fiscalYearManager;
        public TaxController(ApplicationDbContext db, UserManager<AppUser> userManager)
        {
            _userManager = userManager;
            _userTaxManager = new UserTaxManager(db);
            _taxInstallmentInfoManager = new TaxInstallmentInfoManager(db);
            _fiscalYearManager=new FiscalYearManager(db);
        }
        [HttpGet]
        public IActionResult Add()
        {
            ViewBag.Users = _userManager.Users.ToList();
            ViewBag.FiscalYear = new SelectList(_fiscalYearManager.GetAll().ToList(), "Id", "Value");

            ViewBag.SuccessMessage = TempData["Success"];
            ViewBag.ErrorMessage = TempData["Error"];
            return View();
        }
        [HttpPost]
        public IActionResult Add(UserTax userTax, int month, int year)
        {
           
            var tax = _userTaxManager.GetByUserId(userTax.AppUserId, userTax.FiscalYearId);
            bool save;
            if (tax != null)
            {
                var taxInstallment = _taxInstallmentInfoManager.GetByMonthYearAndTaxId(year, month,tax.Id);

                var remainingAmount = userTax.TotalAmount - tax.DeductedAmount;
                var remainingInstallment = tax.TotalInstallment - taxInstallment.InstallmentNo - 1;
                var newMonthlyDeduction = remainingAmount / remainingInstallment;
                tax.UpdatedById = _userManager.GetUserId(User);
                tax.UpdatedDateTime = DateTime.Now;
                tax.TotalAmount = userTax.TotalAmount;
                tax.MonthlyDeduction = newMonthlyDeduction;

                save = _userTaxManager.Update(tax);
            }
            else
            {
                userTax.CreatedById = _userManager.GetUserId(User);
                userTax.CreatedDateTime = DateTime.Now;
                userTax.DeductedAmount = 0;
                userTax.MonthlyDeduction = userTax.TotalAmount / userTax.TotalInstallment;
                save = _userTaxManager.Add(userTax);

                // Start -------  New Code for Taxt InstallmentInfo ----------------

                List<TaxInstallmentInfo> allList = new List<TaxInstallmentInfo>();

                for (int i = 0; i < userTax.TotalInstallment; i++)
                {

                    TaxInstallmentInfo taxInstallmentInfo = new TaxInstallmentInfo();
                    taxInstallmentInfo.AppUserId = userTax.AppUserId;
                    taxInstallmentInfo.InstallmentNo = i + 1;
                    taxInstallmentInfo.Month = month;
                    taxInstallmentInfo.Year = year;
                    taxInstallmentInfo.UserTaxId = userTax.Id;
                    allList.Add(taxInstallmentInfo);

                    month += 1;
                    if (month > 12)
                    {
                        month = 1;
                        year++;

                    }

                }
                _taxInstallmentInfoManager.Add(allList);
                // End---------
                
            }
            if (save)
            {

                TempData["Success"] = "Successfully Saved";
            }
            else
            {
                TempData["Error"] = "Failed to save. Please try again";
            }

            return RedirectToAction("Add");
        }

        public IActionResult LoadUserTax(string userId, int fiscalYear)
        {
            var tax = _userTaxManager.GetByUserId(userId, fiscalYear);
            return PartialView("_LoadUserTax", tax);
        }
    }
}
