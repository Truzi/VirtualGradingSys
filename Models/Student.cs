using System.Collections.Generic;

namespace VirtualGradingSystem.Models
{
    public class Student
    {
        // fields
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int ClassId { get; set; }
        public int ParentId { get; set; }
        public string FullName => $"{FirstName} {LastName}";

        // EF relations
        public Class? Class { get; set; }
        public Parent? Parent { get; set; }
        public virtual ICollection<Grade>? Grades { get; set; }
    }
}
