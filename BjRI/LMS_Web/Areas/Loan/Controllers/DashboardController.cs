using LMS_Web.SecurityExtension;
using Microsoft.AspNetCore.Mvc;

namespace LMS_Web.Areas.Loan.Controllers
{
    [Area("Loan")]
    public class DashboardController : Controller
    {
        //[MiddlewareFilter(typeof(MyCustomAuthenticationMiddlewarePipeline))]
        public IActionResult Index()
        {
            return View();
        }
    }
}
