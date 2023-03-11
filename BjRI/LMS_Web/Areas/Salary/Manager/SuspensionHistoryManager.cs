using System;
using System.Collections.Generic;
using System.Linq;
using LMS_Web.Areas.Salary.Interface.Manager;
using LMS_Web.Areas.Salary.Models;
using LMS_Web.Data;
using LMS_Web.Manager;
using LMS_Web.Repository;

namespace LMS_Web.Areas.Salary.Manager
{
    public class SuspensionHistoryManager : BaseManager<SuspensionHistory>, ISuspensionHistoryManager
    {
        public SuspensionHistoryManager(ApplicationDbContext db) : base(new BaseRepository<SuspensionHistory>(db))
        {
        }


        public SuspensionHistory GetByUserId(string userId)
        {
            return GetFirstOrDefault(c => c.AppUserId == userId);
        }

        public ICollection<SuspensionHistory> GetCurrentSuspension(DateTime firstDayOfMonth, DateTime lastDayOfMonth)
        {


            return Get(c => c.StartDate <= lastDayOfMonth && c.EndDate>=firstDayOfMonth);
            //return Get(c => c.EndDate == null);
        }
    }
}
