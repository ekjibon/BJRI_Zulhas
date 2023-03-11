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
    public class WingsController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<AppUser> _userManager;

        public WingsController(ApplicationDbContext context, UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }


        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.Wing.Include(w => w.CreatedBy).Include(w => w.UpdatedBy);
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
        public async Task<IActionResult> Create(Wing wing)
        {
            if (ModelState.IsValid)
            {
                var userId = _userManager.GetUserId(User);
                wing.CreatedById = userId;
                wing.CreatedDateTime = DateTime.Now;
                wing.IsActive = true;
                _context.Add(wing);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CreatedById"] = new SelectList(_context.Users, "Id", "Id", wing.CreatedById);
            ViewData["UpdatedById"] = new SelectList(_context.Users, "Id", "Id", wing.UpdatedById);
            return View(wing);
        }


        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var wing = await _context.Wing.FindAsync(id);
            if (wing == null)
            {
                return NotFound();
            }
            ViewData["CreatedById"] = new SelectList(_context.Users, "Id", "Id", wing.CreatedById);
            ViewData["UpdatedById"] = new SelectList(_context.Users, "Id", "Id", wing.UpdatedById);
            return View(wing);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, Wing wing)
        {
            if (id != wing.Id)
            {
                return NotFound();
            }


            var oldWing = await _context.Wing.FindAsync(id);

            if (ModelState.IsValid)
            {
                try
                {
                    var userId = _userManager.GetUserId(User);
                    oldWing.Name = wing.Name;
                    oldWing.UpdatedById = userId;
                    oldWing.UpdatedDateTime = DateTime.Now;
                    _context.Update(oldWing);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!WingExists(wing.Id))
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
            ViewData["CreatedById"] = new SelectList(_context.Users, "Id", "Id", wing.CreatedById);
            ViewData["UpdatedById"] = new SelectList(_context.Users, "Id", "Id", wing.UpdatedById);
            return View(wing);
        }

        private bool WingExists(int id)
        {
            return _context.Wing.Any(e => e.Id == id);
        }
    }
}
