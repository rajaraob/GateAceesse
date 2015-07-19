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
    public class SecurityManagersModel : UsersModel
    {
        public Int64 SecurityManagerID { get; set; }
               

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

        public Byte SM_CreatedRoleID { get; set; }

        public Int64 SM_CreatedUserID { get; set; }

        public Byte SM_ModifiedRoleID { get; set; }

        public Int64 SM_ModifiedUserID { get; set; }

        public DateTime SM_CreatedOn { get; set; }

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
