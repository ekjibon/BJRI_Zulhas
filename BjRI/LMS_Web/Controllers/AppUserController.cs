using LMS_Web.Areas.Salary.Interface.Manager;
using LMS_Web.Areas.Salary.Manager;
using LMS_Web.Areas.Salary.Models;
using LMS_Web.Data;
using LMS_Web.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System;
using System.ComponentModel.DataAnnotations;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using LMS_Web.Areas.Settings.Manager;
using LMS_Web.Areas.Settings.Models;

namespace LMS_Web.Controllers
{

    [Authorize]
    public class AppUserController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly ApplicationDbContext _context;
        private readonly IWebHostEnvironment _webHostEnvironment;
        private readonly SuspensionHistoryManager _suspensionHistoryManager;
        private readonly LienUserManager _lienUserManager;
        private readonly TransferHistoryManager transferHistoryManager;
        private string filePath;

        public AppUserController(UserManager<AppUser> userManager, RoleManager<IdentityRole> roleManager, ApplicationDbContext context, IWebHostEnvironment webHostEnvironment)
        {
            _userManager = userManager;
            _roleManager = roleManager;
            _context = context;
            _webHostEnvironment = webHostEnvironment;
            _suspensionHistoryManager = new SuspensionHistoryManager(context);
            _lienUserManager = new LienUserManager(context);
            transferHistoryManager = new TransferHistoryManager(context);
        }


        public IActionResult Index()
        {
            ViewBag.Success = TempData["SuccessMessage"];
            ViewBag.Error = TempData["ErrorMessage"];
            ViewData["Station"] = new SelectList(_context.Stations, "Id", "Name");
            var users = _context.Users
                .Where(c => c.IsActive)
                .Include(c => c.Wing)
                .Include(c => c.Section)
                .Include(c => c.Designation)
                .Include(c => c.Department)
                .ToList();

            return View(users);
        }

        public IActionResult ArchiveList()
        {
            var users = _context.Users
                .Where(c => c.IsActive == false)
                .Include(c => c.Wing)
                .Include(c => c.Section)
                .Include(c => c.Designation)
                .Include(c => c.Department)
                .ToList();
            return View(users);
        }

        [HttpGet]
        public IActionResult UpdateUserInfo()
        {
            var user = _userManager.GetUserAsync(User).Result;
            ViewData["Wing"] = new SelectList(_context.Wing.Where(c => c.IsActive), "Id", "Name");
            ViewData["Designation"] = new SelectList(_context.Designation, "Id", "Name");
            ViewData["Department"] = new SelectList(_context.Department, "Id", "Name");
            ViewData["Grade"] = new SelectList(_context.Grades, "Id", "Name");
            ViewData["GradeStep"] = new SelectList(_context.GradeSteps, "Id", "Name");
            ViewData["Station"] = new SelectList(_context.Stations, "Id", "Name");
            ViewData["ResidentialStatus"] = new SelectList(_context.ResidentStatus, "Id", "Name");            
            ViewData["SuccessMessage"] = TempData["SuccessMessage"];
            return View(user);
        }


