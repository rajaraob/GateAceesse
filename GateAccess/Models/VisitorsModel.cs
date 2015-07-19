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

    public class VisitorsModel
    {
        public Int64 VisitorID { get; set; }

        public Int16 CommunityID { get; set; }

        public Int64 HomeOwnerID { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "Visitor Name")]
        //   [StringLength(50)]
        public String VisitorName { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "Visitor Type")]
        //   [StringLength(50)]
        public String VisitorType { get; set; }
        
        public String VisitorTypeID { get; set; }


        [Required(ErrorMessage = " ")]
        [Display(Name = "Visiting Date")]
        [DataType(DataType.Date)]
        // [StringLength(50)]
        public String VisitingDate { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "Visitor Mobile No")]
        [DataType(DataType.Date)]
        // [StringLength(50)]
        public String MobileNo { get; set; }

        [Required(ErrorMessage = " ")]
        [RegularExpression(".+\\@.+\\..+", ErrorMessage = "Please enter a valid email address")]
        [Display(Name = "EMailID")]
        [DataType(DataType.EmailAddress)]
        // [StringLength(50)]
        public String EmailID { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "Visiting To")]
        //[StringLength(50)]
        public String VisitingTo { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "Comments")]
        //[StringLength(50)]
        public String Comments { get; set; }
        
        //[Required(ErrorMessage = " ")]        
        //[Display(Name = "Status*")]
        ////  [StringLength(15)]
        //public String Status { get; set; }


        public Byte CreatedRoleID { get; set; }

        public Int64 CreatedUserID { get; set; }

        public Byte ModifiedRoleID { get; set; }

        public Int64 ModifiedUserID { get; set; }

        public DateTime CreatedOn { get; set; }

        public DateTime ModifiedOn { get; set; }

        public Char Status { get; set; }
    }
}       