using LMS_Web.Areas.Loan.Models;
using LMS_Web.Areas.Settings.Models;
using LMS_Web.Interface.Manager;
using System.Collections.Generic;

namespace LMS_Web.Areas.Settings.Interface
{
    interface ITaxInstallmentInfoManager: IBaseManager<TaxInstallmentInfo>
    {
        ICollection<TaxInstallmentInfo> GetListByUser(int userTaxId);
        ICollection<TaxInstallmentInfo> GetByMonthYear(int month,int year);
        
        TaxInstallmentInfo GetByMonthYearAndTaxId(int year, int month, int taxId);
    }
}
