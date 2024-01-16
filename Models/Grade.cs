using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace VirtualGradingSys.Models
{
    public class Grade
    {
        // fields
        public int Id { get; set; }
        [Range(1, 6, ErrorMessage = "Value must be between 1 and 6")]
        public int Value { get; set; }
        [RegularExpression("^(Exam|Quiz|Activity)$", ErrorMessage = "Invalid value. Allowed values are 'exam', 'quiz', or 'activity'.")]
        public string Type { get; set; }
        public DateOnly Date { get; set; }
        [ForeignKey("Student")]
        public int StudentId { get; set; }
        [ForeignKey("Subject")]
        public int SubjectId { get; set; }

        // EF relations
        public virtual Student? Student { get; set; }
        public virtual Subject? Subject { get; set; }
    }
}
