using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using GateAccess.Models;
using GateAccess.Models.Helper;
using System.Collections;
using GateAccess.Models.DAL;

namespace GateAccess.Models.MVVM
{
    public class EditAdministratorModel 
    {
        private static IEnumerable _hintQuestionsList = null;

        public EditAdministratorModel()
        {
            if (_hintQuestionsList == null) { _hintQuestionsList = GetHintQuestions(); }
        }

        public Int64 AdministratorID { get; set; }

        
        [Required(ErrorMessage = " ")]
        [DataType(DataType.EmailAddress)]
        [RegularExpression(".+\\@.+\\..+", ErrorMessage = "Please enter a valid email address")]
        [Display(Name = "EmailID")]
        [StringLength(100)]
        public String EmailID { get; set; }

        [Display(Name = "Current Password")]
        public String CurrentPassword { get; set; }
        
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

        [Required(ErrorMessage = " ")]
        [StringLength(50)]
        [Display(Name = "FirstName")]
        public String Admin_FirstName { get; set; }

        //[Required(ErrorMessage = " " )]
        [StringLength(50)]
        [Display(Name = "MiddleName")]
        public String Admin_MiddleName { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "LastName")]
        [StringLength(50)]
        public String Admin_LastName { get; set; }

        //[Required(ErrorMessage = " " )]
        ////[DataType(DataType.Mobile)]
        //[Display(Name = "DOB")]
        ////  [StringLength(15)]
        //public String DOB { get; set; }

        //[Required(ErrorMessage = " " )]            
        //[Display(Name = "Gender")]
        ////  [StringLength(15)]
        //public String Gender { get; set; }


        [Required(ErrorMessage = " ")]
        [Display(Name = "Mobile")]
        [StringLength(15)]
        public String Admin_Mobile { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "HomePhone")]
        [StringLength(15)]
        public String Admin_HomePhone { get; set; }

        [Required(ErrorMessage = " ")]
        [DataType(DataType.PhoneNumber)]
        [Display(Name = "WorkPhone")]
        [StringLength(15)]
        public String Admin_WorkPhone { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "Address1")]
        public String Admin_Address1 { get; set; }

        //[Required(ErrorMessage = " " )]
        [Display(Name = "Address2")]
        public String Admin_Address2 { get; set; }

        [Display(Name = "HintQuestion")]
        public String Admin_HintQuestion { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "HintQuestion")]
        public Byte Admin_HintQuestionID { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "Hint")]
        public String Admin_Hint { get; set; }

        public IEnumerable HintQuestionsList { get { return _hintQuestionsList; } }

        private List<HintQuestionsModel> GetHintQuestions()
        {
            HintQuestionsDAL hintQuestionsDAL = new HintQuestionsDAL();
            return hintQuestionsDAL.HintQuestionsList();
        }

        public Int16 CommunityID { get; set; }

        public DateTime Admin_ModifiedOn { get; set; }

        public Byte Admin_ModifiedRoleID { get; set; }

        public Int64 Admin_ModifiedUserID { get; set; }
    }
}