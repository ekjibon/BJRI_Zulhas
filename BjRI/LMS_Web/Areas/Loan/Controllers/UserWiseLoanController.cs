using LMS_Web.Areas.Loan.Manager;
using LMS_Web.Areas.Loan.Models;
using LMS_Web.Data;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using LMS_Web.Areas.Salary.Enum;
using Microsoft.AspNetCore.Identity;
using LMS_Web.Models;
using System.Drawing;
using LMS_Web.Areas.Loan.Interface;
using LMS_Web.Areas.Salary.ViewModels;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace LMS_Web.Areas.Loan.Controllers
{
    [Area("Loan")]
    public class UserWiseLoanController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private UserWiseLoanManager userWiseLoanManager;
        private LoanHeadManager loanHeadManager;
        private readonly InterestSlabManager interestSlabManager;
        private LoanInstallmentInfoManager _userInstallmentInfoManager;
        private readonly UserWiseLoanManager _userWiseLoanManager;

        public UserWiseLoanController(ApplicationDbContext dbContext, UserManager<AppUser> userManager)
        {
            _userManager = userManager;
            userWiseLoanManager = new UserWiseLoanManager(dbContext);
            loanHeadManager = new LoanHeadManager(dbContext);
            interestSlabManager = new InterestSlabManager(dbContext);
            _userInstallmentInfoManager = new LoanInstallmentInfoManager(dbContext);
            _userWiseLoanManager = new UserWiseLoanManager(dbContext);
        }

        [HttpGet]
        public IActionResult Add(int? id)
        {
            UserWiseLoan userWiseLoan = new UserWiseLoan();
            if (id != null)
            {
                userWiseLoan = userWiseLoanManager.GetById((int)id);
            }
            ViewBag.users = _userManager.Users.ToList();
            ViewBag.loanHead = loanHeadManager.GetList();
            return View(userWiseLoan);
        }

        [HttpPost]
        public IActionResult Add(UserWiseLoan u, int? month, int? year)
        {


            decimal totalAmount = u.LoanAmount;

            var interestSlab = interestSlabManager.GetInterest(u.LoanAmount);
            if (interestSlab != null)
            {
                var interest = (u.LoanAmount * u.NoOfInstallment + u.LoanAmount * interestSlab.InterestRate) / 2400;
                var loanHead = loanHeadManager.GetById(u.LoanHeadId);
                if (loanHead != null)
                {
                    if (loanHead.LoanHeadType == LoanHeadType.CPF)
                    {
                        totalAmount += interest;
                        u.NoOfInstallmentForInterest = 0;
                        u.InterestDeductionAmount = 0;
                    }
                    else
                    {
                        u.InterestDeductionAmount = interest / u.NoOfInstallmentForInterest;
                    }
                    var monthlyDeductionAmount = totalAmount / u.NoOfInstallment;
                    u.CapitalDeductionAmount = monthlyDeductionAmount;
                    u.CreatedById = _userManager.GetUserId(User);
                    u.CreatedDateTime = DateTime.Now;
                    var result = userWiseLoanManager.Add(u);

                    List<LoanInstallmentInfo> allList = new List<LoanInstallmentInfo>();
                    for (int i = 0; i < u.NoOfInstallment; i++)
                    {

                        LoanInstallmentInfo userInstallmentInfo = new LoanInstallmentInfo();
                        userInstallmentInfo.AppUserId = u.AppUserId;
                        userInstallmentInfo.LoanHeadId = u.LoanHeadId;
                        userInstallmentInfo.CapitalInstallmentNo = i + 1;
                        userInstallmentInfo.IsCapital = true;
                        userInstallmentInfo.UserWiseLoanId = u.Id;


                        //month= month;                                                  

                        userInstallmentInfo.Month = (int)month;
                        userInstallmentInfo.Year = (int)year;
                        month += 1;
                        if (month > 12)
                        {
                            month = 1;
                            year = year + 1;

                        }
                        allList.Add(userInstallmentInfo);



                    }
                    for (int i = 0; i < u.NoOfInstallmentForInterest; i++)
                    {
                        LoanInstallmentInfo userInstallmentInfo = new LoanInstallmentInfo();

                        userInstallmentInfo.AppUserId = u.AppUserId;
                        userInstallmentInfo.LoanHeadId = u.LoanHeadId;
                        userInstallmentInfo.InterestInstallmentNo = i + 1;
                        userInstallmentInfo.IsCapital = false;
                        userInstallmentInfo.Month = (int)month;
                        userInstallmentInfo.Year = (int)year;
                        userInstallmentInfo.UserWiseLoanId = u.Id;
                        month += 1;
                        if (month > 12)
                        {
                            month = 1;
                            year = year + 1;

                        }
                        allList.Add(userInstallmentInfo);

                    }




                    if (result)
                    {
                        _userInstallmentInfoManager.Add(allList);
                        TempData["Success"] = "Successfully Added";
                    }
                    else
                    {
                        TempData["Error"] = "Failed Add";
                    }
                    return RedirectToAction("List");
                }
            }


            TempData["Error"] = "Unexpected Error";
            return RedirectToAction("List");
        }


        

        public IActionResult Stop(int loanId, int fmonth, int tmonth, int fyear, int tyear)
        {


            var userWiseLoan = userWiseLoanManager.GetById(loanId);
            //var instamentInfo = _userInstallmentInfoManager.GetListByUser(user.AppUserId);

            //if (userWiseLoan.IsPaid == false && userWiseLoan.IsStop == false)
            //{
            //    userWiseLoan.IsStop = true;
            //    userWiseLoan.StopUntilMonth =tmonth ;
            //    userWiseLoan.StopUntilYear = tyear;

            //   var result = userWiseLoanManager.Update(userWiseLoan);

            /// New code for stop loan Calculation--start----------------

            int distance = (((tyear - fyear) * 12) + tmonth - fmonth) + 1;
            var list = _userInstallmentInfoManager.GetList(fyear, fmonth, userWiseLoan.LoanHeadId, userWiseLoan.AppUserId);

            List<LoanInstallmentInfo> allList = new List<LoanInstallmentInfo>();

            foreach (var item in list)
            {
                int month = item.Month + distance;
                int year = item.Year;
                if (month > 12)
                {
                    month = month - 12;
                    year++;
                }
                item.Month = month;
                item.Year = year;
                allList.Add(item);
            }


            if (allList.Any())
            {
                bool result = _userInstallmentInfoManager.Update(allList);
                if (result)
                {
                    _userInstallmentInfoManager.Update(allList);
                    TempData["Success"] = "Loan Stoped successfully";
                }
                else
                {
                    TempData["Error"] = "Loan Stop Failed";
                }
            }


            else
            {
                TempData["Error"] = "Nothing updated";
            }
            return RedirectToAction("List");
        }
        public IActionResult LoanPay(int loanId, UserWiseLoan user)
        {
            //decimal totalAmount = user.LoanAmount;
            //var UserWiseLoan = userWiseLoanManager.GetById(loanId);
            //var interestSlab = interestSlabManager.GetInterest(user.LoanAmount);
            //var NoOfInstallment = user.NoOfInstallment.ToString();
            //if (interestSlab != null)
            //{
            //    var interest = (user.LoanAmount * user.NoOfInstallment + user.LoanAmount * interestSlab.InterestRate) / 2400;
            //    var loanHead = loanHeadManager.GetById(user.LoanHeadId);
            //}

            //if (UserWiseLoan.IsPaid == false && UserWiseLoan.IsStop == false)
            //{
            //    UserWiseLoan.IsPaid = true;



            //    var result = userWiseLoanManager.Update(UserWiseLoan);
            //    if (result)
            //    {
            //        TempData["Success"] = "Loan paid";
            //    }
            //    else
            //    {
            //        TempData["Error"] = "Failed Loan Paid";
            //    }
            //}
            //else
            //{
            //    TempData["Error"] = "Already Loan Paid";
            //}
            return RedirectToAction("List");
        }

        public IActionResult Approved(int loanId, int? month, int? year)
        {


            var userWiseLoan = userWiseLoanManager.GetById(loanId);
            //var instamentInfo = _userInstallmentInfoManager.GetListByUser(user.AppUserId);

            if (userWiseLoan.IsPaid == false)
            {
                userWiseLoan.IsApprove = true;
                var result = userWiseLoanManager.Update(userWiseLoan);
 
            }
            return RedirectToAction("List");
        }
        public IActionResult List()
        {
            ViewBag.Success = TempData["Success"];
            ViewBag.Error = TempData["Error"];
            var list = userWiseLoanManager.GetList();
            return View(list);
        }
    }
}




