using LMS_Web.Areas.CPF.Interface;
using LMS_Web.Areas.CPF.Models;
using LMS_Web.Areas.Loan.Models;
using LMS_Web.Data;
using LMS_Web.Manager;
using LMS_Web.Repository;
using System.Collections.Generic;

namespace LMS_Web.Areas.CPF.Manager
{
    public class InvestmentInfoManager : BaseManager<InvestmentInfo>, IInvestmentInfoManager
    {
        public InvestmentInfoManager(ApplicationDbContext db) : base(new BaseRepository<InvestmentInfo>(db))
        {

        }

        public ICollection<InvestmentInfo> GetList()
        {
            return Get(c => true);
        }

        public ICollection<InvestmentInfo> GetListByMonth(int year, int month)
        {
            return Get(e => e.Year == year && e.Month == month);
        }

        public ICollection<InvestmentInfo> GetListByMonthUser(int fyear, int fmonth, int tyear, int tmonth, string appUserId)
        {
            return  Get(c => (c.Year >= fyear || c.Year <=tyear) && (c.Month>=fmonth || c.Month<=tmonth) && c.AppUserId == appUserId);
            
        }
    }
}
