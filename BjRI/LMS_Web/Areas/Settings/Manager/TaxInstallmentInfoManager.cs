using LMS_Web.Areas.Loan.Models;
using LMS_Web.Areas.Settings.Interface;
using LMS_Web.Areas.Settings.Models;
using LMS_Web.Data;
using LMS_Web.Manager;
using LMS_Web.Models;
using LMS_Web.Repository;
using System.Collections.Generic;
using System.Linq;

namespace LMS_Web.Areas.Settings.Manager
{
    public class TaxInstallmentInfoManager : BaseManager<TaxInstallmentInfo>, ITaxInstallmentInfoManager
    {
        public TaxInstallmentInfoManager(ApplicationDbContext db) : base(new BaseRepository<TaxInstallmentInfo>(db))
        {

        }
        public ICollection<TaxInstallmentInfo> GetListByUser(int userTaxId)
        {
            return Get(e => e.UserTaxId == userTaxId);
        }

        public ICollection<TaxInstallmentInfo> GetByMonthYear(int month, int year)
        {
            return Get(c => c.Month == month && c.Year == year);
        }

        public TaxInstallmentInfo GetByMonthYearAndTaxId(int year, int month,int taxId)
        {
            return GetFirstOrDefault(e => e.Year == year && e.Month==month && e.UserTaxId==taxId);
        }
    }
}