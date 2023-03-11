using LMS_Web.Areas.Settings.Interface;
using LMS_Web.Areas.Settings.Manager;
using LMS_Web.Areas.Settings.Models;
using LMS_Web.Data;
using LMS_Web.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using LMS_Web.Areas.Salary.Models;

namespace LMS_Web.Areas.Settings.Controllers
{
    [Area("Settings")]
    public class ChildrenInfoController : Controller
    {
        private ChildrenInfoManager childrenInfoManager;
        private UserManager<AppUser> userManager;
        public ChildrenInfoController(ApplicationDbContext db, UserManager<AppUser> _userManager)
        {
            userManager = _userManager;
            childrenInfoManager = new ChildrenInfoManager(db);
        }
        [HttpGet]
        public IActionResult Add(int? id)
        {
            ChildrenInfo childrenInfo = new ChildrenInfo();
            if (id != null)
            {
                childrenInfo = childrenInfoManager.GetById((int)id);
            }
            ViewBag.users = userManager.Users.ToList();


           
            return View(childrenInfo);
        }
        [HttpPost]
        public IActionResult Add(ChildrenInfo c, String btnValue)
        {
            if (btnValue == "Save")
            {
                var result = childrenInfoManager.Add(c);
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
                var Child = childrenInfoManager.GetById(c.Id);

                if (Child != null)
                {
                    Child.Id = c.Id;
                    Child.AppUserId = c.AppUserId;
                    Child.Name = c.Name;
                    Child.DateOfBirth = c.DateOfBirth;
                    Child.IsApprove =c.IsApprove;
                    Child.ApproveDate =c.ApproveDate;

                    var result = childrenInfoManager.Update(c);
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
            ViewBag.Success = TempData["Success"];
            ViewBag.Error = TempData["Error"];
            var list = childrenInfoManager.GetList();
            return View(list);
        }
    }
}
