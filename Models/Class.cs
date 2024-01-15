using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace VirtualGradingSys.Models
{
    public class Class
    {
        // fields
        public int Id { get; set; }
        public string Year { get; set; }
        public char Letter { get; set; }
        [ForeignKey("Teacher")]
        public int TeacherId { get; set; }
        public string ClassName => $"{Year} {Letter}";

        // EF relations
        public Teacher? Teacher { get; set; }
        public virtual ICollection<Student>? Students { get; set; }
        public virtual ICollection<ClassSubjects>? ClassSubjects { get; set; }
    }
}
