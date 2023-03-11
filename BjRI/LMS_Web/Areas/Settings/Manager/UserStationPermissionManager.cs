using System.Collections.Generic;
using LMS_Web.Areas.Settings.Interface;
using LMS_Web.Areas.Settings.Models;
using LMS_Web.Data;
using LMS_Web.Manager;
using LMS_Web.Models;
using LMS_Web.Repository;

namespace LMS_Web.Areas.Settings.Manager
{
    public class UserStationPermissionManager : BaseManager<UserStationPermission>, IUserStationPermissionManager

    {
        public UserStationPermissionManager(ApplicationDbContext db) : base(new BaseRepository<UserStationPermission>(db))
        {
        }

        public ICollection<UserStationPermission> GetByUserId(string userId)
        {
            return Get(x =>x.AppUserId==userId,c=>c.Station);
        }
    }
}
