using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GateAccess.Models.Helper;
using GateAccess.Models;
using System.Data;
using GateAccess.Models.MVVM;

namespace GateAccess.Models.DAL
{
    public class SecurityManagersDAL:Dal
    {
        private SecurityManagersModel  securityManagerDetails, securityManagerObj;
        private EditSecurityManagerModel editSecurityManager;
        private List<SecurityManagersModel> securityManagersList;

        public object AddSecurityManager(SecurityManagersModel securitymanager)
        {
            AddParameter("@communityid", securitymanager.CommunityID); 
       
            AddParameter("@username", securitymanager.EmailID);
            AddParameter("@password", securitymanager.Password);
            AddParameter("@hintquestionid", securitymanager.SM_HintQuestionID);
            AddParameter("@hint", securitymanager.SM_Hint);    
    
            AddParameter("@firstname", securitymanager.SM_FirstName);
            AddParameter("@middlename", securitymanager.SM_MiddleName);
            AddParameter("@lastname", securitymanager.SM_LastName);
            AddParameter("@mobile", securitymanager.SM_Mobile);
            AddParameter("@homephone", securitymanager.SM_HomePhone);
            AddParameter("@workphone", securitymanager.SM_WorkPhone);
            AddParameter("@address1", securitymanager.SM_Address1);
            AddParameter("@address2", securitymanager.SM_Address2);

            AddParameter("@createdon", DateTime.Now.ToString());        
            AddParameter("@createduserid", securitymanager.SM_CreatedUserID);
            AddParameter("@createdroleid", securitymanager.SM_CreatedRoleID);


            return this.ExecuteScalar("usp_AddSecurityManager");
        }

        public List<SecurityManagersModel> SecurityManagersList(SecurityManagersModel securitymanager)
        {
            AddParameter("@communityid", securitymanager.CommunityID);
            DataTable Dt_SecurityManagersList = GetDataTable("usp_GetSecurityManagersList");
            securityManagersList = new List<SecurityManagersModel>();
            
            if (Dt_SecurityManagersList.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_SecurityManagersList.Rows)
                {
                    securityManagerObj = new SecurityManagersModel();

                    securityManagerObj.SecurityManagerID = Convert.ToInt64(dr["SecurityManagerID"].ToString());

                    securityManagerObj.CommunityID = Convert.ToInt16(dr["CommunityID"].ToString());
                    securityManagerObj.CommunityName = dr["CommunityName"].ToString();
                    securityManagerObj.CommunityAddress = dr["CommunityAddress"].ToString();
                    securityManagerObj.City = dr["City"].ToString();
                    securityManagerObj.Zip = dr["Zip"].ToString();
                    securityManagerObj.State = dr["State"].ToString();
                    securityManagerObj.Country = dr["Country"].ToString();
                    securityManagerObj.CommunityPhone1 = dr["CommunityPhone1"].ToString();
                    securityManagerObj.CommunityPhone2 = dr["CommunityPhone2"].ToString();
                    securityManagerObj.CommunityEmail = dr["CommunityEmail"].ToString();
                    securityManagerObj.TotalUnits = Convert.ToByte(dr["TotalUnits"].ToString());
                    securityManagerObj.MaxGates = Convert.ToByte(dr["MaxGates"].ToString());
                    securityManagerObj.MenuOptions = dr["MenuOptions"].ToString();

                    securityManagerObj.EmailID = dr["UserName"].ToString();
                    securityManagerObj.SM_HintQuestionID = Convert.ToByte(dr["HintQuestionID"].ToString());
                    securityManagerObj.SM_HintQuestion = dr["HintQuestion"].ToString();
                    securityManagerObj.SM_Hint = dr["Hint"].ToString();
                    securityManagerObj.VFCode = dr["VFCode"].ToString();
                    securityManagerObj.UserStatus = Convert.ToChar(dr["Status"]);
                    securityManagerObj.UserID = securityManagerObj.SecurityManagerID;
                    securityManagerObj.Password = dr["Password"].ToString();
                    securityManagerObj.RoleID = Convert.ToByte(dr["RoleID"].ToString());
                    securityManagerObj.Role = dr["Role"].ToString();
                                        
                    securityManagerObj.SM_FirstName = dr["FirstName"].ToString();
                    securityManagerObj.SM_MiddleName = dr["MiddleName"].ToString();
                    securityManagerObj.SM_LastName = dr["LastName"].ToString();              
                    securityManagerObj.SM_Mobile = dr["Mobile"].ToString();
                    securityManagerObj.SM_HomePhone = dr["HomePhone"].ToString();
                    securityManagerObj.SM_WorkPhone = dr["WorkPhone"].ToString();
                    securityManagerObj.SM_Address1 = dr["Address1"].ToString();
                    securityManagerObj.SM_Address2 = dr["Address2"].ToString();

                    securityManagerObj.SM_CreatedOn = Convert.ToDateTime(dr["CreatedOn"].ToString());                   
                    securityManagerObj.SM_CreatedUserID = Convert.ToInt64(dr["CreatedUserID"].ToString());
                    securityManagerObj.SM_CreatedRoleID = Convert.ToByte(dr["CreatedRoleID"].ToString());
                    
                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))                    
                    {
                        securityManagerObj.SM_ModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());
                        securityManagerObj.SM_ModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        securityManagerObj.SM_ModifiedRoleID = Convert.ToByte(dr["ModifiedRoleID"].ToString());
                    }

