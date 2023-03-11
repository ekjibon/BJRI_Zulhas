using AspNetCore.Reporting;
using LMS_Web.Areas.CPF.Interface;
using LMS_Web.Areas.CPF.Manager;
using LMS_Web.Areas.CPF.Models;
using LMS_Web.Areas.CPF.ViewModels;
using LMS_Web.Areas.Loan;
using LMS_Web.Areas.Loan.Interface;
using LMS_Web.Areas.Loan.Manager;
using LMS_Web.Areas.Loan.Models;
using LMS_Web.Areas.Salary.Interface.Manager;
using LMS_Web.Areas.Salary.Manager;
using LMS_Web.Areas.Salary.Models;
using LMS_Web.Areas.Salary.ViewModels;
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
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using StationManager = LMS_Web.Areas.Salary.Manager.StationManager;

namespace LMS_Web.Areas.CPF.Controllers
{
    [Area("CPF")]
    public class CpfInfoController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly UserWiseLoanManager _userWiseLoanManager;
        private readonly CpfInfoManager _cpfInfoManager;
        private readonly WingsManager _wingsManager;
        private readonly StationManager _stationManager;
        private readonly IWebHostEnvironment _webHostEnvironment;
        private readonly FiscalYearManager _fiscalYearManager;
        private readonly PayScaleManager _payScaleManager;
        private readonly CpfPercentManager _cpfPercentManager;
        private readonly GradeManager _gradeManager;
        private readonly UserSpecificAllowanceManager _userSpecificAllowanceManager;
        private readonly LoanInstallmentInfoManager _loanInstallmentInfoManager;
        public CpfInfoController(ApplicationDbContext dbContext, UserManager<AppUser> userManager, IWebHostEnvironment webHostEnvironment)
        {
            _webHostEnvironment = webHostEnvironment;
            _userManager = userManager;
            _userWiseLoanManager = new UserWiseLoanManager(dbContext);
            _cpfInfoManager = new CpfInfoManager(dbContext);
            _wingsManager = new WingsManager(dbContext);
            _stationManager = new StationManager(dbContext);
            _fiscalYearManager = new FiscalYearManager(dbContext);
            _payScaleManager = new PayScaleManager(dbContext);
            _cpfPercentManager = new CpfPercentManager(dbContext);
            _gradeManager = new GradeManager(dbContext);
            _userSpecificAllowanceManager = new UserSpecificAllowanceManager(dbContext);
            _loanInstallmentInfoManager = new LoanInstallmentInfoManager(dbContext);


        }
        public IActionResult Calculate()
        {
            ViewBag.Wings = _wingsManager.GetWings();
            ViewBag.Station = _stationManager.GetAll();
            ViewBag.Grade = _gradeManager.GetList();
            return View();
        }
        [HttpPost]
        public IActionResult Calculate(int year, int month, int StationId, int FromGradeId, int ToGradeId)
        {

            List<CpfVM> sources = new List<CpfVM>();
            var cpfInfo = _cpfInfoManager.GetBetweenGrade(StationId, FromGradeId, ToGradeId, year, month);
            var loans = _loanInstallmentInfoManager.GetCurrentMonthLoan(year, month);
            foreach (var item in cpfInfo)
            {
                CpfVM obj = new CpfVM();
                {                   
                    //string.Concat(item.ArrearsBasic.ToString().Select(c => (char)('\u09E6' + c - '0')));
                    obj.ArrearsBasic = string.Concat(item.ArrearsBasic.ToString().Select(c => (char)('\u09E6' + c - '0'))).Replace("৤", ".");
                    obj.BasicSalary = string.Concat(item.BasicSalary.ToString().Select(c => (char)('\u09E6' + c - '0'))).Replace("৤", ".");

                    obj.CpfFirstLoan = string.Concat((loans.FirstOrDefault(c => c.LoanHeadId == 1 && c.AppUserId == item.AppUserId)?.UserWiseLoan?.CapitalDeductionAmount ??0).ToString().Select(c => (char)('\u09E6' + c - '0'))).Replace("৤", ".");
                    obj.CpfSecondLoan = string.Concat((loans.FirstOrDefault(c => c.LoanHeadId == 2 && c.AppUserId == item.AppUserId)?.UserWiseLoan?.CapitalDeductionAmount??0).ToString().Select(c => (char)('\u09E6' + c - '0'))).Replace("৤", ".");
                    obj.EmployeeName = item.AppUser.EmployeeCodeBangla + "-" + item.AppUser.FullNameBangla + "," + item.AppUser.Designation.Name;
                    obj.GovtContribution = string.Concat(item.GovtContribution.ToString().Select(c => (char)('\u09E6' + c - '0'))).Replace("৤", ".");
                    obj.GrandTotal = string.Concat(item.GrandTotal.ToString().Select(c => (char)('\u09E6' + c - '0'))).Replace("৤", ".");
                    obj.SelfContribution = string.Concat(item.SelfContribution.ToString().Select(c => (char)('\u09E6' + c - '0'))).Replace("৤", ".");
                    obj.TotalContribution = string.Concat(item.TotalContribution.ToString().Select(c => (char)('\u09E6' + c - '0'))).Replace("৤", ".");
                }

                sources.Add(obj);
            }

            string rptPath = $"{this._webHostEnvironment.WebRootPath}\\Reports\\CpfReport.rdlc";
            string mimtype = "application/pdf";
            var report = new LocalReport(rptPath);
            Dictionary<string, string> parameters = new Dictionary<string, string>();
            var extenstion = 1;
            parameters.Add("monthYear", MonthInBangla(month) + "/" + string.Concat(year.ToString().Select(c => (char)('\u09E6' + c - '0'))));
            report.AddDataSource("dsCpfReport", sources);
            var result = report.Execute(RenderType.Pdf, extenstion, parameters, mimtype);
            return File(result.MainStream, "application/pdf");
        }

