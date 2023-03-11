using AspNetCore.Reporting;
using LMS_Web.Areas.CPF.Interface;
using LMS_Web.Areas.CPF.Manager;
using LMS_Web.Areas.CPF.ViewModels;
using LMS_Web.Areas.Loan.Manager;
using LMS_Web.Areas.Salary.Manager;
using LMS_Web.Areas.Settings.Manager;
using LMS_Web.Areas.Settings.Models;
using LMS_Web.Data;
using LMS_Web.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Runtime.ConstrainedExecution;

namespace LMS_Web.Areas.CPF.Controllers
{
    [Area("CPF")]
    public class UserWiseFiscalYearCPFController : Controller
    {
        private readonly FiscalYearManager _fiscalYearManager;
        private readonly UserManager<AppUser> _userManager;
        private readonly IWebHostEnvironment _webHostEnvironment;
        private readonly CpfPercentManager _cpfPercentManager;
        private readonly CpfInfoManager _cpfInfoManager;

        public UserWiseFiscalYearCPFController(ApplicationDbContext dbContext, UserManager<AppUser> userManager, IWebHostEnvironment webHostEnvironment)
        {
            _webHostEnvironment = webHostEnvironment;
            _userManager = userManager;
            _cpfPercentManager = new CpfPercentManager(dbContext);
            _fiscalYearManager = new FiscalYearManager(dbContext);
            _cpfInfoManager = new CpfInfoManager(dbContext);

        }
        public IActionResult Index()
        {
            return View();
        }

        public ActionResult UserWiseFiscalCpfReport()
        {

            //int fmonth = 12;
            //int tmonth = 1;
            //var fisYear = FiscalYear.Split("-");
            //int fyear = Convert.ToInt32(fisYear[0]);
            //int tyear = Convert.ToInt32(fisYear[1]);
            ViewBag.users = _userManager.Users.ToList();
            ViewBag.FiscalYear = new SelectList(_fiscalYearManager.GetAll().ToList(), "Value", "Value");
            return View();
        }
        [HttpPost]
        public ActionResult UserWiseFiscalCpfReport(string AppUserId, string FiscalYear)
        {

            var fisYear = FiscalYear.Split("-");
            int fyear = Convert.ToInt32(fisYear[0]);
            int tyear = Convert.ToInt32(fisYear[1]);
            int fmonth = 7;
            int tmonth = 6;



            var cpfInfo = _cpfInfoManager.GetListByMonthUser(fyear, fmonth, tyear, tmonth, AppUserId);


            var bellowFifteen = _cpfPercentManager.GetByName("CPFInterestBellow15")?.Percent ?? 13;
            var bellowThirty = _cpfPercentManager.GetByName("CPFInterest15To30")?.Percent ?? 12;
            var aboveThirty = _cpfPercentManager.GetByName("CPFInterestAbove30")?.Percent ?? 11;


            var cpfInfos = _cpfInfoManager.GetListByMonthUser(fyear, fmonth, AppUserId);

            var totalInvestment = cpfInfos?.GrandTotal ?? 0;

            int interestRate = 0;
            if (totalInvestment <= 1500000)
            {
                interestRate = (int)bellowFifteen;
            }
            else if (totalInvestment > 1500000 && totalInvestment <= 3000000)
            {

                interestRate = (int)bellowThirty;
            }
            else
            {
                interestRate = (int)aboveThirty;
            }

            int start = 12;

            decimal investmentAmount = 0;
            decimal interestAmount = 0;
            for (int i = 0; i < 12; i++)
            {

                var obj = cpfInfo.FirstOrDefault(x => x.Month == fmonth && x.Year == tyear);

                investmentAmount += obj?.TotalContribution ?? 0;
                interestAmount += investmentAmount * start * interestRate / 1200;
                start--;

            }
            var investmentAmountBn = string.Concat(investmentAmount.ToString("#.##").Select(c => (char)('\u09E6' + c - '0'))).Replace("৤", ".");
            //var interestAmountBn = string.Concat((investmentAmount * start * interestRate / 1200).ToString("#.##").Select(c => (char)('\u09E6' + c - '0'))).Replace("৤", ".");

            var interestAmountBn= string.Concat(interestAmount.ToString("#.##").Select(c => (char)('\u09E6' + c - '0'))).Replace("৤", ".");
            var sumBn = string.Concat((investmentAmount + interestAmount).ToString("#.##").Select(c => (char)('\u09E6' + c - '0'))).Replace("৤", ".");



            //UsewiseFiscalCpfVM source = new UsewiseFiscalCpfVM();
            //source.Interest = interestAmountBn;
            //source.InvestmentAmount = interestAmountBn;
            //source.Sum = sumBn;
            string rptPath = $"{this._webHostEnvironment.WebRootPath}\\Reports\\UserFiscalCpf.rdlc";
            string mimtype = "application/pdf";
            var report = new LocalReport(rptPath);
            Dictionary<string, string> parameters = new Dictionary<string, string>();
            var extenstion = 1;
            parameters.Add("investmentAmount", investmentAmountBn);
            parameters.Add("Interest", interestAmountBn);
            parameters.Add("Sum", sumBn);

            report.AddDataSource("DsUserFiscalCpf", "");
            var result = report.Execute(RenderType.Pdf, extenstion, parameters, mimtype);
            return File(result.MainStream, "application/pdf");


        }

    }
}