        [HttpPost]
        public async Task<IActionResult> UpdateUserInfo(AppUser appUser)
        {

            var userId = _userManager.GetUserId(User);
            var user = await _userManager.GetUserAsync(HttpContext.User);

            string uplaodsFolder = Path.Combine(_webHostEnvironment.WebRootPath, "image/user/");

            string uniqueFileName = null;
            if (appUser.ImagePath != null)
            {
                uniqueFileName = Guid.NewGuid().ToString() + "_" + appUser.ImagePath.FileName;
                filePath = Path.Combine(uplaodsFolder, uniqueFileName);


                await using var stream = new FileStream(filePath, FileMode.Create);
                await appUser.ImagePath.CopyToAsync(stream);
            }
            else
            {
                uniqueFileName = user.Image;
            }



            // user.Id = user.Id;
            
            user.Gender = appUser.Gender;
            user.FullName = appUser.FullName;
            user.FullNameBangla = appUser.FullNameBangla;
            user.StationId = appUser.StationId;
            user.GradeId = appUser.GradeId;
            user.CurrentGradeId = appUser.CurrentGradeId;
            user.CurrentBasic = appUser.CurrentBasic;
            user.BankAccountNo = appUser.BankAccountNo;
            user.BankAccountNoBangla = string.Concat(appUser.BankAccountNo.Select(c => (char)('\u09E6' + c - '0')));
            user.EmployeeCodeBangla = string.Concat(user.EmployeeCode.Select(c => (char)('\u09E6' + c - '0')));
            user.ResidentialStatusId = appUser.ResidentialStatusId;
            user.StationId = appUser.StationId;
            user.Image = uniqueFileName;
            user.DepartmentId = appUser.DepartmentId;
            user.DesignationId = appUser.DesignationId;
            user.SectionId = appUser.SectionId;
            user.WingId = appUser.WingId;
            user.UpdatedBy = userId;
            user.UpdatedDateTime = DateTime.Now;
            user.NID = appUser.NID;
            user.Type = appUser.Type;
            if (appUser.BirthDate != DateTime.MinValue)
            {
                user.BirthDate = appUser.BirthDate;
            }

            if (appUser.JoiningDate != DateTime.MinValue)
            {
                user.JoiningDate = appUser.JoiningDate;
            }

            user.Religion = appUser.Religion;
            user.PhoneNumber = appUser.PhoneNumber;
            user.UserName = appUser.PhoneNumber;
            user.NormalizedUserName = appUser.PhoneNumber;

            var res = _context.SaveChanges();

            if (res>0)
            {
                TempData["SuccessMessage"] = "ইউজার আপডেট হয়েছে";
            }
            else
            {
                TempData["SuccessMessage"] = "ইউজার আপডেট হয়নি";
            }

            return RedirectToAction("UpdateUserInfo");
        }
        public IActionResult AddTransferUser(string userId, int toStation, DateTime newStationJoinDate, DateTime currentStationLastOfficeDate)
        {
            TransferHistory transfer=new TransferHistory();
            var user = _userManager.Users.FirstOrDefault(x => x.Id == userId);
            if (user != null)
            {
                transfer.AppUserId = user.Id;
                transfer.FromStationId = user.StationId??0;
                transfer.ToStationId= toStation;
                transfer.TransferDate = currentStationLastOfficeDate;
                transfer.CreatedById = _userManager.GetUserId(User);
                transfer.CreatedDateTime=DateTime.Now;
                var res = transferHistoryManager.Add(transfer);
                
                user.CurrentStationJoiningDate = newStationJoinDate;
                user.StationId = toStation;
                _userManager.UpdateAsync(user);
                if (res)
                {
                    TempData["Success"] = "Successfully Added";
                }
                else
                {
                    TempData["Error"] = "Failed Add";
                }

            }
            else
            {
                TempData["Error"] = "User Not Found";
            }


            return RedirectToAction("Index");

        }

        public IActionResult ResignUser(string resignUserId, DateTime resignationDate)
        {
            var user = _userManager.Users.FirstOrDefault(x => x.Id == resignUserId);
            if (user != null)
            {
                user.ResignationDate = resignationDate;
                _userManager.UpdateAsync(user);                
            }

            return RedirectToAction("Index");
        }
        [HttpGet]
        public async Task<IActionResult> SuspendUser(string SuspensionuserId)
        {
            var user = _userManager.Users.FirstOrDefault(x => x.Id == SuspensionuserId);
            if (user != null)
            {
                SuspensionHistory suspensionHistory = new SuspensionHistory();
                suspensionHistory.AppUserId = user.Id;
                suspensionHistory.StartDate = DateTime.Now;
                suspensionHistory.EndDate = DateTime.Now;
                suspensionHistory.CreatedById = _userManager.GetUserId(User);
                //user.IsSuspended = true;
               _suspensionHistoryManager.Add(suspensionHistory);
            }
            var saved = _context.SaveChanges();
            if (saved > 0)
            {
                TempData["SuccessMessage"] = "Liened";
            }
            else
            {
                TempData["SuccessMessage"] = "Not Liened";
            }
            return RedirectToAction("SuspendedList");

        }

