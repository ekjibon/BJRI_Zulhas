using LMS_Web.Areas.Loan.Models;
using LMS_Web.Interface.Manager;
using System.Collections.Generic;

namespace LMS_Web.Areas.Loan.Interface
{
    interface ILoanInstallmentInfoManager : IBaseManager<LoanInstallmentInfo>
    {
        ICollection<LoanInstallmentInfo> GetList(int fyear, int fmonth, int loanHearId, string appUserId);
        ICollection<LoanInstallmentInfo> GetListByUser(string appUserId);
        ICollection<LoanInstallmentInfo> GetCurrentMonthLoan(int year, int month);
        ICollection<LoanInstallmentInfo> GetCurrentMonthCpfLoan(int year, int month);


    }
}
