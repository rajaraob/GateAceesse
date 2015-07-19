using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

using GateAccess.Models.Helper;
using GateAccess.Models.DAL;

namespace GateAccess.Models.Security
{
    public class GateAccessRoleProvider : RoleProvider
    {

        public override void AddUsersToRoles(String[] usernames, String[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override String ApplicationName
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public override void CreateRole(String roleName)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteRole(String roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override String[] FindUsersInRole(String roleName, String usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override String[] GetAllRoles()
        {
            throw new NotImplementedException();
        }

        public override String[] GetRolesForUser(String username)
        {
            throw new NotImplementedException();
        }

        public override String[] GetUsersInRole(String roleName)
        {
            throw new NotImplementedException();
        }

        public override bool IsUserInRole(String username, String roleName)
        {
            throw new NotImplementedException();
        }

        public override void RemoveUsersFromRoles(String[] usernames, String[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(String roleName)
        {
            throw new NotImplementedException();
        }
    }
}