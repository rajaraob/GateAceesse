using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using GateAccess.Models;
using GateAccess.Models.Helper;

namespace GateAccess.Models
{
    public class SecurityPersonnelsModel : UsersModel
    {
        public Int64 SecurityPersonnelID { get; set; }

        [Required(ErrorMessage = " ")]
        [StringLength(50)]
        [Display(Name="FirstName")]
        public String SP_FirstName { get; set; }

        //[Required(ErrorMessage = " ")]
        [StringLength(50)]
        [Display(Name="MiddleName")]
        public String SP_MiddleName { get; set; }

        [Required(ErrorMessage = " ")]
        [StringLength(50)]
        [Display(Name="LastName")]
        public String SP_LastName { get; set; }

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
        [StringLength(15)]
        public String SP_Mobile { get; set; }

        [Required(ErrorMessage = " ")]
        //[DataType(DataType.HomePhone)]
        [Display(Name = "HomePhone")]
        [StringLength(15)]
        public String SP_HomePhone { get; set; }

        //[Required(ErrorMessage = " ")]
        //[DataType(DataType.WorkPhone)]
        [Display(Name = "WorkPhone")]
        [StringLength(15)]
        public String SP_WorkPhone { get; set; }

        [Required(ErrorMessage = " ")]
        [StringLength(200)]
        [Display(Name = "Address1")]
        public String SP_Address1 { get; set; }

        //[Required(ErrorMessage = " ")]
        [StringLength(200)]
        [Display(Name = "Address2")]
        public String SP_Address2 { get; set; }

        public Byte SP_CreatedRoleID { get; set; }

        public Int64 SP_CreatedUserID { get; set; }

        public Byte SP_ModifiedRoleID { get; set; }

        public Int64 SP_ModifiedUserID { get; set; }

        public DateTime SP_CreatedOn { get; set; }

        public DateTime SP_ModifiedOn { get; set; }

        [Display(Name = "HintQuestion")]
        public String SP_HintQuestion { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "HintQuestion")]
        public Byte SP_HintQuestionID { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "Hint")]
        public String SP_Hint { get; set; }
    }
}