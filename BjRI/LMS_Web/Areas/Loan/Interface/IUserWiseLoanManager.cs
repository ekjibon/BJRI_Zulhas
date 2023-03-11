using LMS_Web.Areas.Loan.Models;
using LMS_Web.Interface.Manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LMS_Web.Areas.Loan.Interface
{
    interface IUserWiseLoanManager: IBaseManager<UserWiseLoan>
    {
        ICollection<UserWiseLoan> GetList();
        ICollection<UserWiseLoan> GetActiveLoans();
        UserWiseLoan GetById(int id);
    }
}
