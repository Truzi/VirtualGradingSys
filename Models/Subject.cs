using System.Collections.Generic;

namespace VirtualGradingSystem.Models
{
    public class Subject
    {
        // fields
        public int Id { get; set; }
        public string Name { get; set; }
        public int TeacherId { get; set; }

        // EF relations
        public virtual Teacher? Teacher { get; set; }
        public virtual ICollection<Grade>? Grades { get; set; }
        public virtual ICollection<ClassSubjects>? ClassSubjects { get; set; }
    }
}
