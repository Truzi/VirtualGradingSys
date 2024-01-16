﻿using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace VirtualGradingSys.Models
{
    public class Student
    {
        // fields
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        [ForeignKey("Class")]
        public int ClassId { get; set; }
        [ForeignKey("Parent")]
        public int ParentId { get; set; }
        public string FullName => $"{FirstName} {LastName}";

        // EF relations
        public Class? Class { get; set; }
        public Parent? Parent { get; set; }
        public virtual ICollection<Grade>? Grades { get; set; }
    }
}
