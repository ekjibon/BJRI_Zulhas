using LMS_Web.Areas.CPF.Interface;
using LMS_Web.Areas.CPF.Models;
using LMS_Web.Areas.CPF.ViewModels;
using LMS_Web.Areas.Salary.ViewModels;
using LMS_Web.Data;
using LMS_Web.Manager;
using LMS_Web.Repository;
using System.Collections.Generic;

namespace LMS_Web.Areas.CPF.Manager
{
    public class ShortBillManager:BaseManager<ShortBillVM>,IShortBillManager
    {
        public ShortBillManager(ApplicationDbContext db) : base(new BaseRepository<ShortBillVM>(db))
        {
        }

        //public ICollection<UserFundInfo> GetBetweenGrade(int fromGrade, int ToGrade, int year, int month)
        //{
        //    return Get(c => c.Year == year && c.Month == month && c.AppUser.GradeId >= fromGrade && c.AppUser.GradeId <= ToGrade, c => c.AppUser, c => c.AppUser.Designation);
        //}

        public ShortBillVM GetById(int id)
        {
            throw new System.NotImplementedException();
        }

        public ICollection<ShortBillVM> GetList()
        {
            throw new System.NotImplementedException();
        }
    }
}
