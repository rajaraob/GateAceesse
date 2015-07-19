using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace GateAccess.Models
{
    public class CommunityUsersByRole
    {
       
        public Int16 CommunityID { get; set; }

        public Byte RoleID { get; set; }

        public Int64 UsersCount { get; set; }
        
      
    }
}
