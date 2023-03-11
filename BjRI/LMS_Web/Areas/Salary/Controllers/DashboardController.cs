using Microsoft.AspNetCore.Mvc;

namespace LMS_Web.Areas.Salary.Controllers
{
    [Area("Salary")]
    public class DashboardController : Controller
    {
        public IActionResult test()
        { 
            return View();
            
        }
    }
}
