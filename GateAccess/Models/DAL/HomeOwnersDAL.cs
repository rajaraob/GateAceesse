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
    public class HomeOwnersDAL:Dal
    {
        private HomeOwnersModel homeOwnerDetails, homeOwnerObj;
        private EditHomeOwnerModel editHomeOwner;
        private List<HomeOwnersModel> homeOwnersList;

        internal object AddHomeOwner(HomeOwnersModel homeOwner)
        {
            AddParameter("@communityid", homeOwner.CommunityID);

            AddParameter("@username", homeOwner.EmailID);
            AddParameter("@password", homeOwner.Password);
            AddParameter("@hintquestionid", homeOwner.HO_HintQuestionID);
            AddParameter("@hint", homeOwner.HO_Hint); 
            
            AddParameter("@firstname", homeOwner.HO_FirstName);
            AddParameter("@middlename", homeOwner.HO_MiddleName);
            AddParameter("@lastname", homeOwner.HO_LastName);
            AddParameter("@mobile", homeOwner.HO_Mobile);
            AddParameter("@homephone", homeOwner.HO_HomePhone);
            AddParameter("@workphone", homeOwner.HO_WorkPhone);
            AddParameter("@address1", homeOwner.HO_Address1);
            AddParameter("@address2", homeOwner.HO_Address2);          
            AddParameter("@directions", homeOwner.HO_Directions);
            
            AddParameter("@createdon", homeOwner.HO_CreatedOn);
            AddParameter("@createduserid", homeOwner.HO_CreatedUserID);
            AddParameter("@createdroleid", homeOwner.HO_CreatedRoleID);

            return this.ExecuteScalar("usp_AddHomeOwner");
        }

        public List<HomeOwnersModel> HomeOwnersList(HomeOwnersModel homeowner)
        {
            AddParameter("@communityid", homeowner.CommunityID);
            DataTable Dt_HomeOwnersList = this.GetDataTable("usp_GetHomeOwnersList");
            homeOwnersList = new List<HomeOwnersModel>();
            if (Dt_HomeOwnersList.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_HomeOwnersList.Rows)
                {
                    homeOwnerObj = new HomeOwnersModel();

                    homeOwnerObj.HomeOwnerID = Convert.ToInt64(dr["HomeOwnerID"].ToString());

                    homeOwnerObj.EmailID = dr["UserName"].ToString();
                    homeOwnerObj.HO_HintQuestionID = Convert.ToByte(dr["HintQuestionID"].ToString());
                    homeOwnerObj.HO_HintQuestion = dr["HintQuestion"].ToString();
                    homeOwnerObj.HO_Hint = dr["Hint"].ToString();
                    homeOwnerObj.VFCode = dr["VFCode"].ToString();
                    homeOwnerObj.UserStatus = Convert.ToChar(dr["Status"]);
                    homeOwnerObj.UserID = homeOwnerObj.HomeOwnerID;
                    homeOwnerObj.Password = dr["Password"].ToString();
                    homeOwnerObj.RoleID = Convert.ToByte(dr["RoleID"].ToString());
                    homeOwnerObj.Role = dr["Role"].ToString();

                    homeOwnerObj.CommunityID = Convert.ToInt16(dr["CommunityID"].ToString());
                    homeOwnerObj.CommunityName = dr["CommunityName"].ToString();
                    homeOwnerObj.CommunityAddress = dr["CommunityAddress"].ToString();
                    homeOwnerObj.City = dr["City"].ToString();
                    homeOwnerObj.Zip = dr["Zip"].ToString();
                    homeOwnerObj.State = dr["State"].ToString();
                    homeOwnerObj.Country = dr["Country"].ToString();
                    homeOwnerObj.CommunityPhone1 = dr["CommunityPhone1"].ToString();
                    homeOwnerObj.CommunityPhone2 = dr["CommunityPhone2"].ToString();
                    homeOwnerObj.CommunityEmail = dr["CommunityEmail"].ToString();
                    homeOwnerObj.TotalUnits = Convert.ToByte(dr["TotalUnits"].ToString());
                    homeOwnerObj.MaxGates = Convert.ToByte(dr["MaxGates"].ToString());
                    homeOwnerObj.MenuOptions = dr["MenuOptions"].ToString();

                    homeOwnerObj.HO_FirstName = dr["FirstName"].ToString();
                    homeOwnerObj.HO_MiddleName = dr["MiddleName"].ToString();
                    homeOwnerObj.HO_LastName = dr["LastName"].ToString();
                    homeOwnerObj.HO_Mobile = dr["Mobile"].ToString();
                    homeOwnerObj.HO_HomePhone = dr["HomePhone"].ToString();
                    homeOwnerObj.HO_WorkPhone = dr["WorkPhone"].ToString();
                    homeOwnerObj.HO_Address1 = dr["Address1"].ToString();
                    homeOwnerObj.HO_Address2 = dr["Address2"].ToString();
                    homeOwnerObj.HO_Directions = dr["Directions"].ToString();

                    homeOwnerObj.HO_CreatedOn = Convert.ToDateTime(dr["CreatedOn"].ToString());
                    homeOwnerObj.HO_CreatedUserID = Convert.ToInt64(dr["CreatedUserID"].ToString());
                    homeOwnerObj.HO_CreatedRoleID = Convert.ToByte(dr["CreatedRoleID"].ToString());
                   
                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))
                    {
                        homeOwnerObj.HO_ModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());
                        homeOwnerObj.HO_ModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        homeOwnerObj.HO_ModifiedRoleID = Convert.ToByte(dr["ModifiedRoleID"].ToString());
                    }
                    homeOwnersList.Add(homeOwnerObj);
                }
            }
            return homeOwnersList;
        }

        internal HomeOwnersModel HomeOwnerDetails(HomeOwnersModel homeowner)
        {
            AddParameter("@HomeOwnerID", homeowner.HomeOwnerID);
            AddParameter("@communityid", homeowner.CommunityID);
           
            DataTable Dt_HomeOwnerDetails = this.GetDataTable("usp_GetHomeOwnerDetails");

            if (Dt_HomeOwnerDetails.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_HomeOwnerDetails.Rows)
                {
                    homeOwnerDetails = new HomeOwnersModel();
                    
                    homeOwnerDetails.HomeOwnerID = Convert.ToInt64(dr["HomeOwnerID"].ToString());

                    homeOwnerDetails.EmailID = dr["UserName"].ToString();
                    homeOwnerDetails.HO_HintQuestionID = Convert.ToByte(dr["HintQuestionID"].ToString());
                    homeOwnerDetails.HO_HintQuestion = dr["HintQuestion"].ToString();
                    homeOwnerDetails.HO_Hint = dr["Hint"].ToString();
                    homeOwnerDetails.VFCode = dr["VFCode"].ToString();
                    homeOwnerDetails.UserStatus = Convert.ToChar(dr["Status"]);
                    homeOwnerDetails.UserID = Convert.ToInt64(dr["UserID"].ToString());
                    homeOwnerDetails.Password = dr["Password"].ToString();
                    homeOwnerDetails.RoleID = Convert.ToByte(dr["RoleID"].ToString());
                    homeOwnerDetails.Role = dr["Role"].ToString();

                    homeOwnerDetails.CommunityID = Convert.ToInt16(dr["CommunityID"].ToString());
                    homeOwnerDetails.CommunityName = dr["CommunityName"].ToString();
                    homeOwnerDetails.CommunityAddress = dr["CommunityAddress"].ToString();
                    homeOwnerDetails.City = dr["City"].ToString();
                    homeOwnerDetails.Zip = dr["Zip"].ToString();
                    homeOwnerDetails.State = dr["State"].ToString();
                    homeOwnerDetails.Country = dr["Country"].ToString();
                    homeOwnerDetails.CommunityPhone1 = dr["CommunityPhone1"].ToString();
                    homeOwnerDetails.CommunityPhone2 = dr["CommunityPhone2"].ToString();
                    homeOwnerDetails.CommunityEmail = dr["CommunityEmail"].ToString();
                    homeOwnerDetails.TotalUnits = Convert.ToByte(dr["TotalUnits"].ToString());
                    homeOwnerDetails.MaxGates = Convert.ToByte(dr["MaxGates"].ToString());
                    homeOwnerDetails.MenuOptions = dr["MenuOptions"].ToString();

                    homeOwnerDetails.HO_FirstName = dr["FirstName"].ToString();
                    homeOwnerDetails.HO_MiddleName = dr["MiddleName"].ToString();
                    homeOwnerDetails.HO_LastName = dr["LastName"].ToString();
                    homeOwnerDetails.HO_Mobile = dr["Mobile"].ToString();
                    homeOwnerDetails.HO_HomePhone = dr["HomePhone"].ToString();
                    homeOwnerDetails.HO_WorkPhone = dr["WorkPhone"].ToString();
                    homeOwnerDetails.HO_Address1 = dr["Address1"].ToString();
                    homeOwnerDetails.HO_Address2 = dr["Address2"].ToString();                  
                    homeOwnerDetails.HO_Directions = dr["Directions"].ToString();                   

                    homeOwnerDetails.HO_CreatedOn = Convert.ToDateTime(dr["CreatedOn"].ToString());
                    homeOwnerDetails.HO_CreatedUserID = Convert.ToInt64(dr["CreatedUserID"].ToString());
                    homeOwnerDetails.HO_CreatedRoleID = Convert.ToByte(dr["CreatedRoleID"].ToString());

                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))
                    {
                        homeOwnerDetails.HO_ModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());
                        homeOwnerDetails.HO_ModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        homeOwnerDetails.HO_ModifiedRoleID = Convert.ToByte(dr["ModifiedRoleID"].ToString());
                    }
                }
            }
            return homeOwnerDetails;
        }

        internal EditHomeOwnerModel EditHomeOwner(EditHomeOwnerModel edithomeowner)
        {
            AddParameter("@HomeOwnerID", edithomeowner.HomeOwnerID);
            AddParameter("@communityid", edithomeowner.CommunityID);

            DataTable Dt_HomeOwnerDetails = this.GetDataTable("usp_GetHomeOwnerDetails");

            if (Dt_HomeOwnerDetails.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_HomeOwnerDetails.Rows)
                {
                    editHomeOwner = new EditHomeOwnerModel();

                    editHomeOwner.HomeOwnerID = Convert.ToInt64(dr["HomeOwnerID"].ToString());

                    editHomeOwner.EmailID = dr["UserName"].ToString();
                    editHomeOwner.HO_HintQuestionID = Convert.ToByte(dr["HintQuestionID"].ToString());
                    editHomeOwner.HO_HintQuestion = dr["HintQuestion"].ToString();
                    editHomeOwner.HO_Hint = dr["Hint"].ToString();
                    editHomeOwner.CurrentPassword = dr["Password"].ToString();

                    editHomeOwner.CommunityID = Convert.ToInt16(dr["CommunityID"].ToString());

                    editHomeOwner.HO_FirstName = dr["FirstName"].ToString();
                    editHomeOwner.HO_MiddleName = dr["MiddleName"].ToString();
                    editHomeOwner.HO_LastName = dr["LastName"].ToString();
                    editHomeOwner.HO_Mobile = dr["Mobile"].ToString();
                    editHomeOwner.HO_HomePhone = dr["HomePhone"].ToString();
                    editHomeOwner.HO_WorkPhone = dr["WorkPhone"].ToString();
                    editHomeOwner.HO_Address1 = dr["Address1"].ToString();
                    editHomeOwner.HO_Address2 = dr["Address2"].ToString();
                    editHomeOwner.HO_Directions = dr["Directions"].ToString();


                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))
                    {
                        editHomeOwner.HO_ModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());
                        editHomeOwner.HO_ModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        editHomeOwner.HO_ModifiedRoleID = Convert.ToByte(dr["ModifiedRoleID"].ToString());
                    }
                }
            }
            return editHomeOwner;
        }

        internal object UpdateHomeOwner(HomeOwnersModel homeowner)
        {
            AddParameter("@homeownerid", homeowner.HomeOwnerID);
            AddParameter("@communityid", homeowner.CommunityID);
            AddParameter("@password", homeowner.Password);
            AddParameter("@hintquestionid", homeowner.HO_HintQuestionID);
            AddParameter("@hint", homeowner.HO_Hint); 

            AddParameter("@firstname", homeowner.HO_FirstName);
            AddParameter("@middlename", homeowner.HO_MiddleName);
            AddParameter("@lastname", homeowner.HO_LastName);
            AddParameter("@mobile", homeowner.HO_Mobile);
            AddParameter("@homephone", homeowner.HO_HomePhone);
            AddParameter("@workphone", homeowner.HO_WorkPhone);
            AddParameter("@address1", homeowner.HO_Address1);
            AddParameter("@address2", homeowner.HO_Address2);           
            AddParameter("@directions", homeowner.HO_Directions);
           
            AddParameter("@modifiedon", homeowner.HO_ModifiedOn);
            AddParameter("@modifieduserid", homeowner.HO_ModifiedUserID);
            AddParameter("@modifiedroleid", homeowner.HO_ModifiedRoleID);

            return this.ExecuteScalar("usp_UpdateHomeOwner");
        }

        internal Object DeleteHomeOwner(HomeOwnersModel homeowner)
        {
            AddParameter("@homeownerid", homeowner.HomeOwnerID);
            AddParameter("@communityid", homeowner.CommunityID);
            
            AddParameter("@modifiedon", homeowner.HO_ModifiedOn);
            AddParameter("@modifieduserid", homeowner.HO_ModifiedUserID);
            AddParameter("@modifiedroleid", homeowner.HO_ModifiedRoleID);
            return ExecuteScalar("usp_DeleteHomeOwner");            
        }

        internal static string DeleteHomeOwners(List<HomeOwnersModel> homeownerslist)
        {
            throw new NotImplementedException();
        }

        internal void NewHomeOwnerCommunity(ref HomeOwnersModel homeowner)
        {
            CommunitiesModel community = new CommunitiesModel();
            CommunitiesModel communityDetails = new CommunitiesModel();

            community.CommunityID = homeowner.CommunityID;
            CommunitiesDAL communitiesDAL = new CommunitiesDAL();
            communityDetails = communitiesDAL.CommunityDetails(community);

            homeowner.CommunityName = communityDetails.CommunityName;
            homeowner.CommunityAddress = communityDetails.CommunityAddress;
            homeowner.City = communityDetails.City;
            homeowner.Zip = communityDetails.Zip;
            homeowner.State = communityDetails.State;
            homeowner.Country = communityDetails.Country; 
        }
    }

}