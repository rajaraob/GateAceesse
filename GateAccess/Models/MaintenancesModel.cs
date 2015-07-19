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
    public class MaintenancesModel
    {
        public Int64 MaintenanceID { get; set; }

        public Int16 CommunityID { get; set; }

        [Required(ErrorMessage = " " )]
        [Display(Name = "Maintenance")]
        [StringLength(100)]        
        public String Request { get; set; }

        [Required(ErrorMessage = " " )]
        [Display(Name = "Full Text")]        
        [StringLength(300)]
        public String FullText { get; set; }

        [Required(ErrorMessage = " " )]
        [Display(Name = "Contact #")]
        [StringLength(15)]
        public String Contact { get; set; }

        [Required(ErrorMessage = " " )]
        [RegularExpression(".+\\@.+\\..+", ErrorMessage = "Please enter a valid email address")]       
        [DataType(DataType.EmailAddress)]
        [StringLength(50)]
        [Display(Name = "Email ID")]
        public String EmailID { get; set; }

        public Byte CreatedRoleID { get; set; }

        public Int64 CreatedUserID { get; set; }

        public Byte ModifiedRoleID { get; set; }

        public Int64 ModifiedUserID { get; set; }

        public DateTime CreatedOn { get; set; }

        public DateTime ModifiedOn { get; set; }

        public Char Status { get; set; }
        
    }
}