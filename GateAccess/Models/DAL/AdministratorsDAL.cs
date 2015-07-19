using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

using GateAccess.Models;
using GateAccess.Models.Helper;
using GateAccess.Models.MVVM;


namespace GateAccess.Models.DAL
{
    public class AdministratorsDAL : Dal
    {
        private AdministratorsModel administratorDetails, administratorObj;
        private EditAdministratorModel editAdministrator;
        private List<AdministratorsModel> administratorsList;

        public Object AddAdministrator(AdministratorsModel administrator)
        {
            AddParameter("@communityid", administrator.CommunityID);

            AddParameter("@username", administrator.EmailID);
            AddParameter("@password", administrator.Password);
            AddParameter("@hintquestionid", administrator.Admin_HintQuestionID);
            AddParameter("@hint", administrator.Admin_Hint);
            
            AddParameter("@firstname", administrator.Admin_FirstName);
            AddParameter("@middlename", administrator.Admin_MiddleName);
            AddParameter("@lastname", administrator.Admin_LastName);
            AddParameter("@mobile", administrator.Admin_Mobile);
            AddParameter("@homephone", administrator.Admin_HomePhone);
            AddParameter("@workphone", administrator.Admin_WorkPhone);
            AddParameter("@address1", administrator.Admin_Address1);
            AddParameter("@address2", administrator.Admin_Address2);
            
            AddParameter("@createdon", administrator.Admin_CreatedOn);
            AddParameter("@createduserid", administrator.Admin_CreatedUserID);
            AddParameter("@createdroleid", administrator.Admin_CreatedRoleID);

            return ExecuteScalar("[usp_AddAdministrator]");
        }

        public List<AdministratorsModel> AdministratorsList(AdministratorsModel administrator)
        {
            AddParameter("@communityid", administrator.CommunityID);
            DataTable Dt_AdministratorsList = GetDataTable("usp_GetAdministratorsList");
            administratorsList = new List<AdministratorsModel>();
            if (Dt_AdministratorsList.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_AdministratorsList.Rows)
                {
                    administratorObj = new AdministratorsModel();
                    
                    administratorObj.AdministratorID = Convert.ToInt64(dr["AdministratorID"].ToString());
                    
                    administratorObj.EmailID = dr["UserName"].ToString();
                    administratorObj.Admin_HintQuestionID = Convert.ToByte(dr["HintQuestionID"].ToString());
                    administratorObj.Admin_HintQuestion = dr["HintQuestion"].ToString();
                    administratorObj.Admin_Hint = dr["Hint"].ToString();
                    administratorObj.VFCode  = dr["VFCode"].ToString();
                 	administratorObj.UserStatus = Convert.ToChar(dr["Status"]);	
		            administratorObj.UserID = administratorObj.AdministratorID;
                    administratorObj.Password  = dr["Password"].ToString();
    			    administratorObj.RoleID = Convert.ToByte(dr["RoleID"].ToString());
                    administratorObj.Role = dr["Role"].ToString();  
  
                    administratorObj.CommunityID = Convert.ToInt16(dr["CommunityID"].ToString());
			        administratorObj.CommunityName = dr["CommunityName"].ToString();
                    administratorObj.CommunityAddress = dr["CommunityAddress"].ToString();
                    administratorObj.City = dr["City"].ToString();
                    administratorObj.Zip = dr["Zip"].ToString();
                    administratorObj.State = dr["State"].ToString();
			        administratorObj.Country = dr["Country"].ToString();
                    administratorObj.CommunityPhone1 = dr["CommunityPhone1"].ToString();
                    administratorObj.CommunityPhone2 = dr["CommunityPhone2"].ToString();
			        administratorObj.CommunityEmail = dr["CommunityEmail"].ToString();
                    administratorObj.TotalUnits = Convert.ToByte(dr["TotalUnits"].ToString());
			        administratorObj.MaxGates = Convert.ToByte(dr["MaxGates"].ToString());
                    administratorObj.MenuOptions = dr["MenuOptions"].ToString();

                    administratorObj.Admin_FirstName = dr["FirstName"].ToString();
                    administratorObj.Admin_MiddleName = dr["MiddleName"].ToString();
                    administratorObj.Admin_LastName = dr["LastName"].ToString();
                    administratorObj.Admin_Mobile = dr["Mobile"].ToString();
                    administratorObj.Admin_HomePhone = dr["HomePhone"].ToString();
                    administratorObj.Admin_WorkPhone = dr["WorkPhone"].ToString();
                    administratorObj.Admin_Address1 = dr["Address1"].ToString();
                    administratorObj.Admin_Address2 = dr["Address2"].ToString();                   

                    administratorObj.Admin_CreatedOn = Convert.ToDateTime(dr["CreatedOn"].ToString());
                    administratorObj.Admin_CreatedUserID = Convert.ToInt64(dr["CreatedUserID"].ToString());
                    administratorObj.Admin_CreatedRoleID = Convert.ToByte(dr["CreatedRoleID"].ToString());
                    
                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))
                    {
                        administratorObj.Admin_ModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());                        
                        administratorObj.Admin_ModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        administratorObj.Admin_ModifiedRoleID = Convert.ToByte(dr["ModifiedRoleID"].ToString());
                    }                  

