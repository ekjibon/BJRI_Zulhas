using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using LMS_Web.Areas.Loan.Manager;
using LMS_Web.Areas.Salary.Enum;
using LMS_Web.Areas.Salary.Manager;
using LMS_Web.Areas.Salary.Models;
using LMS_Web.Areas.Salary.ViewModels;
using LMS_Web.Areas.Settings.Manager;
using LMS_Web.Data;
using LMS_Web.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System.Data;
using LMS_Web.Areas.Salary.Dataset;
using AspNetCore.Reporting;
using Microsoft.AspNetCore.Hosting;
using MySqlX.XDevAPI.Relational;
using System.IO;
using System.Net.NetworkInformation;
using LMS_Web.Areas.CPF.Manager;
using LMS_Web.Areas.CPF.Models;
using LMS_Web.Areas.Settings.Models;
using LMS_Web.Common;
using LMS_Web.Manager;
using Microsoft.EntityFrameworkCore.Query;
using StationManager = LMS_Web.Areas.Salary.Manager.StationManager;

namespace LMS_Web.Areas.Salary.Controllers
{
    [Area("Salary")]
    public class SalaryController : Controller
    {


        private decimal sumOfNetSalary = 0;
        private readonly UserManager<AppUser> _userManager;
        private readonly GradeWisePayScaleManager _gradeWisePayScaleManager;
        private readonly PayScaleManager _payScaleManager;
        private readonly HouseRentRuleManager _houseRentRuleManager;
        private readonly ChildrenInfoManager _childrenInfoManager;
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
        private readonly WingsManager _wingsManager;
        private readonly StationManager _stationManager;
        private readonly GradeStepBasicManager _gradeStepManager;
        private readonly GradeManager _gradeManager;
        private readonly CpfPercentManager _cpfPercentManager;
        private readonly TransferHistoryManager _transferHistoryManager;
        private readonly SuspensionHistoryManager _suspensionHistoryManager;
        private readonly FiscalYearManager _fiscalYearManager;
        private readonly TaxInstallmentInfoManager _taxInstallmentInfoManager;
        private readonly LoanInstallmentInfoManager _loanInstallmentInfoManager;

        public SalaryController(ApplicationDbContext dbContext, UserManager<AppUser> userManager, IWebHostEnvironment _webHostEnvironment)
        {
            webHostEnvironment = _webHostEnvironment;
            _userManager = userManager;
            _gradeWisePayScaleManager = new GradeWisePayScaleManager(dbContext);
            _payScaleManager = new PayScaleManager(dbContext);
            _houseRentRuleManager = new HouseRentRuleManager(dbContext);
            _childrenInfoManager = new ChildrenInfoManager(dbContext);
            _deductionManager = new DeductionManager(dbContext);
            _fixedDeductionManager = new FixedDeductionManager(dbContext);
            _userDeductionManager = new UserDeductionManager(dbContext);
            _userHouseRentManager = new UserHouseRentManager(dbContext);
            _userTaxManager = new UserTaxManager(dbContext);
            _loanHeadManager = new LoanHeadManager(dbContext);
            _userWiseLoanManager = new UserWiseLoanManager(dbContext);
            _gradeWiseFixedDeductionManager = new GradeWiseFixedDeductionManager(dbContext);
            _userSpecificAllowanceManager = new UserSpecificAllowanceManager(dbContext);
            _wingsManager = new WingsManager(dbContext);
            _stationManager = new StationManager(dbContext);
            _gradeStepManager = new GradeStepBasicManager(dbContext);
            _gradeManager = new GradeManager(dbContext);
            _cpfPercentManager = new CpfPercentManager(dbContext);
            _transferHistoryManager = new TransferHistoryManager(dbContext);
            _suspensionHistoryManager = new SuspensionHistoryManager(dbContext);
            _fiscalYearManager = new FiscalYearManager(dbContext);
            _taxInstallmentInfoManager = new TaxInstallmentInfoManager(dbContext);
            _loanInstallmentInfoManager = new LoanInstallmentInfoManager(dbContext);
        }

        public IActionResult Calculate()
        {
            ViewBag.Wings = _wingsManager.GetWings();
            ViewBag.Station = _stationManager.GetAll();
            //ViewBag.Stations = _stationManager.UserWiseLoadStation("userId");
            return View();
        }

