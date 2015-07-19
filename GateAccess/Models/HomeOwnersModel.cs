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
    public class HomeOwnersModel : UsersModel
    {
        public Int64 HomeOwnerID { get; set; }

        [Required(ErrorMessage = " ")]
        //   [StringLength(50)]ss
        [Display(Name="FirstName")]
        public String HO_FirstName { get; set; }

        //[Required(ErrorMessage = " ")]
        // [StringLength(50)]
        [Display(Name = "MiddleName")]
        public String HO_MiddleName { get; set; }

        [Required(ErrorMessage = " ")]
        //[StringLength(50)]
        [Display(Name = "LastName")]
        public String HO_LastName { get; set; }

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
        //  [StringLength(15)]
        public String HO_Mobile { get; set; }

        [Required(ErrorMessage = " ")]
        //[DataType(DataType.HomePhone)]
        [Display(Name = "HomePhone")]
        // [StringLength(15)]
        public String HO_HomePhone { get; set; }

        //[Required(ErrorMessage = " ")]
        //[DataType(DataType.WorkPhone)]
        [Display(Name = "WorkPhone")]
        // [StringLength(15)]
        public String HO_WorkPhone { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "Address1")]
        public String HO_Address1 { get; set; }

        //[Required(ErrorMessage = " ")]
        [Display(Name = "Address2")]
        public String HO_Address2 { get; set; }        

        //[Required(ErrorMessage = " ")]
        [Display(Name = "Directions")]
        public String HO_Directions { get; set; }

        public Int64 HO_CreatedUserID { get; set; }

        public Byte HO_CreatedRoleID { get; set; }

        public DateTime HO_CreatedOn { get; set; }

        public Int64 HO_ModifiedUserID { get; set; }

        public Byte HO_ModifiedRoleID { get; set; }

        public DateTime HO_ModifiedOn { get; set; }

        [Display(Name = "HintQuestion")]
        public String HO_HintQuestion { get; set; }


        [Required(ErrorMessage = " ")]
        [Display(Name = "HintQuestion")]
        public Byte HO_HintQuestionID { get; set; }


        [Required(ErrorMessage = " ")]
        [Display(Name = "Hint")]
        public String HO_Hint { get; set; }        
    }
}