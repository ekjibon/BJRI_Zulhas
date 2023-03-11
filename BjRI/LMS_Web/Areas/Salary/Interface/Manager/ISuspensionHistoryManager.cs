using System;
using System.Collections.Generic;
using LMS_Web.Areas.Salary.Models;
using LMS_Web.Interface.Manager;

namespace LMS_Web.Areas.Salary.Interface.Manager
{
   interface ISuspensionHistoryManager : IBaseManager<SuspensionHistory>
   {
       SuspensionHistory GetByUserId(string userId);
       ICollection<SuspensionHistory> GetCurrentSuspension(DateTime firstDayOfMonth, DateTime lastDayOfMonth);
   }
}
