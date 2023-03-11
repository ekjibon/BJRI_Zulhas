using LMS_Web.Areas.Salary.Interface.Manager;
using LMS_Web.Areas.Salary.Manager;
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
    public class FiscalYearController : Controller
    {
       
        private FiscalYearManager fiscalYearManager;
       


        public FiscalYearController(ApplicationDbContext db)
        {
          fiscalYearManager=new FiscalYearManager(db);

        }
        [HttpGet]
        public async Task<IActionResult> Add(int? id)
        {
            FiscalYear fiscalYear = new FiscalYear();
            if (id != null)
            {
                fiscalYear = fiscalYearManager.GetById((int)id);
            }
            return View(fiscalYear);
        }
        [HttpPost]
        public async Task<IActionResult> Add(FiscalYear f,string btnValue)
        {
            if (btnValue == "Save")
            {
                var result = fiscalYearManager.Add(f);
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
                var FiscalYear = fiscalYearManager.GetById(f.Id);

                if (FiscalYear != null)
                {
                    FiscalYear.Id = f.Id;
                    FiscalYear.Value = f.Value;                  
                    var result = fiscalYearManager.Update(f);
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
            var list = fiscalYearManager.GetList();
            return View(list);
        }

    }
}
