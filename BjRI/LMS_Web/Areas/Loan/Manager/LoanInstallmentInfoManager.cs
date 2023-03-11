using LMS_Web.Areas.Loan.Interface;
using LMS_Web.Areas.Loan.Models;
using LMS_Web.Data;
using LMS_Web.Manager;
using LMS_Web.Repository;
using System.Collections.Generic;
using System.Linq;

namespace LMS_Web.Areas.Loan.Manager
{
    public class LoanInstallmentInfoManager: BaseManager<LoanInstallmentInfo>, ILoanInstallmentInfoManager
    {
        public LoanInstallmentInfoManager(ApplicationDbContext db) : base(new BaseRepository<LoanInstallmentInfo>(db))
        {

        }
        public ICollection<LoanInstallmentInfo> GetListByUser(string appUserId) 
        { 
           return Get(e=> e.AppUserId == appUserId).ToList();
        }

        public ICollection<LoanInstallmentInfo> GetCurrentMonthLoan(int year, int month)
        {
            return Get(c => c.Year == year && c.Month == month);
        }
        public ICollection<LoanInstallmentInfo> GetCurrentMonthCpfLoan(int year, int month)
        {
            return Get(c => c.Year == year && c.Month == month && c.UserWiseLoan.LoanHeads.LoanHeadType==LoanHeadType.CPF,c=>c.UserWiseLoan);
        }


        public ICollection<LoanInstallmentInfo> GetList(int fyear, int fmonth, int loanHearId, string appUserId)
        {
            var data = Get(c => (c.Year>fyear || (c.Month >= fmonth && c.Year >= fyear)) && c.LoanHeadId==loanHearId && c.AppUserId==appUserId);
            return data;
        }
    }
}
