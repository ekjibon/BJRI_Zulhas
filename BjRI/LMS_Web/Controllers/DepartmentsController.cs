using LMS_Web.Data;
using LMS_Web.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace LMS_Web.Controllers
{
    public class DepartmentsController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<AppUser> _userManager;

        public DepartmentsController(ApplicationDbContext context, UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.Department.Include(d => d.CreatedBy).Include(d => d.UpdatedBy).Include(d => d.Wing);
            return View(await applicationDbContext.ToListAsync());
        }


        public IActionResult Create()
        {
            ViewData["CreatedById"] = new SelectList(_context.Users, "Id", "Id");
            ViewData["UpdatedById"] = new SelectList(_context.Users, "Id", "Id");
            ViewData["WingId"] = new SelectList(_context.Wing, "Id", "Name");
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Department department)
        {
            if (ModelState.IsValid)
            {
                var userId = _userManager.GetUserId(User);
                department.CreatedById = userId;
                department.CreatedDateTime = DateTime.Now;
                department.IsActive = true;
                _context.Add(department);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CreatedById"] = new SelectList(_context.Users, "Id", "Id", department.CreatedById);
            ViewData["UpdatedById"] = new SelectList(_context.Users, "Id", "Id", department.UpdatedById);
            ViewData["WingId"] = new SelectList(_context.Wing, "Id", "Name", department.WingId);
            return View(department);
        }

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var department = await _context.Department.FindAsync(id);
            if (department == null)
            {
                return NotFound();
            }
            ViewData["CreatedById"] = new SelectList(_context.Users, "Id", "Id", department.CreatedById);
            ViewData["UpdatedById"] = new SelectList(_context.Users, "Id", "Id", department.UpdatedById);
            ViewData["WingId"] = new SelectList(_context.Wing, "Id", "Name", department.WingId);
            return View(department);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, Department department)
        {
            if (id != department.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    var userId = _userManager.GetUserId(User);
                    var currentDepartment = await _context.Department.FindAsync(id);
                    currentDepartment.Name = department.Name;
                    currentDepartment.WingId = department.WingId;
                    currentDepartment.UpdatedById = userId;
                    currentDepartment.UpdatedDateTime = DateTime.Now;
                    _context.Update(currentDepartment);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!DepartmentExists(department.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["CreatedById"] = new SelectList(_context.Users, "Id", "Id", department.CreatedById);
            ViewData["UpdatedById"] = new SelectList(_context.Users, "Id", "Id", department.UpdatedById);
            ViewData["WingId"] = new SelectList(_context.Wing, "Id", "Name", department.WingId);
            return View(department);
        }
        private bool DepartmentExists(int id)
        {
            return _context.Department.Any(e => e.Id == id);
        }
    }
}
