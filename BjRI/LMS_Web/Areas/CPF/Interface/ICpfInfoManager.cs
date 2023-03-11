﻿using LMS_Web.Areas.CPF.Models;
using LMS_Web.Areas.Loan.Models;
using LMS_Web.Areas.Salary.Models;
using LMS_Web.Interface.Manager;
using System.Collections.Generic;

namespace LMS_Web.Areas.CPF.Interface
{
    interface ICpfInfoManager: IBaseManager<CpfInfo>
    {
        CpfInfo GetListByMonthUser(int year, int month, string appUserId);    
        ICollection<CpfInfo> GetListByMonth(int year, int month);
        CpfInfo GetById(int id);
        ICollection<CpfInfo> GetList();
        ICollection<CpfInfo> GetListByMonthUser(int fyear, int fmonth, int tyear, int tmonth, string appUserId);
        ICollection<CpfInfo> GetBetweenGrade(int stationId, int fromGrade, int ToGrade, int year, int month);
       

    }
}
