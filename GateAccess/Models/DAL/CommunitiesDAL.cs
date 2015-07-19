using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Mvc;

using GateAccess.Models;
using GateAccess.Models.Helper;
using System.Collections;

namespace GateAccess.Models.DAL
{
    public class CommunitiesDAL : Dal
    {
        internal object AddCommunity(CommunitiesModel community)
        {
            AddParameter("@communityname", community.CommunityName);
            AddParameter("@address", community.CommunityAddress);
            AddParameter("@city", community.City);
            AddParameter("@state", community.State);
            AddParameter("@country", community.Country);
            AddParameter("@zip", community.Zip);
            AddParameter("@Phone1", community.CommunityPhone1);
            AddParameter("@Phone2", community.CommunityPhone2);
            AddParameter("@email", community.CommunityEmail);
            AddParameter("@totalunits", community.TotalUnits);
            AddParameter("@maxgates", community.MaxGates);
            AddParameter("@menuoptions", CommaSeperatedMenuOption(community.SelectedMenuOptions));
            AddParameter("@CreatedOn", community.CommunityCreatedOn);
            AddParameter("@createduserid", community.CommunityCreatedUserID);
            AddParameter("@createdroleid", community.CommunityCreatedRoleID);

            return ExecuteScalar("usp_AddCommunity");
        }

        internal List<CommunitiesModel> CommunitiesList()
        {
            DataTable Dt_CommunitiesList = GetDataTable("usp_GetCommunitiesList");
            List<CommunitiesModel> communitiesList = new List<CommunitiesModel>();
            if (Dt_CommunitiesList.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_CommunitiesList.Rows)
                {
                    CommunitiesModel communityObj; communityObj = new CommunitiesModel();
                    communityObj.CommunityID = Convert.ToInt16(dr["CommunityID"].ToString());
                    communityObj.CommunityName = dr["CommunityName"].ToString();
                    communityObj.CommunityAddress = dr["Address"].ToString();
                    communityObj.City = dr["City"].ToString();
                    communityObj.Zip = dr["Zip"].ToString();
                    communityObj.State = dr["State"].ToString();
                    communityObj.Country = dr["Country"].ToString();
                    communityObj.CommunityPhone1 = dr["Phone1"].ToString();
                    communityObj.CommunityPhone2 = dr["Phone2"].ToString();
                    communityObj.CommunityEmail = dr["Email"].ToString();
                    communityObj.TotalUnits = Convert.ToInt16(dr["TotalUnits"].ToString());
                    communityObj.MaxGates = Convert.ToByte(dr["MaxGates"].ToString());
                    communityObj.MenuOptions = dr["MenuOptions"].ToString();

                    communityObj.CommunityCreatedOn = Convert.ToDateTime(dr["CreatedOn"].ToString());
                    communityObj.CommunityCreatedUserID = Convert.ToInt64(dr["CreatedUserID"].ToString());
                    communityObj.CommunityCreatedRoleID = Convert.ToByte(dr["CreatedRoleID"].ToString());
                    
                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))
                    {
                        communityObj.CommunityModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());
                        communityObj.CommunityModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        communityObj.CommunityModifiedRoleID = Convert.ToByte(dr["ModifiedRoleID"].ToString());
                    }
                    communityObj.CommunityStatus = Convert.ToChar(dr["Status"].ToString());

