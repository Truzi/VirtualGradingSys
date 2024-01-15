using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace VirtualGradingSys.Models
{
    public class ClassSubjects
    {
        // fields
        public int Id { get; set; }
        [ForeignKey("Subject")]
        public int SubjectId { get; set; }
        [ForeignKey("Class")]
        public int ClassId { get; set; }

        // EF relations
        public virtual Subject? Subject { get; set; }
        public virtual Class? Class { get; set; }
    }
}