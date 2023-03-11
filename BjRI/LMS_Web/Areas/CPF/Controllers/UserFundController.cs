using AspNetCore.Reporting;
using LMS_Web.Areas.CPF.Interface;
using LMS_Web.Areas.CPF.Manager;
using LMS_Web.Areas.CPF.Models;
using LMS_Web.Areas.CPF.ViewModels;
using LMS_Web.Areas.Salary.Enum;
using LMS_Web.Areas.Salary.Interface.Manager;
using LMS_Web.Areas.Salary.Manager;
using LMS_Web.Areas.Salary.Models;
using LMS_Web.Areas.Salary.ViewModels;
using LMS_Web.Areas.Settings.Interface;
using LMS_Web.Areas.Settings.Manager;
using LMS_Web.Areas.Settings.Models;
using LMS_Web.Areas.Settings.ViewModels;
using LMS_Web.Data;
using LMS_Web.Manager;
using LMS_Web.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query;
using System.Collections.Generic;
using System.Linq;
using StationManager = LMS_Web.Areas.Salary.Manager.StationManager;

namespace LMS_Web.Areas.CPF.Controllers
{
    [Area("CPF")]
    public class UserFundController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly UserFundManager _userFundManager; 
        private readonly StationManager _stationManager;
        private readonly WingsManager _wingsManager;
        private readonly GradeManager _gradeManager;
        private readonly IWebHostEnvironment _webHostEnvironment;
        private readonly DeductionManager _deductionManager;
        private readonly UserDeductionManager _userDeductionManager;
        private readonly GradeWiseFixedDeductionManager _gradeWiseFixedDeductionManager;
        private readonly FixedDeductionManager _fixedDeductionManager;


        public UserFundController(ApplicationDbContext db, UserManager<AppUser> userManager, IWebHostEnvironment webHostEnvironment)
        {
            _userManager = userManager;
            _userFundManager = new UserFundManager(db);
            _wingsManager = new WingsManager(db);
            _stationManager= new StationManager(db);
            _gradeManager = new GradeManager(db);
            _webHostEnvironment = webHostEnvironment;
            _deductionManager = new DeductionManager(db);
            _userDeductionManager = new UserDeductionManager(db);
            _gradeWiseFixedDeductionManager= new GradeWiseFixedDeductionManager(db);
            _fixedDeductionManager = new FixedDeductionManager(db);

        }
        public IActionResult UserFundReport()
        {
            ViewBag.Station = _stationManager.GetAll();
            ViewBag.Wings = _wingsManager.GetWings();
            ViewBag.Grade = _gradeManager.GetList();
            return View();
        }
        [HttpPost]
        public IActionResult UserFundReport(int FromGradeId, int ToGradeId, int year, int month)
        {

            List<UserFundVm> sources = new List<UserFundVm>();
            var UserInfo = _userFundManager.GetBetweenGrade(FromGradeId, ToGradeId, year, month);
            foreach (var users in UserInfo)
            {
                UserFundVm user = new UserFundVm();
                {
                    user.EmployeeName = users.AppUser.FullNameBangla + "-" + users.AppUser.FullNameBangla + "," + users.AppUser.Designation.Name; ;
                    user.WelfareFund = string.Concat(users.WelfareFund.ToString().Select(c => (char)('\u09E6' + c - '0'))).Replace("৤", "."); ;
                    user.GroupInsurance = string.Concat(users.GroupInsurance.ToString().Select(c => (char)('\u09E6' + c - '0'))).Replace("৤", "."); ;
                    user.Rehabilitation = string.Concat(users.Rehabilitation.ToString().Select(c => (char)('\u09E6' + c - '0'))).Replace("৤", "."); ;
                    user.LowSalaryEmployee = "";
                }
                sources.Add(user);
            }

            string rptPath = $"{this._webHostEnvironment.WebRootPath}\\Reports\\FundReport.rdlc";
            string mimtype = "application/pdf";
            var report = new LocalReport(rptPath);
            Dictionary<string, string> parameters = new Dictionary<string, string>();
            var extenstion = 1;
            parameters.Add("monthYear", MonthInBangla(month) + "/" + string.Concat(year.ToString().Select(c => (char)('\u09E6' + c - '0'))));
            report.AddDataSource("UserFund", sources);
            var result = report.Execute(RenderType.Pdf, extenstion, parameters, mimtype);
            return File(result.MainStream, "application/pdf");
        }


        public IActionResult GradeWiseUserFund()
        {
            ViewBag.Station = _stationManager.GetAll();
            ViewBag.Wings = _wingsManager.GetWings();
            ViewBag.Grade = _gradeManager.GetList();
            return View();
        }
        [HttpPost]
        public IActionResult GradeWiseUserFund( int year, int month)
        {
            var gradeWiseFixedDeduction = _gradeWiseFixedDeductionManager.GetAll();
            var fixedDeductions = _fixedDeductionManager.GetAll();
            var deductions = _deductionManager.GetAll();
            var userWiseDeductions = _userDeductionManager.GetAll();
            var AllUsers = _userManager.Users.ToList();

            List<UserFundInfo> list = new List<UserFundInfo>();
            foreach (var user in AllUsers )
            {
                var deductioList = deductions.Where(c => c.DeductionType == DeductionType.Others);
                foreach (var users in deductioList)
                {
                    UserFundInfo FundInfo = new UserFundInfo();
                    var data = userWiseDeductions.FirstOrDefault(c => (c.AppUserId == user.Id && c.DeductionId == users.Id && (c.IsSameEveryMonth || (c.Year == year && c.Month == month))));

                    FundInfo.AppUserId = user.Id;
                    FundInfo.CreatedById = user.Id;
                    FundInfo.UpdatedById = user.Id;
                    FundInfo.Year=year;
                    FundInfo.Month=month;
                    if (data != null)
                    {
                        FundInfo.GroupInsurance = data?.Amount ?? 0;
                    }
                    else
                    {
                        var gfd = gradeWiseFixedDeduction.FirstOrDefault(c =>
                            c.DeductionId == users.Id && c.FromGradeId <= user.GradeId && c.ToGradeId >= user.GradeId);

                        if (gfd != null)
                        {
                            FundInfo.WelfareFund = gfd?.Amount ?? 0;
                        }
                        else
                        {
                            var fixedDeduction = fixedDeductions.FirstOrDefault(c => c.DeductionId == users.Id);
                            FundInfo.Rehabilitation = fixedDeduction?.Amount ?? 0;
                        }
                    }
                    list.Add(FundInfo);

                }
               
            }
            _userFundManager.Add(list);
            return View();

        }

        private string MonthInBangla(int month)
        {
            switch (month)
            {
                case 1:
                    return "জানুয়ারী";
                    break;
                case 2:
                    return "ফ্রেব্রুয়ারী";
                    break;
                case 3:
                    return "মার্চ";
                    break;
                case 4:
                    return "এপ্রিল";
                    break;
                case 5:
                    return "মে";
                    break;
                case 6:
                    return "জুন";
                    break;
                case 7:
                    return "জুলাই";
                    break;
                case 8:
                    return "আগস্ট";
                    break;
                case 9:
                    return "সেপ্টেম্বর";
                    break;
                case 10:
                    return "অক্টোবর";
                    break;
                case 11:
                    return "নভেম্বর";
                    break;
                case 12:
                    return "ডিসেম্বর";
                    break;
                default:
                    return "";
                    break;

            }

        }
    }
}