                    administratorsList.Add(administratorObj);
                }
            }
            return administratorsList;
        }

        public AdministratorsModel AdministratorDetails(AdministratorsModel administrator)
        {
            AddParameter("@administratorid", administrator.AdministratorID); 
            AddParameter("@communityid", administrator.CommunityID);

            DataTable Dt_AdminDetails = GetDataTable("usp_GetAdministratorDetails");

            if (Dt_AdminDetails.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_AdminDetails.Rows)
                {
                    administratorDetails = new AdministratorsModel();

                    administratorDetails.AdministratorID = Convert.ToInt64(dr["AdministratorID"].ToString());
                    
                    administratorDetails.EmailID = dr["UserName"].ToString();
                    administratorDetails.Admin_HintQuestionID = Convert.ToByte(dr["HintQuestionID"].ToString());
                    administratorDetails.Admin_HintQuestion = dr["HintQuestion"].ToString();
                    administratorDetails.Admin_Hint = dr["Hint"].ToString();
                    administratorDetails.VFCode  = dr["VFCode"].ToString();
                 	administratorDetails.UserStatus = Convert.ToChar(dr["Status"]);
                    administratorDetails.UserID = Convert.ToInt64(dr["UserID"].ToString());
                    administratorDetails.Password  = dr["Password"].ToString();
    			    administratorDetails.RoleID = Convert.ToByte(dr["RoleID"].ToString());
                    administratorDetails.Role = dr["Role"].ToString();   
 
                    administratorDetails.CommunityID = Convert.ToInt16(dr["CommunityID"].ToString());
			        administratorDetails.CommunityName = dr["CommunityName"].ToString();
                    administratorDetails.CommunityAddress = dr["CommunityAddress"].ToString();
                    administratorDetails.City = dr["City"].ToString();
                    administratorDetails.Zip = dr["Zip"].ToString();
                    administratorDetails.State = dr["State"].ToString();
			        administratorDetails.Country = dr["Country"].ToString();
                    administratorDetails.CommunityPhone1 = dr["CommunityPhone1"].ToString();
                    administratorDetails.CommunityPhone2 = dr["CommunityPhone2"].ToString();
			        administratorDetails.CommunityEmail = dr["CommunityEmail"].ToString();
                    administratorDetails.TotalUnits = Convert.ToByte(dr["TotalUnits"].ToString());
			        administratorDetails.MaxGates = Convert.ToByte(dr["MaxGates"].ToString());
                    administratorDetails.MenuOptions = dr["MenuOptions"].ToString();

                    administratorDetails.Admin_FirstName = dr["FirstName"].ToString();
                    administratorDetails.Admin_MiddleName = dr["MiddleName"].ToString();
                    administratorDetails.Admin_LastName = dr["LastName"].ToString();
                    administratorDetails.Admin_Mobile = dr["Mobile"].ToString();
                    administratorDetails.Admin_HomePhone = dr["HomePhone"].ToString();
                    administratorDetails.Admin_WorkPhone = dr["WorkPhone"].ToString();
                    administratorDetails.Admin_Address1 = dr["Address1"].ToString();
                    administratorDetails.Admin_Address2 = dr["Address2"].ToString();

                    administratorDetails.Admin_CreatedOn = Convert.ToDateTime(dr["CreatedOn"].ToString());                    
                    administratorDetails.Admin_CreatedUserID = Convert.ToInt64(dr["CreatedUserID"].ToString());
                    administratorDetails.Admin_CreatedRoleID = Convert.ToByte(dr["CreatedRoleID"].ToString());

                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))
                    {
                        administratorDetails.Admin_ModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());
                        administratorDetails.Admin_ModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        administratorDetails.Admin_ModifiedRoleID = Convert.ToByte(dr["ModifiedRoleID"].ToString());
                    }               
                }
            }
            return administratorDetails;
        }

        public EditAdministratorModel EditAdministrator(EditAdministratorModel editadministrator)
        {
            AddParameter("@administratorid", editadministrator.AdministratorID);
            AddParameter("@communityid", editadministrator.CommunityID);

            DataTable Dt_AdminDetails = GetDataTable("usp_GetAdministratorDetails");

            if (Dt_AdminDetails.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_AdminDetails.Rows)
                {
                    editadministrator = new EditAdministratorModel();

                    editadministrator.AdministratorID = Convert.ToInt64(dr["AdministratorID"].ToString());

                    editadministrator.EmailID = dr["UserName"].ToString();
                    editadministrator.Admin_HintQuestionID = Convert.ToByte(dr["HintQuestionID"].ToString());
                    editadministrator.Admin_HintQuestion = dr["HintQuestion"].ToString();
                    editadministrator.Admin_Hint = dr["Hint"].ToString();
                    editadministrator.CurrentPassword = dr["Password"].ToString();

                    editadministrator.CommunityID = Convert.ToInt16(dr["CommunityID"].ToString());

                    editadministrator.Admin_FirstName = dr["FirstName"].ToString();
                    editadministrator.Admin_MiddleName = dr["MiddleName"].ToString();
                    editadministrator.Admin_LastName = dr["LastName"].ToString();
                    editadministrator.Admin_Mobile = dr["Mobile"].ToString();
                    editadministrator.Admin_HomePhone = dr["HomePhone"].ToString();
                    editadministrator.Admin_WorkPhone = dr["WorkPhone"].ToString();
                    editadministrator.Admin_Address1 = dr["Address1"].ToString();
                    editadministrator.Admin_Address2 = dr["Address2"].ToString();                    
                }
            }
            return editadministrator;
        }

        public Object UpdateAdministrator(EditAdministratorModel editadministrator)
        {
            AddParameter("@administratorid", editadministrator.AdministratorID);
            AddParameter("@communityid", editadministrator.CommunityID);
            AddParameter("password", editadministrator.Password);
            AddParameter("hintquestionid", editadministrator.Admin_HintQuestionID);
            AddParameter("hint", editadministrator.Admin_Hint);

            AddParameter("@firstname", editadministrator.Admin_FirstName);
            AddParameter("@middlename", editadministrator.Admin_MiddleName);
            AddParameter("@lastname", editadministrator.Admin_LastName);
            AddParameter("@mobile", editadministrator.Admin_Mobile);
            AddParameter("@homephone", editadministrator.Admin_HomePhone);
            AddParameter("@workphone", editadministrator.Admin_WorkPhone);
            AddParameter("@address1", editadministrator.Admin_Address1);
            AddParameter("@address2", editadministrator.Admin_Address2);

            AddParameter("@modifiedon", editadministrator.Admin_ModifiedOn);
            AddParameter("@modifieduserid", editadministrator.Admin_ModifiedUserID);
            AddParameter("@modifiedroleid", editadministrator.Admin_ModifiedRoleID);

            return ExecuteScalar("usp_UpdateAdministrator");
        }

        public Object DeleteAdministrator(AdministratorsModel administrator)
        {
            AddParameter("@administratorid", administrator.AdministratorID);
            AddParameter("@communityid", administrator.CommunityID);

            AddParameter("@modifiedon", administrator.Admin_ModifiedOn);
            AddParameter("@modifieduserid", administrator.Admin_ModifiedUserID);
            AddParameter("@modifiedroleid", administrator.Admin_ModifiedRoleID);

            return ExecuteScalar("usp_DeleteAdministrator");
        }

        public string DeleteAdministrators(List<AdministratorsModel> administratorsList)
        {
            throw new NotImplementedException();
        }

        public void NewAdministratorCommunity(ref AdministratorsModel newadministrator)
        {
            CommunitiesModel community = new CommunitiesModel();
            CommunitiesModel communityDetails = new CommunitiesModel();

            community.CommunityID = newadministrator.CommunityID;
            CommunitiesDAL communitiesDAL = new CommunitiesDAL();
            communityDetails = communitiesDAL.CommunityDetails(community);

            newadministrator.CommunityName = communityDetails.CommunityName;
            newadministrator.CommunityAddress = communityDetails.CommunityAddress;
            newadministrator.City = communityDetails.City;
            newadministrator.Zip = communityDetails.Zip;
            newadministrator.State = communityDetails.State;
            newadministrator.Country = communityDetails.Country;
        }
    }
}