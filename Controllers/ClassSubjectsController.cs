using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using VirtualGradingSys.Data;
using VirtualGradingSys.Models;

namespace VirtualGradingSys.Controllers
{
    public class ClassSubjectsController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ClassSubjectsController(ApplicationDbContext context)
        {
            _context = context;
        }
        
        // GET: ClassSubjects
        public async Task<IActionResult> Index()
        {
            var gradingSystemContext = _context.ClassSubjects
                .Include(c => c.Class)
                .Include(c => c.Subject)
                .Include(c => c.Subject.Teacher)
                .OrderBy(c => c.ClassId);
            return View(await gradingSystemContext.ToListAsync());
        }

        // GET: ClassSubjects/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var classSubjects = await _context.ClassSubjects
                .Include(c => c.Class)
                .Include(c => c.Subject)
                .Include(c => c.Subject.Teacher)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (classSubjects == null)
            {
                return NotFound();
            }

            return View(classSubjects);
        }

        // GET: ClassSubjects/Create
        public IActionResult Create()
        {
            ViewData["ClassId"] = new SelectList(_context.Classes, "Id", "ClassName");
            ViewData["SubjectId"] = new SelectList(_context.Subjects, "Id", "Name");
            return View();
        }

        // POST: ClassSubjects/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,SubjectId,ClassId")] ClassSubjects classSubjects)
        {
            if (ModelState.IsValid)
            {
                _context.Add(classSubjects);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["ClassId"] = new SelectList(_context.Classes, "Id", "ClassName", classSubjects.ClassId);
            ViewData["SubjectId"] = new SelectList(_context.Subjects, "Id", "Name", classSubjects.SubjectId);
            return View(classSubjects);
        }

        // GET: ClassSubjects/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var classSubjects = await _context.ClassSubjects.FindAsync(id);
            if (classSubjects == null)
            {
                return NotFound();
            }
            ViewData["ClassId"] = new SelectList(_context.Classes, "Id", "ClassName", classSubjects.ClassId);
            ViewData["SubjectId"] = new SelectList(_context.Subjects, "Id", "Name", classSubjects.SubjectId);
            return View(classSubjects);
        }

        // POST: ClassSubjects/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,SubjectId,ClassId")] ClassSubjects classSubjects)
        {
            if (id != classSubjects.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(classSubjects);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ClassSubjectsExists(classSubjects.Id))
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
            ViewData["ClassId"] = new SelectList(_context.Classes, "Id", "ClassName", classSubjects.ClassId);
            ViewData["SubjectId"] = new SelectList(_context.Subjects, "Id", "Name", classSubjects.SubjectId);
            return View(classSubjects);
        }

        // GET: ClassSubjects/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var classSubjects = await _context.ClassSubjects
                .Include(c => c.Class)
                .Include(c => c.Subject)
                .Include(c => c.Subject.Teacher)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (classSubjects == null)
            {
                return NotFound();
            }

            return View(classSubjects);
        }

        // POST: ClassSubjects/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var classSubjects = await _context.ClassSubjects.FindAsync(id);
            if (classSubjects != null)
            {
                _context.ClassSubjects.Remove(classSubjects);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ClassSubjectsExists(int id)
        {
            return _context.ClassSubjects.Any(e => e.Id == id);
        }
    }
}
