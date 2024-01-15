using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using VirtualGradingSystem.Models;

namespace VirtualGradingSys.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Class> Classes { get; set; }
        public DbSet<ClassSubjects> ClassSubjects { get; set; }
        public DbSet<Grade> Grades { get; set; }
        public DbSet<Parent> Parents { get; set; }
        public DbSet<Student> Students { get; set; }
        public DbSet<Subject> Subjects { get; set; }
        public DbSet<Teacher> Teachers { get; set; }
    }
}
