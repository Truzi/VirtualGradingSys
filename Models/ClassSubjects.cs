using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VirtualGradingSystem.Models
{
    public class ClassSubjects
    {
        // fields
        public int Id { get; set; }
        public int SubjectId { get; set; }
        public int ClassId { get; set; }

        // EF relations
        public virtual Subject? Subject { get; set; }
        public virtual Class? Class { get; set; }
    }
}