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
    public class NoticesModel
    {
        public Int64 NoticeID { get; set; }

        [Required(ErrorMessage = " " )]
        [Display(Name = "Notice")]
        [StringLength(700)]
        public String NoticeText { get; set; }

        public Int16 CommunityID { get; set; }

        public Byte CreatedRoleID { get; set; }

        public Int64 CreatedUserID { get; set; }

        public Byte ModifiedRoleID { get; set; }

        public Int64 ModifiedUserID { get; set; }

        public DateTime CreatedOn { get; set; }

        public DateTime ModifiedOn { get; set; }

        public Char Status { get; set; }
    }
}