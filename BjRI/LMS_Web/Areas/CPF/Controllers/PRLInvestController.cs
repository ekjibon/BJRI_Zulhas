using AspNetCore.Reporting;
using LMS_Web.Areas.CPF.Manager;
using LMS_Web.Areas.CPF.ViewModels;
using LMS_Web.Areas.Loan.Manager;
using LMS_Web.Areas.Salary.Manager;
using LMS_Web.Areas.Settings.Manager;
using LMS_Web.Data;
using LMS_Web.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Collections.Generic;
using System;
using System.Linq;

namespace LMS_Web.Areas.CPF.Controllers
{
    [Area("CPF")]
    public class PRLInvestController : Controller
    {

        private readonly UserManager<AppUser> _userManager;
        private readonly UserWiseLoanManager _userWiseLoanManager;
        private readonly CpfInfoManager _cpfInfoManager;
        private readonly InvestmentInfoManager _investmentInfoManager;
        private readonly IWebHostEnvironment _webHostEnvironment;
        private readonly UserSpecificAllowanceManager _userSpecificAllowanceManager;
        private readonly LoanInstallmentInfoManager _loanInstallmentInfoManager;
        private readonly Salary.Manager.StationManager _stationManager;
        private readonly CpfPercentManager _cpfPercentManager;
        private readonly FiscalYearManager _fiscalYearManager;

        public PRLInvestController(ApplicationDbContext dbContext, UserManager<AppUser> userManager, IWebHostEnvironment webHostEnvironment)
        {
            _webHostEnvironment = webHostEnvironment;
            _userManager = userManager;
            _userWiseLoanManager = new UserWiseLoanManager(dbContext);
            _cpfInfoManager = new CpfInfoManager(dbContext);
            _userSpecificAllowanceManager = new UserSpecificAllowanceManager(dbContext);
            _loanInstallmentInfoManager = new LoanInstallmentInfoManager(dbContext);
            _investmentInfoManager = new InvestmentInfoManager(dbContext);
            _stationManager = new Salary.Manager.StationManager(dbContext);
            _cpfPercentManager = new CpfPercentManager(dbContext);
            _fiscalYearManager = new FiscalYearManager(dbContext);

        }
        public IActionResult PRLInvestmentReport()
        {
            ViewBag.users = _userManager.Users.ToList();
            ViewBag.Station = _stationManager.GetAll();
            ViewBag.FiscalYear = new SelectList(_fiscalYearManager.GetAll().ToList(), "Value", "Value");
            return View();
        }

        [HttpPost]
        public IActionResult PRLInvestmentReport(string AppUserId, int fyear, int fmonth, int tyear, int tmonth)
        {
            //int fmonth = 12;
            //int tmonth = 1;
            //var fisYear = FiscalYear.Split("-");
            //int fyear = Convert.ToInt32(fisYear[0]);
            //int tyear = Convert.ToInt32(fisYear[1]);

            List<InvestmentVm> source = new List<InvestmentVm>();
            var InvestInfo = _investmentInfoManager.GetListByMonthUser(fyear, fmonth, tyear, tmonth, AppUserId);

            var bellowFifteen = _cpfPercentManager.GetByName("CPFInterestBellow15")?.Percent ?? 13;
            var bellowThirty = _cpfPercentManager.GetByName("CPFInterest15To30")?.Percent ?? 12;
            var aboveThirty = _cpfPercentManager.GetByName("CPFInterestAbove30")?.Percent ?? 11;

            int lastMonth = fmonth - 1;
            int lastYear = fyear;
            if (lastMonth == 0)
            {
                lastMonth = 12;
                lastYear = fyear - 1;
            }

            var cpfInfos = _cpfInfoManager.GetListByMonthUser(lastYear, lastMonth, AppUserId);

            var lastMonthBalance = cpfInfos?.GrandTotal ?? 0;
            int interestRate = 0;
            if (lastMonthBalance <= 1500000)
            {
                interestRate = (int)bellowFifteen;
            }
            else if (lastMonthBalance > 1500000 && lastMonthBalance <= 3000000)
            {

                interestRate = (int)bellowThirty;
            }
            else
            {
                interestRate = (int)aboveThirty;
            }



            int cMonth = fmonth;
            int cYear = fyear;


            var fromDate = new DateTime(fyear, fmonth, 1);
            var toDate = new DateTime(tyear, tmonth, DateTime.DaysInMonth(tyear, tmonth));
            int startFrom = 0;
            if (toDate >= DateTime.Today)
            {
                int lastMonthNum = DateTime.Today.Month - 1;
                if (lastMonthNum == 0)
                {
                    lastMonthNum = 12;
                    startFrom = 12 - fmonth;
                }
                else if (lastMonthNum < fmonth)
                {
                    startFrom = 12 - fmonth + lastMonthNum + 1;

                }
                else
                {
                    startFrom = lastMonthNum - fmonth;
                }
            }
            else
            {
                startFrom = ((toDate.Year - fromDate.Year) * 12) + toDate.Month - fromDate.Month + 1;
            }
            decimal totalInv = 0;
            decimal totalInt = 0;

            for (int i = 0; i < 12; i++)
            {

                if (startFrom == 0)
                {
                    interestRate = 0;
                }

                var obj = InvestInfo.FirstOrDefault(x => x.Month == cMonth && x.Year == cYear);
                decimal investmentAmount = obj?.InvestmentAmount ?? 0;
                InvestmentVm invest = new InvestmentVm
                {
                    Description = GetMonthName.MonthInBangla(cMonth) + "/" + string.Concat(cYear.ToString().Select(c => (char)('\u09E6' + c - '0'))),
                    InvestmentAmount = string.Concat(investmentAmount.ToString().Select(c => (char)('\u09E6' + c - '0'))).Replace("৤", "."),
                    MonthNumber = string.Concat(startFrom.ToString().Select(c => (char)('\u09E6' + c - '0'))),
                    InterestRate = string.Concat(interestRate.ToString().Select(c => (char)('\u09E6' + c - '0'))) + "%",
                    TotalContribution = string.Concat((investmentAmount * startFrom).ToString().Select(c => (char)('\u09E6' + c - '0'))).Replace("৤", "."),
                    Interest = string.Concat((investmentAmount * startFrom * interestRate / 1200).ToString("#.##").Select(c => (char)('\u09E6' + c - '0'))).Replace("৤", ".")
                };
                source.Add(invest);
                cMonth++;
                if (cMonth > 12)
                {
                    cMonth = 1;
                    cYear++;
                }
                if (startFrom != 0)
                {
                    startFrom--;

                }


            }

            string rptPath = $"{this._webHostEnvironment.WebRootPath}\\Reports\\PRLInvestment.rdlc";
            string mimtype = "application/pdf";
            var report = new LocalReport(rptPath);
            Dictionary<string, string> parameters = new Dictionary<string, string>();
            var extenstion = 1;
            parameters.Add("monthYear", MonthInBangla(fmonth) + "/" + string.Concat(fyear.ToString().Select(c => (char)('\u09E6' + c - '0'))));
            parameters.Add("fmonth", MonthInBangla(fmonth) + "/" + string.Concat(fyear.ToString().Select(c => (char)('\u09E6' + c - '0'))));
            parameters.Add("tmonth", MonthInBangla(tmonth) + "/" + string.Concat(tyear.ToString().Select(c => (char)('\u09E6' + c - '0'))));
            report.AddDataSource("PRLInvestment", source);
            var result = report.Execute(RenderType.Pdf, extenstion, parameters, mimtype);
            return File(result.MainStream, "application/pdf");
        }
        public IActionResult Index()
        {
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
