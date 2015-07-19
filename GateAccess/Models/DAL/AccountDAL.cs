using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Net;

using GateAccess.Models;
using GateAccess.Models.Helper;
using System.Web.Security;

namespace GateAccess.Models.DAL
{
    public class AccountDAL : Dal
    {
        DataTable Dt_CommunityUsersByRole = null;
        List<CommunityUsersByRole> communityUsersByRoleList = null;
        

        //Check User Cridentils is vallid or not
        public DataTable CheckLoginCridentials(AccountModel account)
        {
            AddParameter("@username", account.UserName);
            AddParameter("@password", account.Password);
            AddParameter("@ipaddress", Utilities.GetIP());
            return this.GetDataTable("[usp_CheckLoginCridentials]");
        }


        public object LogOff(AccountModel account)
        {
            AddParameter("@username", account.UserName);
            return this.ExecuteScalar("[usp_LogOff]");
        }

        public object ForgotPassword(AccountModel account)
        {
            AddParameter("@username", account.UserName);
            return this.ExecuteScalar("[usp_ForgotPasswordRequest]");
        }

        internal DataTable UserNameCheck(AccountModel model)
        {
            AddParameter("@username", model.UserName);
            return this.GetDataTable("[usp_UserNameCheck]");
        }

        internal object ForgotPasswordRequest(String emailID, String vfcode)
        {
            AddParameter("@username", emailID);
            AddParameter("@vfcode", vfcode);
            return this.ExecuteScalar("[usp_ForgotPasswordRequest]");
        }

        internal List<CommunityUsersByRole> GetCommunityUsersByRole(CommunityUsersByRole communityUsersByRole)
        {
            AddParameter("@communityid", communityUsersByRole.CommunityID);
            Dt_CommunityUsersByRole = this.GetDataTable("[usp_GetCommunityUsersByRole]");
            
            if (Dt_CommunityUsersByRole.Rows.Count > 0)
            {                
                communityUsersByRoleList = new List<CommunityUsersByRole>();
                foreach (DataRow dr in Dt_CommunityUsersByRole.Rows)
                {
                    communityUsersByRole = new CommunityUsersByRole();                    
                    communityUsersByRole.RoleID = Convert.ToByte(dr["RoleID"].ToString());
                    communityUsersByRole.UsersCount = Convert.ToInt64(dr["UsersCount"].ToString());
                    communityUsersByRoleList.Add(communityUsersByRole);
                }
            }
            return communityUsersByRoleList;
        }


        //#region membershipprovider

        //public String ApplicationName
        //{
        //    get
        //    {
        //        throw new NotImplementedException();
        //    }
        //    set
        //    {
        //        throw new NotImplementedException();
        //    }
        //}

        //public bool ChangePassword(String username, String oldPassword, String newPassword)
        //{
        //    throw new NotImplementedException();
        //}

        //public bool ChangePasswordQuestionAndAnswer(String username, String password, String newPasswordQuestion, String newPasswordAnswer)
        //{
        //    throw new NotImplementedException();
        //}

        //public MembershipUser CreateUser(String username, String password, String email, String passwordQuestion, String passwordAnswer, bool isApproved, object providerUserKey, out MembershipCreateStatus status)
        //{
        //    throw new NotImplementedException();
        //}

        //public bool DeleteUser(String username, bool deleteAllRelatedData)
        //{
        //    throw new NotImplementedException();
        //}

        //public bool EnablePasswordReset
        //{
        //    get { throw new NotImplementedException(); }
        //}

        //public bool EnablePasswordRetrieval
        //{
        //    get { throw new NotImplementedException(); }
        //}

        //public MembershipUserCollection FindUsersByEmail(String emailToMatch, int pageIndex, int pageSize, out int totalRecords)
        //{
        //    throw new NotImplementedException();
        //}

        //public MembershipUserCollection FindUsersByName(String usernameToMatch, int pageIndex, int pageSize, out int totalRecords)
        //{
        //    throw new NotImplementedException();
        //}

        //public MembershipUserCollection GetAllUsers(int pageIndex, int pageSize, out int totalRecords)
        //{
        //    throw new NotImplementedException();
        //}

        //public int GetNumberOfUsersOnline()
        //{
        //    throw new NotImplementedException();
        //}

        //public String GetPassword(String username, String answer)
        //{
        //    throw new NotImplementedException();
        //}

        //public MembershipUser GetUser(String username, bool userIsOnline)
        //{
        //    throw new NotImplementedException();
        //}

        //public MembershipUser GetUser(object providerUserKey, bool userIsOnline)
        //{
        //    throw new NotImplementedException();
        //}

        //public String GetUserNameByEmail(String email)
        //{
        //    throw new NotImplementedException();
        //}

        //public int MaxInvalidPasswordAttempts
        //{
        //    get { throw new NotImplementedException(); }
        //}

        //public int MinRequiredNonAlphanumericCharacters
        //{
        //    get { throw new NotImplementedException(); }
        //}

        //public int MinRequiredPasswordLength
        //{
        //    get { throw new NotImplementedException(); }
        //}

        //public int PasswordAttemptWindow
        //{
        //    get { throw new NotImplementedException(); }
        //}

        //public MembershipPasswordFormat PasswordFormat
        //{
        //    get { throw new NotImplementedException(); }
        //}

        //public String PasswordStrengthRegularExpression
        //{
        //    get { throw new NotImplementedException(); }
        //}

        //public bool RequiresQuestionAndAnswer
        //{
        //    get { throw new NotImplementedException(); }
        //}

        //public bool RequiresUniqueEmail
        //{
        //    get { throw new NotImplementedException(); }
        //}

        //public String ResetPassword(String username, String answer)
        //{
        //    throw new NotImplementedException();
        //}

        //public bool UnlockUser(String userName)
        //{
        //    throw new NotImplementedException();
        //}

        //public void UpdateUser(MembershipUser user)
        //{
        //    throw new NotImplementedException();
        //}

        //public bool ValidateUser(String username, String password)
        //{
        //    throw new NotImplementedException();
        //}


        //#endregion
    }
}