using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GateAccess.Models;
using GateAccess.Models.Helper;
using System.Data;

namespace GateAccess.Models.DAL
{
    public class LostFoundsDAL : Dal
    {
        LostFoundsModel lostFoundDetails, lostFoundObj;
        List<LostFoundsModel> lostFoundList;

        internal object AddLostFound(LostFoundsModel lostFound)
        {
            AddParameter("@communityid",lostFound.CommunityID);
            AddParameter("@lostwhat", lostFound.LostWhat);
            AddParameter("@lostwhen", lostFound.LostWhen);
            AddParameter("@lostat", lostFound.LostAt);
            AddParameter("@foundwhat", lostFound.FoundWhat);
            AddParameter("@foundwhen", lostFound.FoundWhen);
            AddParameter("@foundat", lostFound.FoundAt);
            AddParameter("@description", lostFound.Description);
            AddParameter("@createduserid", lostFound.CreatedUserID);
            AddParameter("@createdroleid", lostFound.CreatedRoleID);
            AddParameter("@createdon", lostFound.CreatedOn);

            return this.ExecuteScalar("usp_AddLostFound");
        }

        internal List<LostFoundsModel> LostFoundList(LostFoundsModel lostFound)
        {
            AddParameter("@communityid", lostFound.CommunityID);
            DataTable Dt_LostFoundList = this.GetDataTable("usp_GetLostFoundsList");
            lostFoundList = new List<LostFoundsModel>();
            if (Dt_LostFoundList.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_LostFoundList.Rows)
                {
                    lostFoundObj = new LostFoundsModel();
                    lostFoundObj.LostFoundID = Convert.ToInt64(dr["LostFoundID"].ToString());
                    lostFoundObj.CommunityID = Convert.ToInt16(dr["CommunityID"].ToString());
                    lostFoundObj.LostWhat = dr["LostWhat"].ToString();
                    lostFoundObj.LostWhen = dr["LostWhen"].ToString();
                    lostFoundObj.LostAt = dr["LostAt"].ToString();
                    lostFoundObj.FoundWhat = dr["FoundWhat"].ToString();
                    lostFoundObj.FoundWhen = dr["FoundWhen"].ToString();
                    lostFoundObj.FoundAt = dr["FoundAt"].ToString();
                    lostFoundObj.Description= dr["Description"].ToString();
                    lostFoundObj.CreatedUserID = Convert.ToInt64(dr["CreatedUserID"].ToString());
                    lostFoundObj.CreatedRoleID = Convert.ToByte(dr["CreatedRoleID"].ToString());
                    lostFoundObj.CreatedOn = Convert.ToDateTime(dr["CreatedOn"].ToString());
                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))
                    {
                        lostFoundObj.ModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        lostFoundObj.ModifiedRoleID = Convert.ToByte(dr["ModifiedRoleID"].ToString());
                        lostFoundObj.ModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());
                    }
                    
                    lostFoundList.Add(lostFoundObj);
                }
            }
            return lostFoundList;
        }

        internal LostFoundsModel LostFoundDetails(LostFoundsModel lostFound)
        {            
            AddParameter("@lostfoundid", lostFound.LostFoundID);
            DataTable Dt_LostFoundDetails = this.GetDataTable("usp_GetLostFoundDetails");

            if (Dt_LostFoundDetails.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_LostFoundDetails.Rows)
                {
                    lostFoundDetails = new LostFoundsModel();
                    lostFoundDetails.LostFoundID = Convert.ToInt64(dr["LostFoundID"].ToString());
                    lostFoundDetails.LostWhat = dr["LostWhat"].ToString();
                    lostFoundDetails.LostWhen = dr["LostWhen"].ToString();
                    lostFoundDetails.LostAt = dr["LostAt"].ToString();
                    lostFoundDetails.FoundWhat = dr["FoundWhat"].ToString();
                    lostFoundDetails.FoundWhen = dr["FoundWhen"].ToString();
                    lostFoundDetails.FoundAt = dr["FoundAt"].ToString();
                    lostFoundDetails.Description = dr["Description"].ToString();
                    lostFoundDetails.CreatedUserID = Convert.ToInt64(dr["CreatedUserID"].ToString());
                    lostFoundDetails.CreatedRoleID = Convert.ToByte(dr["CreatedRoleID"].ToString());
                    lostFoundDetails.CreatedOn = Convert.ToDateTime(dr["CreatedOn"].ToString());
                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))
                    {
                        lostFoundDetails.ModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        lostFoundDetails.ModifiedRoleID = Convert.ToByte(dr["ModifiedRoleID"].ToString());
                        lostFoundDetails.ModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());
                    }
                }
            }
            return lostFoundDetails;
        }

        internal LostFoundsModel EditLostFound(LostFoundsModel lostFound)
        {
            return this.LostFoundDetails(lostFound);
        }

        internal object UpdateLostFound(LostFoundsModel lostFound)
        {
            AddParameter("@lostfoundid", lostFound.LostFoundID);
            AddParameter("@communityid", lostFound.CommunityID);
            AddParameter("@lostwhat", lostFound.LostWhat);
            AddParameter("@lostwhen", lostFound.LostWhen);
            AddParameter("@lostat", lostFound.LostAt);
            AddParameter("@foundwhat", lostFound.FoundWhat);
            AddParameter("@foundwhen", lostFound.FoundWhen);
            AddParameter("@foundat", lostFound.FoundAt);
            AddParameter("@description", lostFound.Description);
            AddParameter("@modifieduserid", lostFound.ModifiedUserID);
            AddParameter("@modifiedroleid", lostFound.ModifiedRoleID);
            AddParameter("@modifiedon", lostFound.ModifiedOn);

            return this.ExecuteScalar("usp_UpdateLostFound");
        }

        internal Object DeleteLostFound(LostFoundsModel lostFound)
        {
            AddParameter("@lostfoundid", lostFound.LostFoundID);
            AddParameter("@modifieduserid", lostFound.ModifiedUserID);
            AddParameter("@modifiedroleid", lostFound.ModifiedRoleID);
            AddParameter("@modifiedon", lostFound.ModifiedOn); 
            return ExecuteScalar("usp_DeleteLostFound");            
        }

        internal string DeleteLostFounds(List<LostFoundsModel> lostFoundsList)
        {
            throw new NotImplementedException();
        }
    }
}