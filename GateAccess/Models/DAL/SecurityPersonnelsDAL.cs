using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GateAccess.Models;
using GateAccess.Models.Helper;
using System.Data;
using GateAccess.Models.MVVM;

namespace GateAccess.Models.DAL
{
    public class SecurityPersonnelsDAL : Dal
    {
        private SecurityPersonnelsModel securityPersonnelDetails, securityPersonnelObj;
        private List<SecurityPersonnelsModel> securityPersonnelsList;

        internal Object AddSecurityPersonnel(SecurityPersonnelsModel securitypersonnel)
        {            
            AddParameter("@communityid", securitypersonnel.CommunityID);
            AddParameter("@username", securitypersonnel.EmailID);
            AddParameter("@password", securitypersonnel.Password);
            AddParameter("@hintquestionid", securitypersonnel.SP_HintQuestionID);
            AddParameter("@hint", securitypersonnel.SP_Hint);

            AddParameter("@firstname", securitypersonnel.SP_FirstName);
            AddParameter("@middlename", securitypersonnel.SP_MiddleName);
            AddParameter("@lastname", securitypersonnel.SP_LastName);
            AddParameter("@mobile", securitypersonnel.SP_Mobile);
            AddParameter("@homephone", securitypersonnel.SP_HomePhone);
            AddParameter("@workphone", securitypersonnel.SP_WorkPhone);
            AddParameter("@address1", securitypersonnel.SP_Address1);
            AddParameter("@address2", securitypersonnel.SP_Address2);

            AddParameter("@createdon", securitypersonnel.SP_CreatedOn);          
            AddParameter("@createduserid", securitypersonnel.SP_CreatedUserID);
            AddParameter("@createdroleid", securitypersonnel.SP_CreatedRoleID);

            return this.ExecuteScalar("usp_AddSecurityPersonnel");
        }

        public List<SecurityPersonnelsModel> SecurityPersonnelsList(SecurityPersonnelsModel securitypersonnel)
        {
            AddParameter("@communityid", securitypersonnel.CommunityID);

            DataTable Dt_SecurityPersonnelsList = GetDataTable("usp_GetSecurityPersonnelsList");
            securityPersonnelsList = new List<SecurityPersonnelsModel>();
            if (Dt_SecurityPersonnelsList.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_SecurityPersonnelsList.Rows)
                {
                    securityPersonnelObj = new SecurityPersonnelsModel();
                    
                    securityPersonnelObj.SecurityPersonnelID = Convert.ToInt64(dr["SecurityPersonnelID"].ToString());

                    securityPersonnelObj.CommunityID = Convert.ToInt16(dr["CommunityID"].ToString());
                    securityPersonnelObj.CommunityName = dr["CommunityName"].ToString();
                    securityPersonnelObj.CommunityAddress = dr["CommunityAddress"].ToString();
                    securityPersonnelObj.City = dr["City"].ToString();
                    securityPersonnelObj.Zip = dr["Zip"].ToString();
                    securityPersonnelObj.State = dr["State"].ToString();
                    securityPersonnelObj.Country = dr["Country"].ToString();
                    securityPersonnelObj.CommunityPhone1 = dr["CommunityPhone1"].ToString();
                    securityPersonnelObj.CommunityPhone2 = dr["CommunityPhone2"].ToString();
                    securityPersonnelObj.CommunityEmail = dr["CommunityEmail"].ToString();
                    securityPersonnelObj.TotalUnits = Convert.ToByte(dr["TotalUnits"].ToString());
                    securityPersonnelObj.MaxGates = Convert.ToByte(dr["MaxGates"].ToString());
                    securityPersonnelObj.MenuOptions = dr["MenuOptions"].ToString();

                    securityPersonnelObj.EmailID = dr["UserName"].ToString();
                    securityPersonnelObj.SP_HintQuestionID = Convert.ToByte(dr["HintQuestionID"].ToString());
                    securityPersonnelObj.SP_HintQuestion = dr["HintQuestion"].ToString();
                    securityPersonnelObj.SP_Hint = dr["Hint"].ToString();
                    securityPersonnelObj.VFCode = dr["VFCode"].ToString();
                    securityPersonnelObj.UserStatus = Convert.ToChar(dr["Status"]);
                    securityPersonnelObj.UserID = Convert.ToInt64(dr["UserID"].ToString());
                    securityPersonnelObj.Password = dr["Password"].ToString();
                    securityPersonnelObj.RoleID = Convert.ToByte(dr["RoleID"].ToString());
                    securityPersonnelObj.Role = dr["Role"].ToString();

                    securityPersonnelObj.SP_FirstName = dr["FirstName"].ToString();
                    securityPersonnelObj.SP_MiddleName = dr["MiddleName"].ToString();
                    securityPersonnelObj.SP_LastName = dr["LastName"].ToString();
                    securityPersonnelObj.SP_Mobile = dr["Mobile"].ToString();
                    securityPersonnelObj.SP_HomePhone = dr["HomePhone"].ToString();
                    securityPersonnelObj.SP_WorkPhone = dr["WorkPhone"].ToString();
                    securityPersonnelObj.SP_Address1 = dr["Address1"].ToString();
                    securityPersonnelObj.SP_Address2 = dr["Address2"].ToString();                 

                    securityPersonnelObj.SP_CreatedOn = Convert.ToDateTime(dr["CreatedOn"].ToString());
                    securityPersonnelObj.SP_CreatedUserID = Convert.ToInt64(dr["CreatedUserID"].ToString());
                    securityPersonnelObj.SP_CreatedRoleID = Convert.ToByte(dr["CreatedRoleID"].ToString());
                   
                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))
                    {
                        securityPersonnelObj.SP_ModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());
                        securityPersonnelObj.SP_ModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        securityPersonnelObj.SP_ModifiedRoleID = Convert.ToByte(dr["ModifiedRoleID"].ToString());
                    }