        [HttpPost]
        public IActionResult Calculate(int year, int month, int StationId, int? WingId, int? DepartmentId,
            int? SectionId)
        {
            var users = _userManager.Users.Where(c => c.StationId == StationId && (WingId == null || c.WingId == WingId) && (DepartmentId == null || c.DepartmentId == DepartmentId) && (SectionId == null || c.SectionId == SectionId)).Include(c => c.Station).Include(v => v.Department).Include(v => v.Designation);
            var source = CalculateSalary(year, month, users, false);

            string rptPath = $"{this.webHostEnvironment.WebRootPath}\\Reports\\SalaryRpt.rdlc";
            string renderFormat = "PDF";
            string mimtype = "application/pdf";
            var report = new LocalReport(rptPath);
            // string mimtype = "";
            Dictionary<string, string> parameters = new Dictionary<string, string>();
            parameters.Add("salaryBill", "(" + GetMonthName.GetFullName(month) + "/" + year + ")");
            parameters.Add("billDate", DateTime.Today.ToString("dd/MM/yyyy"));
            var extenstion = 1;
            // LocalReport localReport = new LocalReport(path);
            report.AddDataSource("Main", source);
            //report.AddDataSource("SalaryPart", list.);
            var result = report.Execute(RenderType.Pdf, extenstion, parameters, mimtype);

            return File(result.MainStream, "application/pdf");
        }
        public DataTable CalculateSalary(int year, int month, IIncludableQueryable<AppUser, Designation> users, bool isBanglaRequired)
        {
            DataTable mainTable = new DataTable();


            mainTable.Columns.Add("EmployeeCode", typeof(string));
            mainTable.Columns.Add("EmployeeName", typeof(string));
            mainTable.Columns.Add("Scale", typeof(string));
            mainTable.Columns.Add("Department", typeof(string));
            mainTable.Columns.Add("Designation", typeof(string));
            mainTable.Columns.Add("BasicAllowance", typeof(decimal));
            mainTable.Columns.Add("CurrentBasic", typeof(decimal));
            mainTable.Columns.Add("BankAccountNo", typeof(string));
            //
            mainTable.Columns.Add("MedicalAllowance", typeof(decimal));
            mainTable.Columns.Add("HouseRentAllowance", typeof(decimal));
            mainTable.Columns.Add("DearnessAllowance", typeof(decimal));
            mainTable.Columns.Add("MobileCellphoneAllowance", typeof(decimal));
            mainTable.Columns.Add("TelephoneAllowance", typeof(decimal));
            mainTable.Columns.Add("ChargeAllowance", typeof(decimal));
            mainTable.Columns.Add("EducationAllowance", typeof(decimal));
            mainTable.Columns.Add("HonoraryAllowance", typeof(decimal));
            mainTable.Columns.Add("TravelingAllowance", typeof(decimal));
            mainTable.Columns.Add("AdvanceAllowance", typeof(decimal));
            mainTable.Columns.Add("TransportAllowance", typeof(decimal));
            mainTable.Columns.Add("PrantikSubidha", typeof(decimal));
            mainTable.Columns.Add("BonusRefund", typeof(decimal));
            mainTable.Columns.Add("OthersAllowance", typeof(decimal));
            mainTable.Columns.Add("TiffinAllowance", typeof(decimal));
            mainTable.Columns.Add("WashAllowance", typeof(decimal));
            mainTable.Columns.Add("ArrearsBasic", typeof(decimal));
            mainTable.Columns.Add("FestivalAllowance", typeof(decimal));
            //
            mainTable.Columns.Add("CPFRegular", typeof(decimal));
            mainTable.Columns.Add("CPFAdditional", typeof(decimal));
            mainTable.Columns.Add("CPFArrears", typeof(decimal));
            mainTable.Columns.Add("HouseRentDeduction", typeof(decimal));
            mainTable.Columns.Add("ElectricBill", typeof(decimal));
            mainTable.Columns.Add("GasBill", typeof(decimal));
            mainTable.Columns.Add("WaterBill", typeof(decimal));
            mainTable.Columns.Add("IncomeTaxAmount", typeof(decimal));
            mainTable.Columns.Add("IncomeTaxInstallment", typeof(string));
            //
            mainTable.Columns.Add("CPFFirstCapital", typeof(decimal));
            mainTable.Columns.Add("CPFFirstInstallment", typeof(string));
            mainTable.Columns.Add("CPFSecondCapital", typeof(decimal));
            mainTable.Columns.Add("CPFSecondInstallment", typeof(string));

            mainTable.Columns.Add("MotorCycleFirstCapital", typeof(decimal));
            mainTable.Columns.Add("MotorCycleFirstCapitalInstallment", typeof(string));
            mainTable.Columns.Add("MotorCycleFirstInterest", typeof(decimal));
            mainTable.Columns.Add("MotorCycleFirstInterestInstallment", typeof(string));

            mainTable.Columns.Add("MotorCycleSecondCapital", typeof(decimal));
            mainTable.Columns.Add("MotorCycleSecondCapitalInstallment", typeof(string));
            mainTable.Columns.Add("MotorCycleSecondInterest", typeof(decimal));
            mainTable.Columns.Add("MotorCycleSecondInterestInstallment", typeof(string));
            //
            mainTable.Columns.Add("CarFirstCapital", typeof(decimal));
            mainTable.Columns.Add("CarFirstCapitalInstallment", typeof(string));
            mainTable.Columns.Add("CarFirstInterest", typeof(decimal));
            mainTable.Columns.Add("CarFirstInterestInstallment", typeof(string));
            //
            mainTable.Columns.Add("CarSecondCapital", typeof(decimal));
            mainTable.Columns.Add("CarSecondCapitalInstallment", typeof(string));
            mainTable.Columns.Add("CarSecondInterest", typeof(decimal));
            mainTable.Columns.Add("CarSecondInterestInstallment", typeof(string));

            mainTable.Columns.Add("HouseBuildingFirstCapital", typeof(decimal));
            mainTable.Columns.Add("HouseBuildingFirstCapitalInstallment", typeof(string));
            mainTable.Columns.Add("HouseBuildingFirstInterest", typeof(decimal));
            mainTable.Columns.Add("HouseBuildingFirstInterestInstallment", typeof(string));

            //
            mainTable.Columns.Add("HouseBuildingSecondCapital", typeof(decimal));
            mainTable.Columns.Add("HouseBuildingSecondCapitalInstallment", typeof(string));
            mainTable.Columns.Add("HouseBuildingSecondInterest", typeof(decimal));
            mainTable.Columns.Add("HouseBuildingSecondInterestInstallment", typeof(string));

            //
            mainTable.Columns.Add("HouseRepairingFirstCapital", typeof(decimal));
            mainTable.Columns.Add("HouseRepairingFirstCapitalInstallment", typeof(string));
            mainTable.Columns.Add("HouseRepairingFirstInterest", typeof(decimal));
            mainTable.Columns.Add("HouseRepairingFirstInterestInstallment", typeof(string));

            //
            mainTable.Columns.Add("HouseRepairingSecondCapital", typeof(decimal));
            mainTable.Columns.Add("HouseRepairingSecondCapitalInstallment", typeof(string));
            mainTable.Columns.Add("HouseRepairingSecondInterest", typeof(decimal));
            mainTable.Columns.Add("HouseRepairingSecondInterestInstallment", typeof(string));
            //
            mainTable.Columns.Add("OthersAdvanceCapital", typeof(decimal));
            mainTable.Columns.Add("OthersAdvanceCapitalInstallment", typeof(string));
            mainTable.Columns.Add("OthersAdvanceInterest", typeof(decimal));
            mainTable.Columns.Add("OthersAdvanceInterestInstallment", typeof(string));

            //
            mainTable.Columns.Add("OthersCapital", typeof(decimal));
            mainTable.Columns.Add("OthersCapitalInstallment", typeof(string));
            mainTable.Columns.Add("OthersInterest", typeof(decimal));
            mainTable.Columns.Add("OthersInterestInstallment", typeof(string));

            //
            mainTable.Columns.Add("HouseRepairingThirdCapital", typeof(decimal));
            mainTable.Columns.Add("HouseRepairingThirdCapitalInstallment", typeof(string));
            mainTable.Columns.Add("HouseRepairingThirdInterest", typeof(decimal));
            mainTable.Columns.Add("HouseRepairingThirdInterestInstallment", typeof(string));




            mainTable.Columns.Add("BasicDeduction", typeof(decimal));
            mainTable.Columns.Add("Transport", typeof(decimal));
            mainTable.Columns.Add("Garage", typeof(decimal));
            mainTable.Columns.Add("GroupInsurance", typeof(decimal));
            mainTable.Columns.Add("WelfareFund", typeof(decimal));
            mainTable.Columns.Add("Rehabilitation", typeof(decimal));

            //
            mainTable.Columns.Add("GrossSalary", typeof(decimal));
            mainTable.Columns.Add("TotalDeduction", typeof(decimal));
            mainTable.Columns.Add("NetSalary", typeof(decimal));
            mainTable.Columns.Add("NetInWord", typeof(string));
            if (isBanglaRequired)
            {
                mainTable.Columns.Add("NetSalaryBangla", typeof(string));
                mainTable.Columns.Add("EmployeeNameBangla", typeof(string));
                mainTable.Columns.Add("DesignationBangla", typeof(string));
            }


            var fiscalYear = GetFiscalYear(month, year);
            var firstDayOfMonth = new DateTime(year, month, 1);
            int totalDaysInMonth = DateTime.DaysInMonth(year, month);
            DateTime lastDayOfMonth = new DateTime(year, month, totalDaysInMonth);


            //List<SalaryVM> list = new List<SalaryVM>();
            var payScales = _payScaleManager.GetList();
            var gradeWisePayScales = _gradeWisePayScaleManager.GetList();
            var houseRent = _houseRentRuleManager.GetList();
            var childrenInfos = _childrenInfoManager.GetList();
            var deductions = _deductionManager.GetAll();
            var fixedDeductions = _fixedDeductionManager.GetAll();
            var userWiseDeductions = _userDeductionManager.GetAll();
            var userHouseRents = _userHouseRentManager.GetAll();
            var userTaxes = _userTaxManager.GetTaxesThisFiscalYear(fiscalYear?.Id??0);
            var loanHeads = _loanHeadManager.GetAll();
            var userLoans = _userWiseLoanManager.GetActiveLoans();
            var gradeWiseFixedDeduction = _gradeWiseFixedDeductionManager.GetAll();
            var userSpecificAllowances = _userSpecificAllowanceManager.GetAllByMonthYear(month, year);
            var gradeSteps = _gradeStepManager.GetAll();
            var percent = _cpfPercentManager.GetByName("CPF Regular")?.Percent ?? 10;
            var transferHistory = _transferHistoryManager.getNewTransferHistories(year, month);
            var suspensionList = _suspensionHistoryManager.GetCurrentSuspension(firstDayOfMonth, lastDayOfMonth);
            var taxInstallmentInfo = _taxInstallmentInfoManager.GetByMonthYear(month,year);
            var loanInstallments = _loanInstallmentInfoManager.GetCurrentMonthLoan(year, month);



            foreach (var user in users)
            {
                bool isFraction = false;
                bool isNewlyTransfered = false;
                decimal sumOfAllowance = 0;
                decimal sumOfDeduction = 0;
                decimal netPayment = 0;
                DataRow mainRow = mainTable.NewRow();
                decimal payableBasic = user.CurrentBasic ?? 0;
                decimal houseRentAllowance = 0;
                decimal arrearBasic = 0;
                //Salary Part 
                //List<PayScaleVm> salaryPart = new List<PayScaleVm>();
                //List<UtilityVm> utilityPart = new List<UtilityVm>();
                //List<LoanVm> loanPart = new List<LoanVm>();
                //List<OthersVm> othersPart = new List<OthersVm>();

                SalaryVM salary = new SalaryVM();

                salary.EmployeeName = user.FullName;
                salary.EmployeeCode = user.EmployeeCode;
                int workingDays = totalDaysInMonth;
                if (user.JoiningDate != user.CurrentStationJoiningDate && user.CurrentStationJoiningDate.Value.Year == year &&
                    user.CurrentStationJoiningDate.Value.Month == month)
                {
                    isNewlyTransfered = true;
                }
                if (user.JoiningDate.Year == year && user.JoiningDate.Month == month)
                {

                    if (user.ResignationDate?.Year == year && user.ResignationDate?.Month == month)
                    {
                        workingDays = (user.ResignationDate?.Day ?? 0 - user.JoiningDate.Day) + 1;
                    }
                    else
                    {
                        workingDays = (totalDaysInMonth - user.JoiningDate.Day) + 1;
                    }
                }
                else if (user.ResignationDate?.Year == year && user.ResignationDate?.Month == month)
                {
                    workingDays = user.ResignationDate.Value.Day;
                }

                if (workingDays < totalDaysInMonth)
                {
                    payableBasic = ((user.CurrentBasic / totalDaysInMonth) * workingDays) ?? 0;
                    isFraction = true;
                }

                var isSuspended = suspensionList.Where(c => c.AppUserId == user.Id);
                int totalSuspendedDays = 0;

                foreach (var item in isSuspended)
                {
                    if (item.StartDate < firstDayOfMonth && item.EndDate > lastDayOfMonth)
                    {
                        totalSuspendedDays = totalDaysInMonth;
                        //break;
                    }

                    if (item.StartDate < firstDayOfMonth && item.EndDate <= lastDayOfMonth)
                    {
                        totalSuspendedDays += item.EndDate.Value.Day;
                        //continue;
                    }

                    if (item.StartDate >= firstDayOfMonth && item.EndDate <= lastDayOfMonth)
                    {
                        totalSuspendedDays += (item.EndDate.Value.Day - item.StartDate.Day + 1);
                        //continue;
                    }

                    if (item.StartDate <= lastDayOfMonth && item.StartDate >= firstDayOfMonth && item.EndDate > lastDayOfMonth)
                    {
                        totalSuspendedDays += (lastDayOfMonth.Day - item.StartDate.Day + 1);
                        //continue;
                    }
                }

                if (totalSuspendedDays > totalDaysInMonth)
                {
                    totalSuspendedDays = totalDaysInMonth;
                }



                if (totalSuspendedDays > 0)
                {
                    user.IsSuspended = true;
                    int nonSuspendedDays = totalDaysInMonth - totalSuspendedDays;

                    payableBasic = (payableBasic * nonSuspendedDays) / totalDaysInMonth + (payableBasic * totalSuspendedDays) / (totalDaysInMonth * 2);
                }

                foreach (var payScale in payScales)
                {
                    PayScaleVm p = new PayScaleVm();
                    p.Name = payScale.Name;
                    p.EmployeeId = user.Id;
                    if (payScale.IsAvailable)
                    {
                        if (payScale.Type == PayScaleType.Basic)
                        {
                            p.Amount = payableBasic;
                            //mainRow["BasicAllowance"] = user.CurrentBasic ?? 0;
                        }
                        else if (payScale.Type == PayScaleType.HouseRent)
                        {
                            var getHouseRentPercent = houseRent.FirstOrDefault(c =>
                                c.BasicFrom <= user.CurrentBasic && c.BasicTo >= user.CurrentBasic &&
                                c.StationType == user.Station.StationType);

                            decimal? houseRentAmount = 0;

                            if (isNewlyTransfered)
                            {
                                var previousStation = transferHistory.Where(c => c.AppUserId == user.Id).OrderByDescending(c => c.TransferDate)
                                    .FirstOrDefault();
                                if (previousStation != null)
                                {
                                    var getPreviousHouseRentPercent = houseRent.FirstOrDefault(c =>
                                        c.BasicFrom <= user.CurrentBasic && c.BasicTo >= user.CurrentBasic &&
                                        c.StationType == previousStation.FromStation.StationType);


                                    int previousStationWorkingDays = previousStation.TransferDate.Day;
                                    int currentStationWorkingDays = totalDaysInMonth - previousStationWorkingDays;

                                    if (user.IsSuspended)
                                    {
                                        houseRentAmount = (((user.CurrentBasic * getHouseRentPercent.Percentage) / 100) * currentStationWorkingDays) / totalDaysInMonth + (((user.CurrentBasic * getPreviousHouseRentPercent.Percentage) / 100) * previousStationWorkingDays) / totalDaysInMonth;
                                    }
                                    else
                                    {

                                        houseRentAmount = (((payableBasic * getHouseRentPercent.Percentage) / 100) * currentStationWorkingDays) / totalDaysInMonth + (((payableBasic * getPreviousHouseRentPercent.Percentage) / 100) * previousStationWorkingDays) / totalDaysInMonth;
                                    }
                                }

                            }
                            else
                            {
                                if (getHouseRentPercent != null)
                                {
                                    if (user.IsSuspended)
                                    {
                                        houseRentAmount = (user.CurrentBasic * getHouseRentPercent.Percentage) / 100;
                                    }
                                    else
                                    {
                                        houseRentAmount = (payableBasic * getHouseRentPercent.Percentage) / 100;
                                    }

                                    if (houseRentAmount < getHouseRentPercent.MinimumAmount)
                                    {
                                        if (!isFraction)
                                        {
                                            houseRentAmount = getHouseRentPercent.MinimumAmount;
                                        }

                                    }

                                }

                            }







                            p.Amount = houseRentAmount ?? 0;
                            houseRentAllowance = p.Amount;
                            //mainRow["HouseRentAllowance"] = houseRentAllowance;
                        }
                        else if (payScale.Type == PayScaleType.Education)
                        {
                            var lastDob = firstDayOfMonth.AddYears(-23);
                            var getChildren = childrenInfos.Count(c => c.IsApprove && c.DateOfBirth >= lastDob && c.AppUserId == user.Id);
                            if (getChildren > 2)
                            {
                                getChildren = 2;
                            }
                            p.Amount = 500 * getChildren;
                            //mainRow["EducationAllowance"] = 500 * getChildren;
                        }
                        else
                        {
                            if (payScale.IsUserSpecific)
                            {
                                var uSpecific = userSpecificAllowances.FirstOrDefault(c => c.AppUserId == user.Id);
                                p.Amount = uSpecific?.Amount ?? 0;
                                if (payScale.Name == "ArrearsBasic")
                                {
                                    arrearBasic = p.Amount;
                                }
                            }
                            else
                            {

                                var gradeWisePayScale = gradeWisePayScales.FirstOrDefault(c =>
                                    c.PayScaleId == payScale.Id && c.GradeId == user.GradeId);
                                if (gradeWisePayScale != null)
                                {
                                    if (gradeWisePayScale.IsFixed)
                                    {
                                        p.Amount = gradeWisePayScale.FixedAmount ?? 0;
                                    }
                                    else
                                    {
                                        decimal? preAmount = 0;
                                        if (user.IsSuspended)
                                        {
                                            preAmount = (user.CurrentBasic * gradeWisePayScale.Percentage) / 100;
                                        }
                                        else
                                        {
                                            preAmount = (payableBasic * gradeWisePayScale.Percentage) / 100;
                                        }

                                        if (preAmount < gradeWisePayScale.MinimumAmount)
                                        {
                                            if (!isFraction)
                                            {
                                                preAmount = gradeWisePayScale.MinimumAmount;
                                            }

                                        }
                                        else if (preAmount > gradeWisePayScale.MaximumAmount)
                                        {
                                            preAmount = gradeWisePayScale.MaximumAmount;
                                        }




                                        p.Amount = preAmount ?? 0;
                                    }
                                }
                                else
                                {
                                    p.Amount = 0;
                                }
                            }


                        }
                    }
                    else
                    {
                        p.Amount = 0;
                    }
                    if (isFraction && !(payScale.Type == PayScaleType.HouseRent || payScale.Type == PayScaleType.Basic))
                    {
                        p.Amount = (p.Amount * workingDays / totalDaysInMonth);
                    }
                    sumOfAllowance += p.Amount;
                    mainRow[p.Name] = p.Amount;
                    //salaryPart.Add(p);
                }

                //salary.SalaryPart = salaryPart;
                //Deduction Part
                //CPF
                var cpfStartDate = user.JoiningDate.AddYears(1);
                if (cpfStartDate > lastDayOfMonth)
                {
                    salary.CPFRegular = 0;
                    salary.ArrearsBasic = 0;


                }
                else
                {

                    var cpfDays = (int)(lastDayOfMonth - cpfStartDate).TotalDays + 1;
                    if (cpfDays >= totalDaysInMonth)
                    {
                        salary.CPFRegular = (payableBasic * percent) / 100;
                        salary.ArrearsBasic = (arrearBasic * percent) / 100;
                    }
                    else
                    {
                        var payableCpf = ((payableBasic / totalDaysInMonth) * cpfDays * percent) / 100;
                        salary.CPFRegular = payableCpf;
                        salary.ArrearsBasic = (arrearBasic * percent) / 100;
                    }
                }

                mainRow["CPFRegular"] = salary.CPFRegular;
                mainRow["CPFArrears"] = salary.ArrearsBasic;
                mainRow["CPFAdditional"] = 0;
                salary.CPFAdditional = 0;
                mainRow["IncomeTaxAmount"] = 0;
                mainRow["IncomeTaxInstallment"] = "0/0";

                sumOfDeduction += salary.CPFAdditional + salary.CPFArrears + salary.CPFRegular;
                //Utility

                var utilityList = deductions.Where(c => c.DeductionType == DeductionType.Utility);
                foreach (var utility in utilityList)
                {
                    UtilityVm objUtility = new UtilityVm();
                    objUtility.Name = utility.Name;
                    //All resident including dormitory
                    if (user.ResidentialStatusId != 2)
                    {
                        if (utility.UtilityType == UtilityType.HouseRent)
                        {
                            var checkHouseRent = userHouseRents.FirstOrDefault(c => c.AppUserId == user.Id);
                            decimal dHouseRent = 0;
                            if (checkHouseRent != null)
                            {
                                if (isFraction)
                                {
                                    if (user.ResignationDate != null)
                                    {
                                        if (user.ResignationDate.Value.Day > 15)
                                        {
                                            dHouseRent = checkHouseRent.Amount;
                                        }
                                        else
                                        {
                                            dHouseRent = checkHouseRent.Amount / 2;
                                        }
                                    }
                                    else if (user.CurrentStationJoiningDate.Value.Day > 15)
                                    {
                                        dHouseRent = checkHouseRent.Amount / 2;
                                    }
                                    else
                                    {
                                        dHouseRent = checkHouseRent.Amount;
                                    }
                                }
                                else
                                {
                                    dHouseRent = checkHouseRent.Amount;
                                }
                            }
                            else
                            {
                                dHouseRent = houseRentAllowance;
                            }

                            objUtility.Amount = dHouseRent;

                        }
                        else if (utility.IsFixed && user.ResidentialStatusId != 3)
                        {
                            decimal initialDAmount = fixedDeductions.FirstOrDefault(c => c.DeductionId == utility.Id)?.Amount ?? 0;
                            if (isFraction)
                            {
                                if (user.ResignationDate != null)
                                {
                                    if (user.ResignationDate.Value.Day > 15)
                                    {
                                        objUtility.Amount = initialDAmount;
                                    }
                                    else
                                    {
                                        objUtility.Amount = initialDAmount / 2;
                                    }
                                }
                                else if (user.CurrentStationJoiningDate.Value.Day > 15)
                                {
                                    objUtility.Amount = initialDAmount / 2;
                                }
                                else
                                {
                                    objUtility.Amount = initialDAmount;
                                }
                            }
                            else
                            {
                                objUtility.Amount = initialDAmount;
                            }
                        }
                        else
                        {
                            var data = userWiseDeductions.FirstOrDefault(c => (c.AppUserId == user.Id && c.DeductionId == utility.Id && (c.IsSameEveryMonth || (c.Year == year && c.Month == month))));
                            objUtility.Amount = data?.Amount ?? 0;
                        }
                    }
                    //Non resident
                    else
                    {
                        objUtility.Amount = 0;
                    }

                    if (utility.UtilityType != UtilityType.Tax)
                    {
                        sumOfDeduction += objUtility.Amount;
                        mainRow[utility.Name] = objUtility.Amount;
                    }

                    //utilityPart.Add(objUtility);
                }

                //salary.UtilityPart = utilityPart;
                //Tax
              
                var uTax = userTaxes.FirstOrDefault(c => c.AppUserId == user.Id);
                if (uTax != null)
                {
                    var userTaxData = taxInstallmentInfo.FirstOrDefault(c =>
                        c.Month == month && c.Year == year && c.AppUserId == user.Id);
                    //salary.Tax = uTax;
                    mainRow["IncomeTaxAmount"] = uTax?.MonthlyDeduction ?? 0;
                    mainRow["IncomeTaxInstallment"] = userTaxData.InstallmentNo +"/"+uTax.TotalInstallment;

                }
                else
                {
                    mainRow["IncomeTaxAmount"] = 0;
                    mainRow["IncomeTaxInstallment"] = "0/0";
                }

                sumOfDeduction += uTax?.MonthlyDeduction ?? 0;

                //Loans
                foreach (var l in loanHeads)
                {
                    LoanVm loan = new LoanVm();
                    loan.Name = l.Name;
                    var cUserLoan = userLoans.FirstOrDefault(c => c.AppUserId == user.Id && c.LoanHeadId == l.Id);
                    if (cUserLoan != null)
                    {
                        var getInstallmentByUser = loanInstallments.FirstOrDefault(c => c.AppUserId == user.Id && c.LoanHeadId==l.Id);

                        if (getInstallmentByUser != null)
                        {
                            if (getInstallmentByUser.IsCapital)
                            {
                                loan.CapitalAmount = cUserLoan.CapitalDeductionAmount;
                                loan.CurrentCapitalInstallment = getInstallmentByUser.CapitalInstallmentNo;
                                loan.TotalCapitalInstallment = cUserLoan.NoOfInstallment;
                            }
                            else
                            {
                                loan.CurrentInterestInstallment = getInstallmentByUser.InterestInstallmentNo;
                                loan.InterestAmount = cUserLoan.InterestDeductionAmount ?? 0;
                                loan.TotalInterestInstallment = cUserLoan.NoOfInstallmentForInterest ?? 0;

                            }



                        }
                        
                        
                        //if (cUserLoan.CurrentInstallmentNoForCapital != cUserLoan.NoOfInstallment)
                        //{
                        //    loan.CapitalAmount = cUserLoan.CapitalDeductionAmount;
                        //    loan.CurrentCapitalInstallment = cUserLoan.CurrentInstallmentNoForCapital + 1;
                        //    loan.TotalCapitalInstallment = cUserLoan.NoOfInstallment;



                        //    //loan.CurrentInterestInstallment = 0;
                        //    //loan.InterestAmount = 0;
                        //    //loan.TotalInterestInstallment = 0;
                        //}
                        //else
                        //{
                        //    loan.CurrentInterestInstallment = cUserLoan.CurrentInstallmentNoForInterest ?? 0 + 1;
                        //    loan.InterestAmount = cUserLoan.InterestDeductionAmount ?? 0;
                        //    loan.TotalInterestInstallment = cUserLoan.NoOfInstallmentForInterest ?? 0;


                        //    //loan.CapitalAmount = 0;
                        //    //loan.CurrentCapitalInstallment = 0;
                        //    //loan.TotalCapitalInstallment = 0;

                        //}

                    }
                    //else
                    //{
                    //    loan.CapitalAmount = 0;
                    //    loan.CurrentCapitalInstallment = 0;
                    //    loan.TotalCapitalInstallment = 0;

                    //    loan.CurrentInterestInstallment = 0;
                    //    loan.TotalInterestInstallment = 0;
                    //    loan.InterestAmount = 0;

                    //}
                    //loanPart.Add(loan);
                    switch (l.Name)
                    {
                        case "CPFFirstLoan":
                            mainRow["CPFFirstCapital"] = loan.CapitalAmount;
                            mainRow["CPFFirstInstallment"] = loan.CurrentCapitalInstallment + "/" + loan.TotalCapitalInstallment;
                            break;
                        case "CPFSecondLoan":
                            mainRow["CPFSecondCapital"] = loan.CapitalAmount;
                            mainRow["CPFSecondInstallment"] = loan.CurrentCapitalInstallment + "/" + loan.TotalCapitalInstallment; ;
                            break;
                        case "MotorCycleFirst":
                            mainRow["MotorCycleFirstCapital"] = loan.CapitalAmount;
                            mainRow["MotorCycleFirstCapitalInstallment"] = loan.CurrentCapitalInstallment + "/" + loan.TotalCapitalInstallment;
                            mainRow["MotorCycleFirstInterest"] = loan.InterestAmount;
                            mainRow["MotorCycleFirstInterestInstallment"] = loan.CurrentInterestInstallment + "/" + loan.TotalInterestInstallment; ;
                            break;
                        case "MotorCycleSecond":
                            mainRow["MotorCycleSecondCapital"] = loan.CapitalAmount;
                            mainRow["MotorCycleSecondCapitalInstallment"] = loan.CurrentCapitalInstallment + "/" + loan.TotalCapitalInstallment;
                            mainRow["MotorCycleSecondInterest"] = loan.InterestAmount;
                            mainRow["MotorCycleSecondInterestInstallment"] = loan.CurrentInterestInstallment + "/" + loan.TotalInterestInstallment; ;
                            break;
                        case "CarFirst":
                            mainRow["CarFirstCapital"] = loan.CapitalAmount;
                            mainRow["CarFirstCapitalInstallment"] = loan.CurrentCapitalInstallment + "/" + loan.TotalCapitalInstallment;
                            mainRow["CarFirstInterest"] = loan.InterestAmount;
                            mainRow["CarFirstInterestInstallment"] = loan.CurrentInterestInstallment + "/" + loan.TotalInterestInstallment; ;
                            break;
                        case "CarSecond":
                            mainRow["CarSecondCapital"] = loan.CapitalAmount;
                            mainRow["CarSecondCapitalInstallment"] = loan.CurrentCapitalInstallment + "/" + loan.TotalCapitalInstallment;
                            mainRow["CarSecondInterest"] = loan.InterestAmount;
                            mainRow["CarSecondInterestInstallment"] = loan.CurrentInterestInstallment + "/" + loan.TotalInterestInstallment; ;
                            break;
                        case "HouseBuildingFirst":
                            mainRow["HouseBuildingFirstCapital"] = loan.CapitalAmount;
                            mainRow["HouseBuildingFirstCapitalInstallment"] = loan.CurrentCapitalInstallment + "/" + loan.TotalCapitalInstallment;
                            mainRow["HouseBuildingFirstInterest"] = loan.InterestAmount;
                            mainRow["HouseBuildingFirstInterestInstallment"] = loan.CurrentInterestInstallment + "/" + loan.TotalInterestInstallment; ;
                            break;
                        case "HouseBuildingSecond":
                            mainRow["HouseBuildingSecondCapital"] = loan.CapitalAmount;
                            mainRow["HouseBuildingSecondCapitalInstallment"] = loan.CurrentCapitalInstallment + "/" + loan.TotalCapitalInstallment;
                            mainRow["HouseBuildingSecondInterest"] = loan.InterestAmount;
                            mainRow["HouseBuildingSecondInterestInstallment"] = loan.CurrentInterestInstallment + "/" + loan.TotalInterestInstallment; ;
                            break;
                        case "HouseRepairingFirst":
                            mainRow["HouseRepairingFirstCapital"] = loan.CapitalAmount;
                            mainRow["HouseRepairingFirstCapitalInstallment"] = loan.CurrentCapitalInstallment + "/" + loan.TotalCapitalInstallment;
                            mainRow["HouseRepairingFirstInterest"] = loan.InterestAmount;
                            mainRow["HouseRepairingFirstInterestInstallment"] = loan.CurrentInterestInstallment + "/" + loan.TotalInterestInstallment; ;
                            break;
                        case "HouseRepairingSecond":
                            mainRow["HouseRepairingSecondCapital"] = loan.CapitalAmount;
                            mainRow["HouseRepairingSecondCapitalInstallment"] = loan.CurrentCapitalInstallment + "/" + loan.TotalCapitalInstallment;
                            mainRow["HouseRepairingSecondInterest"] = loan.InterestAmount;
                            mainRow["HouseRepairingSecondInterestInstallment"] = loan.CurrentInterestInstallment + "/" + loan.TotalInterestInstallment; ;
                            break;
                        case "HouseRepairingThird":
                            mainRow["HouseRepairingThirdCapital"] = loan.CapitalAmount;
                            mainRow["HouseRepairingThirdCapitalInstallment"] = loan.CurrentCapitalInstallment + "/" + loan.TotalCapitalInstallment;
                            mainRow["HouseRepairingThirdInterest"] = loan.InterestAmount;
                            mainRow["HouseRepairingThirdInterestInstallment"] = loan.CurrentInterestInstallment + "/" + loan.TotalInterestInstallment; ;
                            break;
                        case "OthersAdvance":
                            mainRow["OthersAdvanceCapital"] = loan.CapitalAmount;
                            mainRow["OthersAdvanceCapitalInstallment"] = loan.CurrentCapitalInstallment + "/" + loan.TotalCapitalInstallment;
                            mainRow["OthersAdvanceInterest"] = loan.InterestAmount;
                            mainRow["OthersAdvanceInterestInstallment"] = loan.CurrentInterestInstallment + "/" + loan.TotalInterestInstallment; ;
                            break;
                        case "Others":
                            mainRow["OthersCapital"] = loan.CapitalAmount;
                            mainRow["OthersCapitalInstallment"] = loan.CurrentCapitalInstallment + "/" + loan.TotalCapitalInstallment;
                            mainRow["OthersInterest"] = loan.InterestAmount;
                            mainRow["OthersInterestInstallment"] = loan.CurrentInterestInstallment + "/" + loan.TotalInterestInstallment; ;
                            break;
                    }

                    sumOfDeduction += (loan.InterestAmount + loan.CapitalAmount);
                    //  mainRow[l.Name] = loan.Amount;
                }
                // salary.LoanPart = loanPart;

                //Others
                var othersList = deductions.Where(c => c.DeductionType == DeductionType.Others);

                foreach (var o in othersList)
                {
                    OthersVm others = new OthersVm();
                    others.Name = o.Name;

                    var data = userWiseDeductions.FirstOrDefault(c => (c.AppUserId == user.Id && c.DeductionId == o.Id && (c.IsSameEveryMonth || (c.Year == year && c.Month == month))));

                    if (data != null)
                    {
                        others.Amount = data?.Amount ?? 0;
                    }
                    else
                    {
                        var gfd = gradeWiseFixedDeduction.FirstOrDefault(c =>
                            c.DeductionId == o.Id && c.FromGradeId <= user.GradeId && c.ToGradeId >= user.GradeId);

                        if (gfd != null)
                        {
                            others.Amount = gfd?.Amount ?? 0;
                        }
                        else
                        {
                            var fixedDeduction = fixedDeductions.FirstOrDefault(c => c.DeductionId == o.Id);
                            others.Amount = fixedDeduction?.Amount ?? 0;
                        }
                    }


                    //othersPart.Add(others);
                    mainRow[o.Name] = others.Amount;
                    sumOfDeduction += others.Amount;
                }

                //  salary.OthersPart = othersPart;


                //Complete Calculation
                //list.Add(salary);

                var gradeScaleFirst = gradeSteps.Where(c => c.GradeId == user.GradeId).OrderBy(c => c.Amount).FirstOrDefault().Amount;
                var gradeScaleLast = gradeSteps.Where(c => c.GradeId == user.GradeId).OrderByDescending(c => c.Amount).FirstOrDefault().Amount;


                mainRow["EmployeeCode"] = user.EmployeeCode;
                mainRow["BankAccountNo"] = user.BankAccountNoBangla;
                mainRow["EmployeeName"] = user.FullName;
                mainRow["Scale"] = gradeScaleFirst + "-" + gradeScaleLast;
                mainRow["Department"] = user.Department.Name;
                mainRow["CurrentBasic"] = user.CurrentBasic;
                mainRow["Designation"] = user.Designation.Name;

                mainRow["GrossSalary"] = sumOfAllowance;
                mainRow["TotalDeduction"] = sumOfDeduction;
                string netSalary = (sumOfAllowance - sumOfDeduction).ToString("#.##");
                mainRow["NetSalary"] = netSalary;
                mainRow["NetInWord"] = NumberToWordConverter.ConvertToWords(netSalary);
                sumOfNetSalary += Convert.ToDecimal(netSalary);

                if (isBanglaRequired)
                {
                    mainRow["EmployeeNameBangla"] = user.FullNameBangla;
                    mainRow["DesignationBangla"] = user.Designation.NameBangla;
                    mainRow["NetSalaryBangla"] = string.Concat(netSalary.Select(c => (char)('\u09E6' + c - '0'))).Replace("৤", ".");
                }



                mainTable.Rows.Add(mainRow);

            }

            return mainTable;
        }

