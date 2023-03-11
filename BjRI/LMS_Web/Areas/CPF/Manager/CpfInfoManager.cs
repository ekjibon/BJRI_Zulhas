using LMS_Web.Areas.CPF.Interface;
using LMS_Web.Areas.CPF.Models;
using LMS_Web.Areas.Loan.Interface;
using LMS_Web.Areas.Loan.Models;
using LMS_Web.Data;
using LMS_Web.Manager;
using LMS_Web.Repository;
using System.Collections.Generic;
using System.Linq;

namespace LMS_Web.Areas.CPF.Manager
{
    public class CpfInfoManager: BaseManager<CpfInfo>, ICpfInfoManager
    {
        public CpfInfoManager(ApplicationDbContext db) : base(new BaseRepository<CpfInfo>(db))
        {
            
        }

        public ICollection<CpfInfo> GetBetweenGrade(int stationId, int fromGrade, int ToGrade, int year, int month)
        {
           return Get(c=>c.Year==year && c.Month==month && c.AppUser.StationId==stationId && c.AppUser.GradeId>=fromGrade && c.AppUser.GradeId<=ToGrade,c=>c.AppUser,c=>c.AppUser.Designation);
        }

        public CpfInfo GetById(int id)
        {
            return GetFirstOrDefault(x => x.Id == id);
        }

        public ICollection<CpfInfo> GetList()
        {
            return Get(c => true);
        }

        public ICollection<CpfInfo> GetListByMonth(int year, int month)
        {
            return Get(e => e.Year == year && e.Month == month);
        }

        public CpfInfo GetListByMonthUser(int year, int month,string appUserId)
        {
            return GetFirstOrDefault(e => e.Year == year && e.Month == month && e.AppUserId==appUserId);
        }

        public ICollection<CpfInfo> GetListByMonthUser(int fyear, int fmonth, int tyear, int tmonth, string appUserId)
        {
            return Get(c => (c.Year >= fyear || c.Year <= tyear) && (c.Month >= fmonth || c.Month <= tmonth) && c.AppUserId == appUserId);

        }

    }
}
