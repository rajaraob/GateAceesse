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
    public class ServiceProvidersModel : UsersModel
    {
        public Int64 ServiceProviderID { get; set; }

        [Required(ErrorMessage = " ")]
        //   [StringLength(50)]ss
        public String SRP_Name { get; set; }

        //[Required(ErrorMessage = " ")]
        // [StringLength(50)]
        public String SRP_ServiceTypes { get; set; }

        [Required(ErrorMessage = " ")]
        //[StringLength(50)]
        public String SRP_ContactPerson { get; set; }


        [Required(ErrorMessage = " ")]
        //[DataType(DataType.Mobile)]
        [Display(Name = "Address")]
        //  [StringLength(15)]
        public String SRP_Address { get; set; }

        [Required(ErrorMessage = " ")]
        //[DataType(DataType.HomePhone)]
        [Display(Name = "Phone1")]
        // [StringLength(15)]
        public String SRP_Phone1 { get; set; }

        //[Required(ErrorMessage = " ")]
        //[DataType(DataType.WorkPhone)]
        [Display(Name = "Phone2")]
        // [StringLength(15)]
        public String SRP_Phone2 { get; set; }

        public String SRP_Rating { get; set; }

        public String SRP_ReferredBy { get; set; }

        public String SRP_Specialization { get; set; }

        public Byte SRP_CreatedRoleID { get; set; }

        public Int64 SRP_CreatedUserID { get; set; }

        public Byte SRP_ModifiedRoleID { get; set; }

        public Int64 SRP_ModifiedUserID { get; set; }

        public DateTime SRP_CreatedOn { get; set; }

        public DateTime SRP_ModifiedOn { get; set; }

        [Display(Name = "HintQuestion")]
        public String SRP_HintQuestion { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "HintQuestion")]
        public Byte SRP_HintQuestionID { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "Hint")]
        public String SRP_Hint { get; set; }
    }
}