                    communitiesList.Add(communityObj);
                }
            }
            return communitiesList;
        }

        internal CommunitiesModel CommunityDetails(CommunitiesModel community)
        {
            AddParameter("@communityid", community.CommunityID);
            DataTable Dt_CommunityDetails = GetDataTable("usp_GetCommunityDetails");
            CommunitiesModel communityDetails = new CommunitiesModel();

            if (Dt_CommunityDetails.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_CommunityDetails.Rows)
                {
                    communityDetails.CommunityID = Convert.ToInt16(dr["CommunityID"].ToString());
                    communityDetails.CommunityName = dr["CommunityName"].ToString();
                    communityDetails.CommunityAddress = dr["Address"].ToString();
                    communityDetails.City = dr["City"].ToString();
                    communityDetails.Zip = dr["Zip"].ToString();
                    communityDetails.State = dr["State"].ToString();
                    communityDetails.Country = dr["Country"].ToString();
                    communityDetails.CommunityPhone1 = dr["Phone1"].ToString();
                    communityDetails.CommunityPhone2 = dr["Phone2"].ToString();
                    communityDetails.CommunityEmail = dr["Email"].ToString();
                    communityDetails.TotalUnits = Convert.ToInt16(dr["TotalUnits"].ToString());
                    communityDetails.MaxGates = Convert.ToByte(dr["MaxGates"].ToString());
                    communityDetails.MenuOptions = dr["MenuOptions"].ToString();

                    communityDetails.CommunityCreatedOn = Convert.ToDateTime(dr["CreatedOn"].ToString());
                    communityDetails.CommunityCreatedUserID = Convert.ToInt64(dr["CreatedUserID"].ToString());
                    communityDetails.CommunityCreatedRoleID = Convert.ToByte(dr["CreatedRoleID"].ToString());

                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))
                    {
                        communityDetails.CommunityModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());
                        communityDetails.CommunityModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        communityDetails.CommunityModifiedRoleID = Convert.ToByte(dr["ModifiedUserID"].ToString());
                    }
                    communityDetails.CommunityStatus = Convert.ToChar(dr["Status"].ToString());
                }
            }
            return communityDetails;
        }  

        internal CommunitiesModel EditCommunity(CommunitiesModel community)
        {
            return CommunityDetails(community);
        }

        internal object UpdateCommunity(CommunitiesModel community)
        {            
            AddParameter("@communityid", community.CommunityID);
            AddParameter("@communityname", community.CommunityName);
            AddParameter("@address", community.CommunityAddress);
            AddParameter("@city", community.City);
            AddParameter("@state", community.State);
            AddParameter("@country", community.Country);
            AddParameter("@zip", community.Zip);
            AddParameter("@phone1", community.CommunityPhone1);
            AddParameter("@phone2", community.CommunityPhone2);
            AddParameter("@email", community.CommunityEmail);
            AddParameter("@totalunits", community.TotalUnits);
            AddParameter("@maxgates", community.MaxGates);
            AddParameter("@menuoptions", CommaSeperatedMenuOption(community.SelectedMenuOptions));

            AddParameter("@modifiedon", community.CommunityModifiedOn);
            AddParameter("@modifieduserid", community.CommunityModifiedUserID);
            AddParameter("@modifiedroleid", community.CommunityModifiedRoleID);


            return ExecuteNonQuery("usp_UpdateCommunity");
        }

        internal Object DeleteCommunity(CommunitiesModel community)
        {
            AddParameter("@communityid", community.CommunityID);
           
            AddParameter("@modifiedon", community.CommunityModifiedOn);
            AddParameter("@modifieduserid", community.CommunityModifiedUserID);
            AddParameter("@modifiedroleid", community.CommunityModifiedRoleID);
           
            return ExecuteScalar("usp_DeleteCommunity");
        }

        internal Int32 DeleteCommunities(String commaSeperatedCommunities, Int64 userID, Byte roleID)
        {
            AddParameter("@commaseperatedcommunities", commaSeperatedCommunities);
            AddParameter("@modifiedon", Convert.ToDateTime(DateTime.Now.ToShortDateString()));
            AddParameter("@modifieduserid", userID);
            AddParameter("@modifiedroleid", roleID);

            return ExecuteNonQuery("usp_DeleteCommunities");
        }

        internal List<SelectListItem> GetCommunityHouseOwners(CommunitiesModel community)
        {
            AddParameter("@communityid", community.CommunityID);
            DataTable Dt_CommunityHouseOwnersList = GetDataTable("usp_GetHomeOwnersList");
            List<SelectListItem> communityHouseOwners = new List<SelectListItem>();
            if (Dt_CommunityHouseOwnersList.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_CommunityHouseOwnersList.Rows)
                {
                    SelectListItem sli = new SelectListItem();
                    sli.Text = dr["FirstName"].ToString() + "  " + dr["LastName"].ToString();
                    sli.Value = dr["HomeOwnerID"].ToString();
                    communityHouseOwners.Add(sli);
                }
            }
            return communityHouseOwners.ToList();
        }

        internal object CommaSeperatedMenuOption(IEnumerable menuoptionslist)
        {
            String commaMenuOptions = null;
            if (menuoptionslist != null)
            {
                foreach (var item in menuoptionslist)
                    commaMenuOptions += item.ToString() + ",";

                commaMenuOptions.Substring(0, commaMenuOptions.Length - 1);
            }
            return commaMenuOptions;
        }        
    }
}