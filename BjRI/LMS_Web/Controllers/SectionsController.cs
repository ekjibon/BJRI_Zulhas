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
    public class SectionsController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<AppUser> _userManager;

        public SectionsController(ApplicationDbContext context, UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.Section.Include(s => s.CreatedBy).Include(s => s.Department).Include(s => s.UpdatedBy);
            return View(await applicationDbContext.ToListAsync());
        }


        public IActionResult Create()
        {
            ViewData["Wing"] = new SelectList(_context.Wing, "Id", "Name");
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Section section)
        {
            if (ModelState.IsValid)
            {

                section.CreatedById = _userManager.GetUserId(User);
                section.CreatedDateTime = DateTime.Now;
                section.IsActive = true;

                _context.Add(section);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["Wing"] = new SelectList(_context.Wing, "Id", "Name");
            return View(section);
        }

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var section = _context.Section
                .Include(x => x.Department)
                .FirstOrDefault(x => x.Id == id);
            //ViewBag.CurrentWing = _context.Department.FirstOrDefault(x=>x)
            if (section == null)
            {
                return NotFound();
            }
            ViewBag.Department = _context.Department.Where(x => x.IsActive).ToList();
            ViewBag.Wing = _context.Wing.Where(x => x.IsActive).ToList();
            return View(section);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, Section section)
        {
            if (id != section.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {

                    var currentSection = await _context.Section.FindAsync(id);
                    currentSection.Name = section.Name;
                    currentSection.DepartmentId = section.DepartmentId;
                    currentSection.UpdatedById = _userManager.GetUserId(User);
                    currentSection.CreatedDateTime = DateTime.Now;

                    _context.Update(currentSection);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SectionExists(section.Id))
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
            ViewData["CreatedById"] = new SelectList(_context.Users, "Id", "Id", section.CreatedById);
            ViewData["DepartmentId"] = new SelectList(_context.Department, "Id", "Id", section.DepartmentId);
            ViewData["UpdatedById"] = new SelectList(_context.Users, "Id", "Id", section.UpdatedById);
            return View(section);
        }



        private bool SectionExists(int id)
        {
            return _context.Section.Any(e => e.Id == id);
        }

        public IActionResult GetDepartments(int wingId)
        {
            var departments = _context.Department.Where(x => x.WingId == wingId);
            return Json(departments);
        }

        //public IActionResult GetSections(int deptId)
        //{
        //    var sections = _context.Section.Where(x => x.DepartmentId == deptId);
        //    return Json(sections);
        //}
    }
}
