using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace GateAccess.Models
{
    public class OpinionsModel
    {
        [Key]
        public Int64 OpinionID { get; set; }

        [Required]
        public Int64 CommunityID { get; set; }

        [Required]
        public String Opinion { get; set; }

        [Required]
        public DateTime StartDate { get; set; }

        
        public DateTime EndDate { get; set; }

        
        public Byte CreatedRoleID { get; set; }

        public Int64 CreatedUserID { get; set; }

        public Byte ModifiedRoleID { get; set; }

        public Int64 ModifiedUserID { get; set; }

        public DateTime CreatedOn { get; set; }

        public DateTime ModifiedOn { get; set; }

        public Char Status { get; set; }

    }
}