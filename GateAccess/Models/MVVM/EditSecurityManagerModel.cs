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
    public class EditSecurityManagerModel
    {
        private static IEnumerable _hintQuestionsList = null;

        public EditSecurityManagerModel()
        {
            if (_hintQuestionsList == null) { _hintQuestionsList = GetHintQuestions(); }
        }

        public Int64 SecurityManagerID { get; set; }

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
        [StringLength(50,ErrorMessage="Not More than 50")]
        [Display(Name = "FirstName")]
        public String SM_FirstName { get; set; }

        //[Required(ErrorMessage = " ")]
         [StringLength(50, ErrorMessage = "Not More than 50")]
        [Display(Name = "MiddleName")]
        public String SM_MiddleName { get; set; }

        [Required(ErrorMessage = " ")]
        [StringLength(50, ErrorMessage = "Not More than 50")]
        [Display(Name = "lastName")]
        public String SM_LastName { get; set; }

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
        //[DataType(DataType.Mobile)]
        [Display(Name = "Mobile")]
        [StringLength(15, ErrorMessage = "Not More than 15")]
        public String SM_Mobile { get; set; }

        [Required(ErrorMessage = " ")]      
        [Display(Name = "HomePhone")]
        [StringLength(15, ErrorMessage = "Not More than 15")]
        public String SM_HomePhone { get; set; }

        //[Required(ErrorMessage = " ")]
        //[DataType(DataType.WorkPhone)]
        [Display(Name = "WorkPhone")]
        [StringLength(15, ErrorMessage = "Not More than 15")]
        public String SM_WorkPhone { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "Address1")]
        [StringLength(100, ErrorMessage = "Not More than 100")]
        public String SM_Address1 { get; set; }

        [Display(Name = "Address2")]
        [StringLength(100, ErrorMessage = "Not More than 100")]
        public String SM_Address2 { get; set; }

        public IEnumerable HintQuestionsList { get { return _hintQuestionsList; } }

        private List<HintQuestionsModel> GetHintQuestions()
        {
            HintQuestionsDAL hintQuestionsDAL = new HintQuestionsDAL();
            return hintQuestionsDAL.HintQuestionsList();
        }

        public Int16 CommunityID { get; set; }

        public Byte SM_ModifiedRoleID { get; set; }

        public Int64 SM_ModifiedUserID { get; set; }     

        public DateTime SM_ModifiedOn { get; set; }

        [Display(Name = "HintQuestion")]
        public String SM_HintQuestion { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "HintQuestion")]
        public Byte SM_HintQuestionID { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "Hint")]
        public String SM_Hint { get; set; }
    }
}
