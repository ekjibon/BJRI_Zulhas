using LMS_Web.Areas.CPF.Interface;
using LMS_Web.Areas.CPF.Models;
using LMS_Web.Areas.Loan.Interface;
using LMS_Web.Areas.Loan.Models;
using LMS_Web.Data;
using LMS_Web.Manager;
using LMS_Web.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LMS_Web.Areas.CPF.Manager
{
    public class UserFundManager : BaseManager<UserFundInfo>, IUserFundManager
    {
        public UserFundManager(ApplicationDbContext db):base(new BaseRepository<UserFundInfo>(db))
        {

        }
        public UserFundInfo GetById(int id)
        {
            return GetFirstOrDefault(x => x.Id == id);
        }
        public ICollection<UserFundInfo> GetBetweenGrade( int fromGrade, int ToGrade, int year, int month)
        {
            return Get(c => c.Year == year && c.Month == month && c.AppUser.GradeId >= fromGrade && c.AppUser.GradeId <= ToGrade, c => c.AppUser, c => c.AppUser.Designation);
        }
        public ICollection<UserFundInfo> GetList()
        {
            return Get(c => true);
        }

    }
}
