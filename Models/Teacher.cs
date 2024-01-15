using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VirtualGradingSys.Models
{
    public class Teacher
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName => $"{FirstName} {LastName}";

        // EF relations
        public Class? Class { get; set; }
        public virtual ICollection<Subject>? Subject { get; set; }
    }
}