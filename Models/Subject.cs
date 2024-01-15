using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace VirtualGradingSys.Models
{
    public class Subject
    {
        // fields
        public int Id { get; set; }
        public string Name { get; set; }
        [ForeignKey("Teacher")]
        public int TeacherId { get; set; }

        // EF relations
        public virtual Teacher? Teacher { get; set; }
        public virtual ICollection<Grade>? Grades { get; set; }
        public virtual ICollection<ClassSubjects>? ClassSubjects { get; set; }
    }
}
