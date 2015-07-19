using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using System.Collections;

using GateAccess.Models.DAL;

namespace GateAccess.Models
{
    public class UsersModel : CommunitiesModel
    {
        private static IEnumerable _hintQuestionsList = null;

        public UsersModel()
        {
            if (_hintQuestionsList == null) { _hintQuestionsList = GetHintQuestions(); }
        }

        public Int64 UserID { get; set; }

        [Required(ErrorMessage = " ")]
        [DataType(DataType.EmailAddress)]
        [RegularExpression(".+\\@.+\\..+", ErrorMessage = "Please enter a valid email address")]
        [Display(Name = "EmailID")]
        [StringLength(100)]
        public String EmailID { get; set; }

        [Required(ErrorMessage = " ")]
        [DataType(DataType.Password)]
        //[StringLength(20, ErrorMessage = "The {0} must be at least {2} characters Int64.", MinimumLength = 8)]        
        [StringLength(20, MinimumLength = 8, ErrorMessage = "Minimum Length = 8, Maximum Length = 20")]
        [Display(Name = "Password")]
        public String Password { get; set; }

        [Required(ErrorMessage = " ")]
        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [Compare("Password", ErrorMessage = "Passwords not matched.")]
        public String ConfirmPassword { get; set; }

        ///////////////////////////////secquestion DropDownList Validation Purpose//////////////////////////////////////////
        
        public Char UserStatus { get; set; }

        public Byte RoleID { get; set; }

        public String Role { get; set; }

        public String VFCode { get; set; }

        public IEnumerable HintQuestionsList { get { return _hintQuestionsList; } }

        private List<HintQuestionsModel> GetHintQuestions()
        {
            HintQuestionsDAL hintQuestionsDAL = new HintQuestionsDAL();
            return hintQuestionsDAL.HintQuestionsList();
        }
    }
}