        public IActionResult BankReport()
        {
            ViewBag.Station = _stationManager.GetAll();
            ViewBag.Wings = _wingsManager.GetWings();
            ViewBag.Grade = _gradeManager.GetList();
            return View();
        }
        [HttpPost]
        public IActionResult BankReport(int StationId, int WingId, int FromGradeId, int ToGradeId, int year, int month, string checkNo, DateTime salaryDate)
        {
            var users = _userManager.Users.Where(c => c.StationId == StationId && c.WingId == WingId && c.GradeId >= FromGradeId && c.GradeId <= ToGradeId).Include(c => c.Station).Include(v => v.Department).Include(v => v.Designation);
            var source = CalculateSalary(year, month, users, true);

            string rptPath = $"{this.webHostEnvironment.WebRootPath}\\Reports\\BankReport.rdlc";
            //string renderFormat = "PDF";
            string mimtype = "application/pdf";
            var report = new LocalReport(rptPath);
            Dictionary<string, string> parameters = new Dictionary<string, string>();
            parameters.Add("checkNo", string.Concat(checkNo.Select(c => (char)('\u09E6' + c - '0'))));
            parameters.Add("monthYear", GetMonthName.MonthInBangla(month) + "/" + string.Concat(year.ToString().Select(c => (char)('\u09E6' + c - '0'))));
            var day = string.Concat(salaryDate.Day.ToString().Select(c => (char)('\u09E6' + c - '0')));
            var m = string.Concat(salaryDate.Month.ToString().Select(c => (char)('\u09E6' + c - '0')));
            var y = string.Concat(salaryDate.Year.ToString().Select(c => (char)('\u09E6' + c - '0')));
            parameters.Add("salaryDate", day + "/" + m + "/" + y);
            parameters.Add("totalSum", string.Concat(sumOfNetSalary.ToString().Select(c => (char)('\u09E6' + c - '0'))).Replace("৤", "."));
            parameters.Add("totalSumInWord", NumberToWordConverter.ConvertToWordsBangla(sumOfNetSalary.ToString()));
            var extenstion = 1;
            report.AddDataSource("Bank", source);
            var result = report.Execute(RenderType.Pdf, extenstion, parameters, mimtype);

            return File(result.MainStream, "application/pdf");
        }

        private FiscalYear GetFiscalYear(int month, int year)
        {
            string value = "";
            if (month <= 6)
            {
                value = year - 1 + "-" + year;
            }
            else
            {
                value = year + "-" + year + 1;
            }

            return _fiscalYearManager.GetByValue(value);

        }
       


    }
}
