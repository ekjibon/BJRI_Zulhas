using LMS_Web.Areas.CPF.Models;
using LMS_Web.Areas.CPF.ViewModels;
using LMS_Web.Areas.Salary.ViewModels;
using System.Collections.Generic;

namespace LMS_Web.Areas.CPF.Interface
{
    interface IShortBillManager
    {
        ICollection<ShortBillVM> GetList();
        ShortBillVM GetById(int id);
        //ICollection<UserFundInfo> GetBetweenGrade(int fromGrade, int ToGrade, int year, int month);
    }
}