        public async Task<IActionResult> LienUser(string id)
        {
            var user = _userManager.Users.FirstOrDefault(x => x.Id == id);
            if (user != null)
            {
                LienUser lienUser = new LienUser();
                lienUser.StartDate = DateTime.Now;
                lienUser.AppUserId = id;
                lienUser.CreatedById = _userManager.GetUserId(User);
                user.IsLien = true;
               _lienUserManager.Add(lienUser);
            }
            var saved = _context.SaveChanges();
            if (saved > 0)
            {
                TempData["SuccessMessage"] = "Liened";
            }
            else
            {
                TempData["SuccessMessage"] = "Not Liened";
            }
            return RedirectToAction("LienedList");
        }
        public IActionResult SuspendedList()
        {
            var users = _context.Users
                .Where(c => c.IsSuspended==true)
                .Include(c => c.Wing)
                .Include(c => c.Section)
                .Include(c => c.Designation)
                .Include(c => c.Department)
                .ToList();

            return View(users);
        }
        public IActionResult RemoveSuspend(string id)
        {
            var user = _userManager.Users.FirstOrDefault(x => x.Id == id);
            if (user != null)
            {
               
                user.IsSuspended = false;
               
            }
            var suspendUser = _suspensionHistoryManager.GetByUserId(id);
            if (suspendUser != null)
            {
                suspendUser.EndDate = DateTime.Now;
            }

            _suspensionHistoryManager.Update(suspendUser);
            var saved = _context.SaveChanges();
            if (saved > 0)
            {
                TempData["SuccessMessage"] = "Susppended";
            }
            else
            {
                TempData["SuccessMessage"] = "Not Suspended";
            }
            return RedirectToAction("SuspendedList");
        }
        public IActionResult LienedList()
        {
            var users = _context.Users
                .Where(c => c.IsLien==true)
                .Include(c => c.Wing)
                .Include(c => c.Section)
                .Include(c => c.Designation)
                .Include(c => c.Department)
                .ToList();

            return View(users);
        }
        public IActionResult RemoveLien(string id)
        {
            var user = _userManager.Users.FirstOrDefault(x => x.Id == id);
            if (user != null)
            {
                user.IsLien = false;
            }

            var lienUser = _lienUserManager.GetByUserId(id);
            if (lienUser != null)
            {
                lienUser.EndDate = DateTime.Now;
            }

            _lienUserManager.Update(lienUser);
            var saved = _context.SaveChanges();
            if (saved > 0)
            {
                TempData["SuccessMessage"] = "Liened";
            }
            else
            {
                TempData["SuccessMessage"] = "Not Liened";
            }
            return RedirectToAction("LienedList");
        }
        [HttpGet]
        public IActionResult UpdateUserInfoForAdmin(string id)
        {

            ViewData["Wing"] = new SelectList(_context.Wing.Where(c => c.IsActive), "Id", "Name");
            ViewData["Designation"] = new SelectList(_context.Designation, "Id", "Name");
            ViewData["Department"] = new SelectList(_context.Department, "Id", "Name");
            ViewData["Grade"] = new SelectList(_context.Grades, "Id", "Name");
            ViewData["GradeStep"] = new SelectList(_context.GradeSteps, "Id", "Name");
            ViewData["Station"] = new SelectList(_context.Stations, "Id", "Name");
            ViewData["ResidentialStatus"] = new SelectList(_context.ResidentStatus, "Id", "Name");
            var user = _userManager.Users.FirstOrDefault(x => x.Id == id);
            ViewData["SuccessMessage"] = TempData["SuccessMessage"];
            return View(user);
        }


