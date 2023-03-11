using LMS_Web.Areas.CPF.Manager;
using LMS_Web.Areas.CPF.Models;
using LMS_Web.Areas.Settings.Interface;
using LMS_Web.Areas.Settings.Manager;
using LMS_Web.Areas.Settings.Models;
using LMS_Web.Data;
using LMS_Web.SecurityExtension;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;

namespace LMS_Web.Areas.CPF.Controllers
{
    [Area("CPF")]
    public class CpfHomeController : Controller
    {
        private CpfPercentManager cpfPercentManager;
        public CpfHomeController(ApplicationDbContext db)
        {
            cpfPercentManager = new CpfPercentManager(db);

        }
        [MiddlewareFilter(typeof(MyCustomAuthenticationMiddlewarePipeline))]
       
        public IActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public IActionResult Edit(int? id)
        {
            CpfPercent cpfPercent = new CpfPercent();
            if (id != null)
            {
                cpfPercent = cpfPercentManager.GetById((int)id);
            }
            
            return View(cpfPercent);
        }
        [HttpPost]
        public IActionResult Edit(CpfPercent c)
        {
           
                var Child = cpfPercentManager.GetById(c.Id);

                if (Child != null)
                {
                    //Child.Id = c.Id;
                    Child.Percent = c.Percent;
                    //Child.Name = c.Name;
                   

                    var result = cpfPercentManager.Update(c);
                    if (result)
                    {
                        TempData["Success"] = "Successfully Update";
                    }
                    else
                    {
                        TempData["Error"] = "Failed Update";
                    }

                }
            
            return RedirectToAction("List");
        }
        public IActionResult List()
        {
            ViewBag.Success = TempData["Success"];
            ViewBag.Error = TempData["Error"];
            var list = cpfPercentManager.GetList();
            return View(list);
        }
    }
}
