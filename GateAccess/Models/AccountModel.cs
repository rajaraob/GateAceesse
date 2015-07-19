using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Mvc;
using System.Web.Security;
using System.ComponentModel;

namespace GateAccess.Models
{
    public class AccountModel
    {
        [Required(ErrorMessage = " " )]
        [Display(Name = "EMAIL ADDRESS")]
        [RegularExpression(".+\\@.+\\..+", ErrorMessage = "Enter valid email address")]
        public String UserName { get; set; }

        [Required(ErrorMessage = " " )]
        [DataType(DataType.Password)]
        [Display(Name = "PASSWORD")]
        [StringLength(20, MinimumLength = 8, ErrorMessage = "Minimum length = 8, Maximum Length = 20")]
        public String Password { get; set; }

        //[Display(Name = "Stay Signed in")]
        //public bool RememberMe { get; set; }
    }

    public class ChangePasswordModel
    {
        [Required(ErrorMessage = " " )]
        [DataType(DataType.Password)]
        [Display(Name = "Current password")]
        public String OldPassword { get; set; }

        [Required(ErrorMessage = " " )]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "New password")]
        public String NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm new password")]
        [Compare("NewPassword", ErrorMessage = "The new password and confirmation password do not match.")]
        public String ConfirmPassword { get; set; }
    }

    public class ForgotPasswordModel
    {
        [Required(ErrorMessage = " " )]
        [Display(Name = "Username")]
        [RegularExpression(".+\\@.+\\..+", ErrorMessage = "Enter valid email address")]
        public String UserName { get; set; }
    }
}