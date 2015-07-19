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
    public class LostFoundsModel
    {

        public Int64 LostFoundID { get; set; }

        public Int16 CommunityID { get; set; }

        [Required(ErrorMessage = " " )]
        [Display(Name = "Lost What")]
        //   [StringLength(50)]
        public String LostWhat { get; set; }

        [Required(ErrorMessage = " " )]
        [Display(Name = "Lost When")]
        [DataType(DataType.Date)]
        //   [StringLength(50)]
        public String LostWhen { get; set; }

        [Required(ErrorMessage = " " )]
        [Display(Name = "Lost At")]     
        // [StringLength(50)]
        public String LostAt { get; set; }

        //[Required(ErrorMessage = " " )]
        [Display(Name = "Found What")]
        // [StringLength(50)]
        public String FoundWhat { get; set; }

        //[Required(ErrorMessage = " " )]
        [Display(Name = "Found When")]
        [DataType(DataType.Date)]
        // [StringLength(50)]
        public String FoundWhen { get; set; }

        //[Required(ErrorMessage = " " )]
        [Display(Name = "Found At")]
        // [StringLength(50)]
        public String FoundAt { get; set; }

        [Required(ErrorMessage = " " )]
        [Display(Name = "Description")]
        //[StringLength(50)]
        public String Description { get; set; }

        public Byte CreatedRoleID { get; set; }

        public Int64 CreatedUserID { get; set; }

        public Byte ModifiedRoleID { get; set; }

        public Int64 ModifiedUserID { get; set; }

        public DateTime CreatedOn { get; set; }

        public DateTime ModifiedOn { get; set; }

        public Char Status { get; set; }

      //public object CommunityID { get; set; }
    }
}