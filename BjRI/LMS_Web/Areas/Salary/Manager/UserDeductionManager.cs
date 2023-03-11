using System.Collections.Generic;
using System.Linq;
using LMS_Web.Areas.Salary.Interface.Manager;
using LMS_Web.Areas.Salary.Models;
using LMS_Web.Data;
using LMS_Web.Manager;
using LMS_Web.Repository;

namespace LMS_Web.Areas.Salary.Manager
{
    public class UserDeductionManager:BaseManager<UserDeduction>,IUserDeductionManager
    {
        public UserDeductionManager(ApplicationDbContext db) : base(new BaseRepository<UserDeduction>(db))
        {
        }

        public UserDeduction GetById(int id)
        {
            return GetFirstOrDefault(c => c.Id == id);
        }

        public ICollection<UserDeduction> GetList()
        {
            return Get(c =>true,c=>c.Deduction, c=>c.AppUser);           
        }
    }
}
