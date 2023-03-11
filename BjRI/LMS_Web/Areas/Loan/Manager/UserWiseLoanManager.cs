using LMS_Web.Areas.Loan.Interface;
using LMS_Web.Areas.Loan.Models;
using LMS_Web.Data;
using LMS_Web.Manager;
using LMS_Web.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LMS_Web.Areas.Loan.Manager
{
    public class UserWiseLoanManager:BaseManager<UserWiseLoan>, IUserWiseLoanManager
    {
        public UserWiseLoanManager(ApplicationDbContext db):base(new BaseRepository<UserWiseLoan>(db))
        {

        }

        public ICollection<UserWiseLoan> GetList()
        {
            return Get(c => !c.IsPaid, c=>c.AppUsers,c=>c.LoanHeads);
        }

        public ICollection<UserWiseLoan> GetActiveLoans()
        {
            return Get(c => !c.IsPaid);
        }

        public UserWiseLoan GetById(int id)
        {
            return GetFirstOrDefault( x => x.Id == id);
        }
    }
}