                    securityPersonnelsList.Add(securityPersonnelObj);
                }
            }
            return securityPersonnelsList;
        }

        internal SecurityPersonnelsModel SecurityPersonnelDetails(SecurityPersonnelsModel securitypersonnel)
        {            
            AddParameter("@securitypersonnelid", securitypersonnel.SecurityPersonnelID);
            AddParameter("@communityid", securitypersonnel.CommunityID);

            DataTable Dt_SecurityPersonnelDetails = this.GetDataTable("usp_GetSecurityPersonnelDetails");

            if (Dt_SecurityPersonnelDetails.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_SecurityPersonnelDetails.Rows)
                {
                    securityPersonnelDetails = new SecurityPersonnelsModel();
                    
                    securityPersonnelDetails.SecurityPersonnelID = Convert.ToInt64(dr["SecurityPersonnelID"].ToString());
                    
                    securityPersonnelDetails.CommunityID = Convert.ToInt16(dr["CommunityID"].ToString());
                    securityPersonnelDetails.CommunityName = dr["CommunityName"].ToString();
                    securityPersonnelDetails.CommunityAddress = dr["CommunityAddress"].ToString();
                    securityPersonnelDetails.City = dr["City"].ToString();
                    securityPersonnelDetails.Zip = dr["Zip"].ToString();
                    securityPersonnelDetails.State = dr["State"].ToString();
                    securityPersonnelDetails.Country = dr["Country"].ToString();
                    securityPersonnelDetails.CommunityPhone1 = dr["CommunityPhone1"].ToString();
                    securityPersonnelDetails.CommunityPhone2 = dr["CommunityPhone2"].ToString();
                    securityPersonnelDetails.CommunityEmail = dr["CommunityEmail"].ToString();
                    securityPersonnelDetails.TotalUnits = Convert.ToByte(dr["TotalUnits"].ToString());
                    securityPersonnelDetails.MaxGates = Convert.ToByte(dr["MaxGates"].ToString());
                    securityPersonnelDetails.MenuOptions = dr["MenuOptions"].ToString();

                    securityPersonnelDetails.EmailID = dr["UserName"].ToString();
                    securityPersonnelDetails.SP_HintQuestionID = Convert.ToByte(dr["HintQuestionID"].ToString());
                    securityPersonnelDetails.SP_HintQuestion = dr["HintQuestion"].ToString();
                    securityPersonnelDetails.SP_Hint = dr["Hint"].ToString();
                    securityPersonnelDetails.VFCode = dr["VFCode"].ToString();
                    securityPersonnelDetails.UserStatus = Convert.ToChar(dr["Status"]);
                    securityPersonnelDetails.UserID = Convert.ToInt64(dr["UserID"].ToString());
                    securityPersonnelDetails.Password = dr["Password"].ToString();
                    securityPersonnelDetails.RoleID = Convert.ToByte(dr["RoleID"].ToString());
                    securityPersonnelDetails.Role = dr["Role"].ToString();
                   
                    securityPersonnelDetails.SP_FirstName = dr["FirstName"].ToString();
                    securityPersonnelDetails.SP_MiddleName = dr["MiddleName"].ToString();
                    securityPersonnelDetails.SP_LastName = dr["LastName"].ToString();
                    securityPersonnelDetails.SP_Mobile = dr["Mobile"].ToString();
                    securityPersonnelDetails.SP_HomePhone = dr["HomePhone"].ToString();
                    securityPersonnelDetails.SP_WorkPhone = dr["WorkPhone"].ToString();
                    securityPersonnelDetails.SP_Address1 = dr["Address1"].ToString();
                    securityPersonnelDetails.SP_Address2 = dr["Address2"].ToString();

                    securityPersonnelDetails.SP_CreatedOn = Convert.ToDateTime(dr["CreatedOn"].ToString());
                    securityPersonnelDetails.SP_CreatedUserID = Convert.ToInt64(dr["CreatedUserID"].ToString());
                    securityPersonnelDetails.SP_CreatedRoleID = Convert.ToByte(dr["CreatedRoleID"].ToString());
                    
                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))
                    {
                        securityPersonnelDetails.SP_ModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());
                        securityPersonnelDetails.SP_ModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        securityPersonnelDetails.SP_ModifiedRoleID = Convert.ToByte(dr["ModifiedRoleID"].ToString());
                    }
                }
            }
            return securityPersonnelDetails;
        }

        internal EditSecurityPersonnelModel EditSecurityPersonnel(EditSecurityPersonnelModel editsecuritypersonnel)
        {
            AddParameter("@securitypersonnelid", editsecuritypersonnel.SecurityPersonnelID);
            AddParameter("@communityid", editsecuritypersonnel.CommunityID);

            DataTable Dt_SecurityPersonnelDetails = this.GetDataTable("usp_GetSecurityPersonnelDetails");

            if (Dt_SecurityPersonnelDetails.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_SecurityPersonnelDetails.Rows)
                {
                    editsecuritypersonnel = new EditSecurityPersonnelModel();

                    editsecuritypersonnel.SecurityPersonnelID = Convert.ToInt64(dr["SecurityPersonnelID"].ToString());

                    editsecuritypersonnel.CommunityID = Convert.ToInt16(dr["CommunityID"].ToString());

                    editsecuritypersonnel.EmailID = dr["UserName"].ToString();
                    editsecuritypersonnel.SP_HintQuestionID = Convert.ToByte(dr["HintQuestionID"].ToString());
                    editsecuritypersonnel.SP_HintQuestion = dr["HintQuestion"].ToString();
                    editsecuritypersonnel.SP_Hint = dr["Hint"].ToString();
                    editsecuritypersonnel.CurrentPassword = dr["Password"].ToString();
                  
                    editsecuritypersonnel.SP_FirstName = dr["FirstName"].ToString();
                    editsecuritypersonnel.SP_MiddleName = dr["MiddleName"].ToString();
                    editsecuritypersonnel.SP_LastName = dr["LastName"].ToString();
                    editsecuritypersonnel.SP_Mobile = dr["Mobile"].ToString();
                    editsecuritypersonnel.SP_HomePhone = dr["HomePhone"].ToString();
                    editsecuritypersonnel.SP_WorkPhone = dr["WorkPhone"].ToString();
                    editsecuritypersonnel.SP_Address1 = dr["Address1"].ToString();
                    editsecuritypersonnel.SP_Address2 = dr["Address2"].ToString();

                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))
                    {
                        editsecuritypersonnel.SP_ModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());
                        editsecuritypersonnel.SP_ModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        editsecuritypersonnel.SP_ModifiedRoleID = Convert.ToByte(dr["ModifiedRoleID"].ToString());
                    }
                }
            }
            return editsecuritypersonnel;
        }

        internal Object UpdateSecurityPerson(EditSecurityPersonnelModel editsecuritypersonnel)
        {
            AddParameter("@securitypersonnelid", editsecuritypersonnel.SecurityPersonnelID);
            AddParameter("@communityid", editsecuritypersonnel.CommunityID);
            AddParameter("@password", editsecuritypersonnel.Password);
            AddParameter("@hintquestionid", editsecuritypersonnel.SP_HintQuestionID);
            AddParameter("@hint", editsecuritypersonnel.SP_Hint);
            
            AddParameter("@firstname", editsecuritypersonnel.SP_FirstName);
            AddParameter("@middlename", editsecuritypersonnel.SP_MiddleName);
            AddParameter("@lastname", editsecuritypersonnel.SP_LastName);
            AddParameter("@mobile", editsecuritypersonnel.SP_Mobile);
            AddParameter("@homephone", editsecuritypersonnel.SP_HomePhone);
            AddParameter("@workphone", editsecuritypersonnel.SP_WorkPhone);
            AddParameter("@address1", editsecuritypersonnel.SP_Address1);
            AddParameter("@address2", editsecuritypersonnel.SP_Address2);
            
            AddParameter("@modifieduserid", editsecuritypersonnel.SP_ModifiedUserID);
            AddParameter("@modifiedroleid", editsecuritypersonnel.SP_ModifiedRoleID);
            AddParameter("@modifiedon", editsecuritypersonnel.SP_ModifiedOn);

            return this.ExecuteScalar("usp_UpdateSecurityPersonnel");
        }        

        internal Object DeleteSecurityPersonnel(SecurityPersonnelsModel securitypersonnel)
        {
            AddParameter("@securitypersonnelid", securitypersonnel.SecurityPersonnelID);
            AddParameter("@communityid", securitypersonnel.CommunityID);

            AddParameter("@modifiedon", securitypersonnel.SP_ModifiedOn);
            AddParameter("@modifieduserid", securitypersonnel.SP_ModifiedUserID);
            AddParameter("@modifiedroleid", securitypersonnel.SP_ModifiedRoleID);

            return ExecuteScalar("usp_DeleteSecurityPersonnel");
        }

        internal static string DeleteSecurityPersonnels(List<SecurityPersonnelsModel> securitypersonnelslist)
        {
            throw new NotImplementedException();
        }

        internal void NewSecurityPersonnelCommunity(ref SecurityPersonnelsModel securitypersonnel)
        {
            CommunitiesModel community = new CommunitiesModel();
            CommunitiesModel communityDetails = new CommunitiesModel();

            community.CommunityID = securitypersonnel.CommunityID;
            CommunitiesDAL communitiesDAL = new CommunitiesDAL();
            communityDetails = communitiesDAL.CommunityDetails(community);

            securitypersonnel.CommunityName = communityDetails.CommunityName;
            securitypersonnel.CommunityAddress = communityDetails.CommunityAddress;
            securitypersonnel.City = communityDetails.City;
            securitypersonnel.Zip = communityDetails.Zip;
            securitypersonnel.State = communityDetails.State;
            securitypersonnel.Country = communityDetails.Country;  
        }
    }
}