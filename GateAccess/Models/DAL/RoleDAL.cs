using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GateAccess.Models.Helper;
using GateAccess.Models;
using System.Data;

namespace GateAccess.Models.DAL
{
    public class RoleDAL : Dal
    {
        String[] rolesList = null;
        String[] usersList = null;
        String userName = null;
        String roleName = null;
                
        public void AddUsersToRoles(String[] usernames, String[] roleNames)
        {
            throw new NotImplementedException();
        }

        public String ApplicationName
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

        public void CreateRole(String roleName)
        {
            throw new NotImplementedException();
        }

        public bool DeleteRole(String roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public String[] FindUsersInRole(String roleName, String usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public String[] GetAllRoles()
        {
            DataTable Dt_RolesList = this.GetDataTable("usp_GetRoles");
            if (Dt_RolesList.Rows.Count > 0)
            {                
                for (int i = 1; i < Dt_RolesList.Rows.Count; i++)
                {
                    roleName = Dt_RolesList.Rows[i]["Role"].ToString();
                    rolesList[i] = roleName;
                }
            }
            return rolesList;
        }

        public String[] GetRolesForUser(String username)
        {
            AddParameter("@username", username);
            DataTable Dt_RolesListForUser = this.GetDataTable("usp_GetRolesForUser");
            if (Dt_RolesListForUser.Rows.Count > 0)
            {
                for (int i = 1; i < Dt_RolesListForUser.Rows.Count; i++)
                {
                    roleName = Dt_RolesListForUser.Rows[i]["Role"].ToString();
                    rolesList[i] = roleName;
                }
            }
            return rolesList;
        }

        public String[] GetUsersInRole(String roleName)
        {
            AddParameter("@rolename", roleName);
            DataTable Dt_UsersListForRole = this.GetDataTable("usp_GetUsersInRole");
            if (Dt_UsersListForRole.Rows.Count > 0)
            {
                for (int i = 1; i < Dt_UsersListForRole.Rows.Count; i++)
                {
                    userName = Dt_UsersListForRole.Rows[i]["UserName"].ToString();
                    usersList[i] = userName;
                }
            }
            return usersList;
        }

        public bool IsUserInRole(String userName, String roleName)
        {
            AddParameter("@username", userName);
            AddParameter("@rolename", roleName);            
            return bool.Parse(this.ExecuteScalar("usp_IsUserInRole").ToString());
        }

        public void RemoveUsersFromRoles(String[] usernames, String[] roleNames)
        {
            throw new NotImplementedException();
        }

        public bool RoleExists(String roleName)
        {
            AddParameter("@rolename", roleName);
            return bool.Parse(this.ExecuteScalar("usp_RoleExists").ToString());
        }
    }
}