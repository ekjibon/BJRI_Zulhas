using LMS_Web.Data;
using LMS_Web.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Internal;
using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;

namespace LMS_Web.Controllers
{
    [Authorize]
    public class DesignationsController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<AppUser> _userManager;

        public DesignationsController(ApplicationDbContext context, UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }


        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.Designation.Include(d => d.CreatedBy).Include(d => d.UpdatedBy);
            return View(await applicationDbContext.ToListAsync());
        }

        public IActionResult Create()
        {
            ViewData["CreatedById"] = new SelectList(_context.Users, "Id", "Id");
            ViewData["UpdatedById"] = new SelectList(_context.Users, "Id", "Id");
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Designation designation)
        {
            if (ModelState.IsValid)
            {
                var userId = _userManager.GetUserId(User);
                designation.CreatedById = userId;
                designation.CreatedDateTime = DateTime.Now;
                _context.Add(designation);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CreatedById"] = new SelectList(_context.Users, "Id", "Id", designation.CreatedById);
            ViewData["UpdatedById"] = new SelectList(_context.Users, "Id", "Id", designation.UpdatedById);
            return View(designation);
        }


        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var designation = await _context.Designation.FindAsync(id);
            if (designation == null)
            {
                return NotFound();
            }
            ViewData["CreatedById"] = new SelectList(_context.Users, "Id", "Id", designation.CreatedById);
            ViewData["UpdatedById"] = new SelectList(_context.Users, "Id", "Id", designation.UpdatedById);
            return View(designation);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, Designation designation)
        {
            if (id != designation.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    var currentDesignation = await _context.Designation.FindAsync(id);
                    var userId = _userManager.GetUserId(User);
                    currentDesignation.UpdatedById = userId;
                    currentDesignation.UpdatedDateTime = DateTime.Now;
                    currentDesignation.Name = designation.Name;
                    _context.Update(currentDesignation);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!DesignationExists(designation.Id))
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
            ViewData["CreatedById"] = new SelectList(_context.Users, "Id", "Id", designation.CreatedById);
            ViewData["UpdatedById"] = new SelectList(_context.Users, "Id", "Id", designation.UpdatedById);
            return View(designation);
        }
        private bool DesignationExists(int id)
        {
            return _context.Designation.Any(e => e.Id == id);
        }

        public IActionResult GetDesignations(string prefix)
        {
            var designations = _context.Designation.Where(x => x.Name.StartsWith(prefix)).ToList();
            return Json(designations);
        }
    }
}
