using AspNetCore.Reporting;
using LMS_Web.Areas.CPF.Manager;
using LMS_Web.Areas.CPF.ViewModels;
using LMS_Web.Areas.Loan.Manager;
using LMS_Web.Areas.Salary.Interface.Manager;
using LMS_Web.Areas.Salary.Manager;
using LMS_Web.Areas.Settings.Interface;
using LMS_Web.Areas.Settings.Manager;
using LMS_Web.Data;
using LMS_Web.Interface.Manager;
using LMS_Web.Manager;
using LMS_Web.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;

namespace LMS_Web.Areas.CPF.Controllers
{
    [Area("CPF")]
    public class ShortBillController : Controller
    {

        private readonly UserManager<AppUser> _userManager;
        private readonly HouseRentRuleManager _houseRentRuleManager;
        private readonly DeductionManager _deductionManager;
        private readonly FixedDeductionManager _fixedDeductionManager;
        private readonly UserDeductionManager _userDeductionManager;
        private readonly UserHouseRentManager _userHouseRentManager;
        private readonly UserTaxManager _userTaxManager;
        private readonly LoanHeadManager _loanHeadManager;
        private readonly UserWiseLoanManager _userWiseLoanManager;
        private readonly GradeWiseFixedDeductionManager _gradeWiseFixedDeductionManager;
        private readonly UserSpecificAllowanceManager _userSpecificAllowanceManager;
        private readonly IWebHostEnvironment webHostEnvironment;
        private readonly GradeManager _gradeManager;
        private readonly CpfPercentManager _cpfPercentManager;
        private readonly TransferHistoryManager _transferHistoryManager;
        private readonly TaxInstallmentInfoManager _taxInstallmentInfoManager;
        private readonly LoanInstallmentInfoManager _loanInstallmentInfoManager;

        public ShortBillController(ApplicationDbContext dbContext, UserManager<AppUser> userManager, IWebHostEnvironment _webHostEnvironment)
        {
            webHostEnvironment = _webHostEnvironment;
            _userManager = userManager;;
            _houseRentRuleManager = new HouseRentRuleManager(dbContext);
            _deductionManager = new DeductionManager(dbContext);
            _fixedDeductionManager = new FixedDeductionManager(dbContext);
            _userDeductionManager = new UserDeductionManager(dbContext);
            _userHouseRentManager = new UserHouseRentManager(dbContext);
            _userTaxManager = new UserTaxManager(dbContext);
            _loanHeadManager = new LoanHeadManager(dbContext);
            _userWiseLoanManager = new UserWiseLoanManager(dbContext);
            _gradeWiseFixedDeductionManager = new GradeWiseFixedDeductionManager(dbContext);
            _userSpecificAllowanceManager = new UserSpecificAllowanceManager(dbContext);
            _gradeManager = new GradeManager(dbContext);
            _cpfPercentManager = new CpfPercentManager(dbContext);
            _transferHistoryManager = new TransferHistoryManager(dbContext);
            _taxInstallmentInfoManager = new TaxInstallmentInfoManager(dbContext);
            _loanInstallmentInfoManager = new LoanInstallmentInfoManager(dbContext);
        }
        public IActionResult ShortBillReport()
        {

            ViewBag.Grade = _gradeManager.GetList();
            return View();
        }
        [HttpPost]

        public IActionResult ShortBillReport(int FromGradeId, int ToGradeId, int year, int month)
        {
            List<ShortBillVM> sources = new List<ShortBillVM>();

            string rptPath = $"{this.webHostEnvironment.WebRootPath}\\Reports\\ShortBill.rdlc";
            string mimtype = "application/pdf";
            var report = new LocalReport(rptPath);
            Dictionary<string, string> parameters = new Dictionary<string, string>();
            var extenstion = 1;
            parameters.Add("monthYear", MonthInBangla(month) + "/" + string.Concat(year.ToString().Select(c => (char)('\u09E6' + c - '0'))));
            parameters.Add("billDate", DateTime.Today.ToString("dd/MM/yyyy"));
            report.AddDataSource("DsShortBill", "");
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