        [HttpPost]
        public async Task<IActionResult> UpdateUserInfoForAdmin(AppUser appUser)
        {
            var userId = appUser.Id;
            var user = _context.Users.FirstOrDefault(x => x.Id == appUser.Id);
            //if (user.PhoneNumber != appUser.PhoneNumber)
            //{
            //    var users = _userManager.Users;

            //    if (users.Any(x => x.PhoneNumber == appUser.PhoneNumber))
            //    {
            //        ModelState.AddModelError("DuplicateMobileNo", "উপরোক্ত নাম্বার দিয়ে ইতিপূর্বে কর্মকর্তা তৈরী করা হয়েছে");
            //    }

            //}
            _context.Entry(user).State = EntityState.Detached;
            string previousUserImageUrl = user.Image;
            string uplaodsFolder = Path.Combine(_webHostEnvironment.WebRootPath, "image/user/");
            bool isImageModified = appUser.ImagePath != null;
            string uniqueFileName = null;
            if (appUser.ImagePath != null)
            {
                uniqueFileName = Guid.NewGuid().ToString() + "_" + appUser.ImagePath.FileName;
                filePath = Path.Combine(uplaodsFolder, uniqueFileName);
                await using var stream = new FileStream(filePath, FileMode.Create);
                await appUser.ImagePath.CopyToAsync(stream);
            }
            else
            {
                uniqueFileName = user.Image;
            }
            user.Id = user.Id;
            user.Gender = appUser.Gender;
            user.FullName = appUser.FullName;
            user.FullNameBangla = appUser.FullNameBangla;
            user.StationId = appUser.StationId;
            user.GradeId = appUser.GradeId;
            user.CurrentGradeId = appUser.CurrentGradeId;
            user.CurrentBasic = appUser.CurrentBasic;
            user.BankAccountNo = appUser.BankAccountNo;
            user.BankAccountNoBangla = string.Concat(appUser.BankAccountNo.Select(c => (char)('\u09E6' + c - '0'))); 
            user.EmployeeCodeBangla = string.Concat(user.EmployeeCode.Select(c => (char)('\u09E6' + c - '0'))); 
            user.ResidentialStatusId = appUser.ResidentialStatusId;
            user.StationId = appUser.StationId;
            user.Image = uniqueFileName;
            user.DepartmentId = appUser.DepartmentId;
            user.DesignationId = appUser.DesignationId;
            user.EmployeeCode = appUser.EmployeeCode;
            user.PhoneNumber = appUser.PhoneNumber;
            user.UserName = appUser.PhoneNumber;
            user.NormalizedUserName = appUser.PhoneNumber;
           // user.BirthDate = appUser.BirthDate;
            user.SectionId = appUser.SectionId;
            user.WingId = appUser.WingId;
            user.UpdatedBy = userId;
            user.UpdatedDateTime = DateTime.Now;
            user.NID = appUser.NID;
            user.Type = appUser.Type;
            //user.JoiningDate = appUser.JoiningDate;
            user.Religion = appUser.Religion;
            if (appUser.BirthDate != DateTime.MinValue)
            {
                user.BirthDate = appUser.BirthDate;
            }

            if (appUser.JoiningDate != DateTime.MinValue)
            {
                user.JoiningDate = appUser.JoiningDate;
            }
            var result = _context.Entry(user).State = EntityState.Modified;
            var saved = _context.SaveChanges();

            if (saved > 0)
            {
                //if (isImageModified)
                //{
                //    if (System.IO.File.Exists(Path.Combine(uplaodsFolder, previousUserImageUrl)))
                //    {

                //        System.IO.File.Delete(Path.Combine(uplaodsFolder, previousUserImageUrl));
                //    }

                //}

                TempData["SuccessMessage"] = "ইউজার আপডেট হয়েছে";
                return RedirectToAction("Index");
            }
            else
            {
                TempData["SuccessMessage"] = "ইউজার আপডেট হয়নি";

            }

            return RedirectToAction("UpdateUserInfoForAdmin");
        }



        public IActionResult Roles()
        {
            var roles = _roleManager.Roles;
            return View(roles);
        }


        public IActionResult AddRole() => View();

        [HttpPost]
        public async Task<IActionResult> AddRole([Required] string name)
        {
            if (ModelState.IsValid)
            {
                IdentityResult result = await _roleManager.CreateAsync(new IdentityRole(name));
                if (result.Succeeded)
                    return RedirectToAction("Index");
            }
            return View(name);
        }

        public IActionResult Delete(string id)
        {
            var user = _context.Users.Find(id);

            user.IsActive = false;

            _context.Update(user);

            if (_context.SaveChanges() > 0)
            {
                TempData["DeleteMessage"] = "কর্মকর্তা মুছে ফেলা হয়েছে";
            }
            return RedirectToAction("Index");
        }
    }
}