        public IActionResult CPFCalculate()
        {
            ViewBag.Grade = _gradeManager.GetList();
            var list = _cpfInfoManager.GetList();
            return View();
        }
        [HttpPost]
        public IActionResult CPFCalculate(int year, int month)
        {

            //var payScales = _payScaleManager.GetList();
            var percent = _cpfPercentManager.GetByName("CPF Regular")?.Percent ?? 10;
            var govtCont = _cpfPercentManager.GetByName("GovtContribution")?.Percent ?? 12;
            var Allusers = _userManager.Users.ToList();
            var arrearsBasic = _userSpecificAllowanceManager.ArrearBasicMonthYearPayScale(year, month, "ArrearsBasic");
            int lastMonth = month - 1;
            int lastYear = year;
            if (lastMonth == 0)
            {
                lastMonth = 12;
                lastYear = year - 1;
            }
            var cpfInfos = _cpfInfoManager.GetListByMonth(lastYear, lastMonth);
            List<CpfInfo> list = new List<CpfInfo>();
            foreach (var user in Allusers)
            {

                CpfInfo cpInfo = new CpfInfo();
                cpInfo.AppUserId = user.Id;
                cpInfo.Year = year;
                cpInfo.Month = month;
                cpInfo.BasicSalary = user.CurrentBasic ?? 0;
                cpInfo.SelfContribution = (user.CurrentBasic * percent / 100) ?? 0;
                cpInfo.GovtContribution = (user?.CurrentBasic / govtCont) ?? 0;
                var ab = arrearsBasic.FirstOrDefault(c => c.AppUserId == user.Id);
                cpInfo.ArrearsBasic = ab?.Amount ?? 0 + (ab?.Amount ?? 0 / 12);
                cpInfo.TotalContribution = cpInfo.SelfContribution + cpInfo.GovtContribution + cpInfo.ArrearsBasic;

                var cpf = cpfInfos.FirstOrDefault(c => c.AppUserId == user.Id);
                cpInfo.GrandTotal = (cpf?.GrandTotal ?? 0 )+ (cpInfo?.TotalContribution ?? 0);


                list.Add(cpInfo);
            }
            _cpfInfoManager.Add(list);

            return View();
        }


        public IActionResult List()
        {
            ViewBag.Success = TempData["Success"];
            ViewBag.Error = TempData["Error"];
            var list = _cpfInfoManager.GetList();
            return View(list);
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
