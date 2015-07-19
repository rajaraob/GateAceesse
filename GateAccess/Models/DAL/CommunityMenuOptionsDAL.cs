using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using GateAccess.Models;
using GateAccess.Models.Helper;

namespace GateAccess.Models.DAL
{
    public class CommunityMenuOptionsDAL : Dal
    {
        //CommunityMenuOptions communityMenuOptionDetails;

        ////internal String CommunityMenuOptionIDs(CommunityMenuOptions communityMenuOption)
        ////{
        ////    AddParameter("@communityid", communityMenuOption.CommunityID);
        ////    DataTable Dt_CommunityMenuOptions = this.GetDataTable("usp_GetCommunityMenuOptions");
        ////    if (Dt_CommunityMenuOptions.Rows.Count > 0)
        ////    {
        ////        for (int i = 0; i < Dt_CommunityMenuOptions.Rows.Count; i++)
        ////        {
        ////            communityMenuOptionObj = new CommunityMenuOptions();
        ////            communityMenuOptionObj.MenuOptionIDs = Dt_CommunityMenuOptions.Rows[0]["MenuOptions"].ToString();
        ////        }
        ////    }
        ////    return communityMenuOptionObj;
        ////}

        //internal String MenuOptionName(MenuOptions menuOption)
        //{
        //    AddParameter("@menuoptionsid", menuOption.MenuOptionID);
        //    AddParameter("@menuoption", menuOption.MenuOptionName);
        //    DataTable Dt_MenuOptionNames = this.GetDataTable("usp_GetMenuOptionNames");            
        //    return Dt_MenuOptionNames.Rows[0]["MenuOption"].ToString();            
        //}


        //internal object AddCommunityMenuOption(CommunityMenuOptions communityMenuOption)
        //{
        //    AddParameter("@communitymenuoptionid", communityMenuOption.CommunityMenuOptionID);
        //    AddParameter("@menuoptionids", communityMenuOption.MenuOptionIDs);
        //    AddParameter("@createduserid", communityMenuOption.CreatedUserID);
        //    AddParameter("@createdon", communityMenuOption.CreatedOn);
        //    return this.ExecuteScalar("usp_AddCommunityMenuOption");
        //}

        //internal CommunityMenuOptions CommunityMenuOptionDetails(CommunityMenuOptions communityMenuOption)
        //{
        //    AddParameter("@communitymenuoptionid", communityMenuOption.CommunityMenuOptionID);
        //    DataTable Dt_CommunityMenuOptionDetails = this.GetDataTable("usp_GetCommunityMenuOptionDetails");

        //    if (Dt_CommunityMenuOptionDetails.Rows.Count > 0)
        //    {
        //        communityMenuOptionDetails = new CommunityMenuOptions();                
        //        communityMenuOptionDetails.MenuOptionIDs = Dt_CommunityMenuOptionDetails.Rows[0]["MenuOptions"].ToString();                
        //    }
        //    return communityMenuOptionDetails;
        //}

        //internal CommunityMenuOptions EditCommunityMenuOption(CommunityMenuOptions communityMenuOption)
        //{
        //    return this.CommunityMenuOptionDetails(communityMenuOption);
        //}

        //internal object UpdateCommunityMenuOption(CommunityMenuOptions communityMenuOption)
        //{
        //    AddParameter("@communitymenuoptionid", communityMenuOption.CommunityMenuOptionID);
        //    AddParameter("@menuoptionids", communityMenuOption.MenuOptionIDs);
        //    AddParameter("@modifieduserid", communityMenuOption.ModifiedUserID);
        //    AddParameter("@modifiedon", communityMenuOption.ModifiedOn);
        //    return this.ExecuteScalar("usp_UpdateCommunityMenuOption");
        //}

        //internal Object DeleteCommunityMenuOption(CommunityMenuOptions communityMenuOption)
        //{
        //    AddParameter("@communitymenuoptionid", communityMenuOption.CommunityMenuOptionID);
        //    AddParameter("@modifieduserid", communityMenuOption.ModifiedUserID);
        //    AddParameter("@modifiedon", communityMenuOption.ModifiedOn);
        //    return ExecuteScalar("usp_DeleteCommunityMenuOption");

        //}

    }
}