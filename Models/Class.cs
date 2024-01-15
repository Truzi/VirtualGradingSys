using System.Collections.Generic;

namespace VirtualGradingSystem.Models
{
    public class Class
    {
        // fields
        public int Id { get; set; }
        public string Year { get; set; }
        public char Letter { get; set; }
        public int HomeroomTeacherId { get; set; }
        public string ClassName => $"{Year} {Letter}";

        // EF relations
        public virtual Teacher? Teacher { get; set; }
        public virtual ICollection<Student>? Students { get; set; }
        public virtual ICollection<ClassSubjects>? ClassSubjects { get; set; }   
    }
}
