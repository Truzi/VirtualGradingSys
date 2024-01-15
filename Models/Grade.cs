using System.ComponentModel.DataAnnotations.Schema;

namespace VirtualGradingSys.Models
{
    public class Grade
    {
        // fields
        public int Id { get; set; }
        public int Value { get; set; }
        public string Type { get; set; } // add logic to controller to check for one of those: test, quiz, activity
        [ForeignKey("Student")]
        public int StudentId { get; set; }
        [ForeignKey("Subject")]
        public int SubjectId { get; set; }

        // EF relations
        public virtual Student? Student { get; set; }
        public virtual Subject? Subject { get; set; }
    }
}
