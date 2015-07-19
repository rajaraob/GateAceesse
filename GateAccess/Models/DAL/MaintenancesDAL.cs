using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GateAccess.Models;
using GateAccess.Models.Helper;
using System.Data;

namespace GateAccess.Models.DAL
{
    public class MaintenancesDAL : Dal
    {
        MaintenancesModel maintenanceDetails, maintenanceObj;
        List<MaintenancesModel> maintenancesList;

        internal object AddMaintenance(MaintenancesModel maintenance)
        {
            AddParameter("@communityid", maintenance.CommunityID);
            AddParameter("@request", maintenance.Request);
            AddParameter("@fulltext", maintenance.FullText);
            AddParameter("@contact", maintenance.Contact);
            AddParameter("@emailid", maintenance.EmailID);
            AddParameter("@createduserid", maintenance.CreatedUserID);
            AddParameter("@createdroleid", maintenance.CreatedRoleID);
            AddParameter("@createdon", maintenance.CreatedOn);

            return this.ExecuteScalar("usp_AddMaintenance");
        }

        internal List<MaintenancesModel> MaintenanceList(MaintenancesModel maintenance)
        {
            AddParameter("@communityid", maintenance.CommunityID);
            DataTable Dt_MaintenancesList = this.GetDataTable("usp_GetMaintenancesList");
            maintenancesList = new List<MaintenancesModel>();
            if (Dt_MaintenancesList.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_MaintenancesList.Rows)
                {
                    maintenanceObj = new MaintenancesModel();
                    maintenanceObj.MaintenanceID = Convert.ToInt64(dr["MaintenanceID"].ToString());
                    maintenanceObj.CommunityID = Convert.ToInt16(dr["CommunityID"].ToString());
                    maintenanceObj.Request = dr["Request"].ToString();                    
                    maintenanceObj.Contact = dr["Contact"].ToString();
                    maintenanceObj.EmailID = dr["EmailID"].ToString();
                    maintenanceObj.CreatedUserID = Convert.ToInt64(dr["CreatedUserID"].ToString());
                    maintenanceObj.CreatedRoleID = Convert.ToByte(dr["CreatedRoleID"].ToString());
                    maintenanceObj.CreatedOn = Convert.ToDateTime(dr["CreatedOn"].ToString());
                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))
                    {
                        maintenanceObj.ModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        maintenanceObj.ModifiedRoleID = Convert.ToByte(dr["ModifiedRoleID"].ToString());
                        maintenanceObj.ModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());
                    }
                    maintenancesList.Add(maintenanceObj);
                }
            }
            return maintenancesList;
        }

        internal MaintenancesModel MaintenanceDetails(MaintenancesModel maintenance)
        {            
            AddParameter("@maintenanceid", maintenance.MaintenanceID);
            DataTable Dt_MaintenanceDetails = this.GetDataTable("usp_GetMaintenanceDetails");

            if (Dt_MaintenanceDetails.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_MaintenanceDetails.Rows)
                {
                    maintenanceDetails = new MaintenancesModel();
                    maintenanceDetails.MaintenanceID = Convert.ToInt64(dr["MaintenanceID"].ToString());
                    maintenanceDetails.CommunityID = Convert.ToInt16(dr["CommunityID"].ToString());
                    maintenanceDetails.Request = dr["Request"].ToString();
                    maintenanceDetails.FullText = dr["FullText"].ToString();
                    maintenanceDetails.Contact = dr["Contact"].ToString();
                    maintenanceDetails.EmailID = dr["EmailID"].ToString();
                    maintenanceDetails.CreatedUserID = Convert.ToInt64(dr["CreatedUserID"].ToString());
                    maintenanceDetails.CreatedRoleID = Convert.ToByte(dr["CreatedRoleID"].ToString());
                    maintenanceDetails.CreatedOn = Convert.ToDateTime(dr["CreatedOn"].ToString());
                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))                    
                    {
                        maintenanceDetails.ModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        maintenanceDetails.ModifiedRoleID = Convert.ToByte(dr["ModifiedRoleID"].ToString());
                        maintenanceDetails.ModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());
                    }
                }
            }
            return maintenanceDetails;
        }

        internal MaintenancesModel EditMaintenance(MaintenancesModel maintenance)
        {
            return this.MaintenanceDetails(maintenance);
        }

        internal object UpdateMaintenance(MaintenancesModel maintenance)
        {
            AddParameter("@maintenanceid", maintenance.MaintenanceID);
            AddParameter("@communityid", maintenance.CommunityID);
            AddParameter("@request", maintenance.Request);
            AddParameter("@fulltext", maintenance.FullText);
            AddParameter("@contact", maintenance.Contact);
            AddParameter("@emailid", maintenance.EmailID);
            AddParameter("@modifieduserid", maintenance.ModifiedUserID);
            AddParameter("@modifiedroleid", maintenance.ModifiedRoleID);
            AddParameter("@modifiedon", maintenance.ModifiedOn);

            return this.ExecuteScalar("usp_UpdateMaintenance");
        }

        internal Object DeleteMaintenance(MaintenancesModel maintenance)
        {
            AddParameter("@maintenanceid", maintenance.MaintenanceID);
            AddParameter("@modifieduserid", maintenance.ModifiedUserID);
            AddParameter("@modifiedroleid", maintenance.ModifiedRoleID);
            AddParameter("@modifiedon", maintenance.ModifiedOn); 
            return ExecuteScalar("usp_DeleteMaintenance");            
        }

        internal string DeleteMaintenances(List<MaintenancesModel> maintenancesList)
        {
            throw new NotImplementedException();
        }
    }
}