                    securityManagersList.Add(securityManagerObj);
                }
            }
            return securityManagersList;
        }

        public SecurityManagersModel SecurityManagerDetails(SecurityManagersModel securitymanager)
        {           
            AddParameter("@securitymanagerid", securitymanager.SecurityManagerID);

            DataTable Dt_SecurityManagerDetails = this.GetDataTable("usp_GetSecurityManagerDetails");

            if (Dt_SecurityManagerDetails.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_SecurityManagerDetails.Rows)
                {
                    securityManagerDetails = new SecurityManagersModel();
                    
                    securityManagerDetails.SecurityManagerID = Convert.ToInt64(dr["SecurityManagerID"].ToString());

                    securityManagerDetails.CommunityID = Convert.ToInt16(dr["CommunityID"].ToString());
                    securityManagerDetails.CommunityName = dr["CommunityName"].ToString();
                    securityManagerDetails.CommunityAddress = dr["CommunityAddress"].ToString();
                    securityManagerDetails.City = dr["City"].ToString();
                    securityManagerDetails.Zip = dr["Zip"].ToString();
                    securityManagerDetails.State = dr["State"].ToString();
                    securityManagerDetails.Country = dr["Country"].ToString();
                    securityManagerDetails.CommunityPhone1 = dr["CommunityPhone1"].ToString();
                    securityManagerDetails.CommunityPhone2 = dr["CommunityPhone2"].ToString();
                    securityManagerDetails.CommunityEmail = dr["CommunityEmail"].ToString();
                    securityManagerDetails.TotalUnits = Convert.ToByte(dr["TotalUnits"].ToString());
                    securityManagerDetails.MaxGates = Convert.ToByte(dr["MaxGates"].ToString());
                    securityManagerDetails.MenuOptions = dr["MenuOptions"].ToString();

                    securityManagerDetails.EmailID = dr["UserName"].ToString();
                    securityManagerDetails.SM_HintQuestionID = Convert.ToByte(dr["HintQuestionID"].ToString());
                    securityManagerDetails.SM_HintQuestion = dr["HintQuestion"].ToString();
                    securityManagerDetails.SM_Hint = dr["Hint"].ToString();
                    securityManagerDetails.VFCode = dr["VFCode"].ToString();
                    securityManagerDetails.UserStatus = Convert.ToChar(dr["Status"]);
                    securityManagerDetails.UserID = securityManagerObj.SecurityManagerID;
                    securityManagerDetails.Password = dr["Password"].ToString();
                    securityManagerDetails.RoleID = Convert.ToByte(dr["RoleID"].ToString());
                    securityManagerDetails.Role = dr["Role"].ToString();

                    securityManagerDetails.SM_FirstName = dr["FirstName"].ToString();
                    securityManagerDetails.SM_MiddleName = dr["MiddleName"].ToString();
                    securityManagerDetails.SM_LastName = dr["LastName"].ToString();
                    securityManagerDetails.SM_Mobile = dr["Mobile"].ToString();
                    securityManagerDetails.SM_HomePhone = dr["HomePhone"].ToString();
                    securityManagerDetails.SM_WorkPhone = dr["WorkPhone"].ToString();
                    securityManagerDetails.SM_Address1 = dr["Address1"].ToString();
                    securityManagerDetails.SM_Address2 = dr["Address2"].ToString();

                    securityManagerDetails.SM_CreatedOn = Convert.ToDateTime(dr["CreatedOn"].ToString());                    
                    securityManagerDetails.SM_CreatedUserID = Convert.ToInt64(dr["CreatedUserID"].ToString());
                    securityManagerDetails.SM_CreatedRoleID = Convert.ToByte(dr["CreatedRoleID"].ToString());
                    
                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))
                    {
                        securityManagerDetails.SM_ModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());
                        securityManagerDetails.SM_ModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        securityManagerDetails.SM_ModifiedRoleID = Convert.ToByte(dr["ModifiedRoleID"].ToString());
                    }
                }
            }
            return securityManagerDetails;
        }

        public EditSecurityManagerModel EditSecurityManager(EditSecurityManagerModel editsecuritymanager)
        {

            AddParameter("@securitymanagerid", editsecuritymanager.SecurityManagerID);
            AddParameter("@communityid", editsecuritymanager.CommunityID); 

            DataTable Dt_SecurityManagerDetails = this.GetDataTable("usp_GetSecurityManagerDetails");

            if (Dt_SecurityManagerDetails.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_SecurityManagerDetails.Rows)
                {
                    editSecurityManager = new EditSecurityManagerModel();

                    editSecurityManager.SecurityManagerID = Convert.ToInt64(dr["SecurityManagerID"].ToString());

                    editSecurityManager.CommunityID = Convert.ToInt16(dr["CommunityID"].ToString());


                    editSecurityManager.EmailID = dr["UserName"].ToString();
                    editSecurityManager.SM_HintQuestionID = Convert.ToByte(dr["HintQuestionID"].ToString());
                    editSecurityManager.SM_HintQuestion = dr["HintQuestion"].ToString();
                    editSecurityManager.SM_Hint = dr["Hint"].ToString();

                    editSecurityManager.CurrentPassword = dr["Password"].ToString();
                    editSecurityManager.SM_FirstName = dr["FirstName"].ToString();
                    editSecurityManager.SM_MiddleName = dr["MiddleName"].ToString();
                    editSecurityManager.SM_LastName = dr["LastName"].ToString();
                    editSecurityManager.SM_Mobile = dr["Mobile"].ToString();
                    editSecurityManager.SM_HomePhone = dr["HomePhone"].ToString();
                    editSecurityManager.SM_WorkPhone = dr["WorkPhone"].ToString();
                    editSecurityManager.SM_Address1 = dr["Address1"].ToString();
                    editSecurityManager.SM_Address2 = dr["Address2"].ToString();
                    
                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))
                    {
                        editSecurityManager.SM_ModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());
                        editSecurityManager.SM_ModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        editSecurityManager.SM_ModifiedRoleID = Convert.ToByte(dr["ModifiedRoleID"].ToString());
                    }
                }
            }
            return editSecurityManager;
        }

        public object UpdateSecurityManager(EditSecurityManagerModel editsecuritymanager)
        {
            AddParameter("@securitymanagerid", editsecuritymanager.SecurityManagerID);
            AddParameter("@communityid", editsecuritymanager.CommunityID);
            AddParameter("@password", editsecuritymanager.Password);
            AddParameter("@hintquestionid", editsecuritymanager.SM_HintQuestionID);
            AddParameter("@hint", editsecuritymanager.SM_Hint);    

            AddParameter("@firstname", editsecuritymanager.SM_FirstName);
            AddParameter("@middlename", editsecuritymanager.SM_MiddleName);
            AddParameter("@lastname", editsecuritymanager.SM_LastName);
            AddParameter("@mobile", editsecuritymanager.SM_Mobile);
            AddParameter("@homephone", editsecuritymanager.SM_HomePhone);
            AddParameter("@workphone", editsecuritymanager.SM_WorkPhone);
            AddParameter("@address1", editsecuritymanager.SM_Address1);
            AddParameter("@address2", editsecuritymanager.SM_Address2);
            
            AddParameter("@modifiedon", editsecuritymanager.SM_ModifiedOn);            
            AddParameter("@modifieduserid", editsecuritymanager.SM_ModifiedUserID);
            AddParameter("@modifiedroleid", editsecuritymanager.SM_ModifiedRoleID);

            return this.ExecuteScalar("usp_UpdateSecurityManager");
        }

        public Object DeleteSecurityManager(SecurityManagersModel securitymanager)
        {
            AddParameter("@securitymanagerid", securitymanager.SecurityManagerID);
            AddParameter("@communityid", securitymanager.CommunityID);
            
            AddParameter("@modifiedon", securitymanager.SM_ModifiedOn);
            AddParameter("@modifieduserid", securitymanager.SM_ModifiedUserID);
            AddParameter("@modifiedroleid", securitymanager.SM_ModifiedRoleID);

            return ExecuteScalar("usp_DeleteSecurityManager");            
        }

        public static string DeleteSecurityManagers(List<SecurityManagersModel> securitymanagerslist)
        {
            throw new NotImplementedException();
        }

        public void NewSecurityManagerCommunity(ref SecurityManagersModel securitymanager)
        {
            CommunitiesModel community = new CommunitiesModel();
            CommunitiesModel communityDetails = new CommunitiesModel();

            community.CommunityID = securitymanager.CommunityID;
            CommunitiesDAL communitiesDAL = new CommunitiesDAL();
            communityDetails = communitiesDAL.CommunityDetails(community);

            securitymanager.CommunityName = communityDetails.CommunityName;
            securitymanager.CommunityAddress = communityDetails.CommunityAddress;
            securitymanager.City = communityDetails.City;
            securitymanager.Zip = communityDetails.Zip;
            securitymanager.State = communityDetails.State;
            securitymanager.Country = communityDetails.Country;  
        }
    }
}