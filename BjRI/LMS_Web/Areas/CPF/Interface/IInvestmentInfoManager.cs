using LMS_Web.Areas.CPF.Models;
using System.Collections.Generic;

namespace LMS_Web.Areas.CPF.Interface
{
    interface IInvestmentInfoManager
    {
        ICollection<InvestmentInfo> GetListByMonth(int year, int month);
        ICollection<InvestmentInfo> GetList();
        ICollection<InvestmentInfo> GetListByMonthUser(int fyear,int fmonth, int tyear,int tmonth,string appUserId);
    }
}
