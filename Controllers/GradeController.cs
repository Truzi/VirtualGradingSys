using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualBasic;
using SQLitePCL;
using VirtualGradingSys.Data;
using VirtualGradingSys.Models;

namespace VirtualGradingSys.Controllers
{
    [Authorize]
    public class GradeController : Controller
    {
        private readonly ApplicationDbContext _context;

        public GradeController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Grade
        //public async Task<IActionResult> Index()
        //{
        //    var gradingSystemContext = _context.Grades.Include(g => g.Student).Include(g => g.Subject);
        //    ViewData["Classes"] = _context.Students.Select(s => s.Class).Distinct().OrderBy(c => c.Year).ToList();
        //    ViewData["Students"] = _context.Students.Include(s => s.Parent).ToList();
        //    var classes = _context.Students.Select(s => s.Class).Distinct().OrderBy(c => c.Year).ToList();

        //    return View(await gradingSystemContext.ToListAsync());
        //}

        public async Task<IActionResult> Index(DateTime? startDate = null, DateTime? endDate = null, int? studentId = null, int? classId = null, int? subjectId = null)
        {
            var query = _context.Grades.Include(g => g.Student).Include(g => g.Subject).AsQueryable();

            if (startDate != null) {
                var sDate = DateOnly.FromDateTime(startDate.Value);
                query = query.Where(g => g.Date >= sDate);
            }
            if (endDate != null)
            {
                var eDate = DateOnly.FromDateTime(endDate.Value);
                query = query.Where(g => g.Date <= eDate);
            }
            if (studentId.GetValueOrDefault() != 0)
            {
                query = query.Where(g => g.StudentId == studentId);
            }
            if (classId.GetValueOrDefault() != 0)
            {
                var studentsList = _context.Students.Where(s => s.ClassId == classId).Select(s => s.Id).ToList();
                query = query.Where(g => studentsList.Contains(g.StudentId));
            }
            if (subjectId.GetValueOrDefault() != 0)
            {
                query = query.Where(g => g.SubjectId == subjectId);
            }

            ViewData["Classes"] = await _context.Students.Select(s => s.Class).Distinct().OrderBy(c => c.Year).ToListAsync();


            var allStudents = await _context.Students.Include(s => s.Parent).ToListAsync();
            ViewData["Students"] = allStudents;

            var students = await _context.Students.ToListAsync();
            students.Insert(0,new Student());
            ViewBag.StudentId = new SelectList(students, "Id", "FullName");

            var classes = await _context.Classes.ToListAsync();
            var c = new Class();
            c.Year = ""; c.Letter = ' ';
            classes.Insert(0, c);
            ViewBag.ClassId = new SelectList(classes, "Id", "ClassName");

            var subjects = await _context.Subjects.ToListAsync();
            subjects.Insert(0, new Subject());
            ViewBag.SubjectId = new SelectList(subjects, "Id", "Name");

            ViewBag.Classes = await _context.Classes.ToListAsync();

            return View(query.ToList());
        }


        // GET: Grade/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var grade = await _context.Grades
                .Include(g => g.Student)
                .Include(g => g.Subject)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (grade == null)
            {
                return NotFound();
            }

            return View(grade);
        }

        // GET: Grade/Create
        public IActionResult Create(int? classId)
        {
            // TODO
            // add class selection and student list is updated with ppl from that class
            // select only those subjects which are assigned to that class
            if (classId == null)
            {
                return NotFound();
            }
            
            ViewData["StudentId"] = new SelectList(_context.Students.Where(s => s.ClassId == classId),"Id", "FullName");
            
            ViewData["SubjectId"] = new SelectList(_context.ClassSubjects.Where(cs => cs.ClassId == classId).Include(cs => cs.Subject), "Subject.Id", "Subject.Name");
            return View();
        }

        // POST: Grade/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Value,Type,Date,StudentId,SubjectId")] Grade grade)
        {
            var today = DateOnly.FromDateTime(DateTime.Now);
            if (!(grade.Date >= today.AddYears(-1) && grade.Date <= today))
            {
                ViewData["StudentId"] = new SelectList(_context.Students, "Id", "FullName", grade.StudentId);
                ViewData["SubjectId"] = new SelectList(_context.Subjects, "Id", "Name", grade.SubjectId);
                ViewData["Date"] = grade.Date;
                return View(grade);
            }
            if (ModelState.IsValid)
            {
                _context.Add(grade);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["StudentId"] = new SelectList(_context.Students, "Id", "FullName", grade.StudentId);
            ViewData["SubjectId"] = new SelectList(_context.Subjects, "Id", "Name", grade.SubjectId);
            ViewData["Date"] = grade.Date;
            return View(grade);
        }

        // GET: Grade/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var grade = await _context.Grades.FindAsync(id);
            if (grade == null)
            {
                return NotFound();
            }
            ViewData["StudentId"] = new SelectList(_context.Students.Select(s => new SelectListItem
            {
                Value = s.Id.ToString(), // Assuming Id is the property representing the student's ID
                Text = $"{s.FullName} - {s.Class.ClassName}"
            }), "Value", "Text", grade.StudentId);
            ViewData["SubjectId"] = new SelectList(_context.Subjects, "Id", "Name", grade.SubjectId);
            return View(grade);
        }

        // POST: Grade/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Value,Type,StudentId,SubjectId")] Grade grade)
        {
            if (id != grade.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(grade);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!GradeExists(grade.Id))
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
            ViewData["StudentId"] = new SelectList(_context.Students, "Id", "Id", grade.StudentId);
            ViewData["SubjectId"] = new SelectList(_context.Subjects, "Id", "Id", grade.SubjectId);
            return View(grade);
        }

        // GET: Grade/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var grade = await _context.Grades
                .Include(g => g.Student)
                .Include(g => g.Subject)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (grade == null)
            {
                return NotFound();
            }

            return View(grade);
        }

        // POST: Grade/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var grade = await _context.Grades.FindAsync(id);
            if (grade != null)
            {
                _context.Grades.Remove(grade);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool GradeExists(int id)
        {
            return _context.Grades.Any(e => e.Id == id);
        }
    }
}
