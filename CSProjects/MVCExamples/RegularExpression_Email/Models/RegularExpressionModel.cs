using System.ComponentModel.DataAnnotations;

namespace RegularExpression_Email.Models
{
    public class RegularExpressionModel
    {
        [Required(ErrorMessage = "Email is required")]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public string Email { get; set; }
    }
}
