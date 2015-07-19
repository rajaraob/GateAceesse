using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GateAccess.Models;
using GateAccess.Models.Helper;
using System.Data;

namespace GateAccess.Models.DAL
{
    public class VisitorsDAL:Dal
    {
        VisitorsModel visitorDetails, visitorObj;
        List<VisitorsModel> visitorsList;

        internal object AddVisitor(VisitorsModel visitor)
        {
            AddParameter("@communityid", visitor.CommunityID);
            AddParameter("@visitorname", visitor.VisitorName);
            AddParameter("@visitortypeid", visitor.VisitorType);
            AddParameter("@visitingdate", visitor.VisitingDate);
            AddParameter("@mobileno", visitor.MobileNo);
            AddParameter("@emailid", visitor.EmailID);
            AddParameter("@visitingto", visitor.VisitingTo);
            AddParameter("@comments", visitor.Comments);
            AddParameter("@createduserid", visitor.CreatedUserID);
            AddParameter("@createdroleid", visitor.CreatedRoleID);
            AddParameter("@createdon", visitor.CreatedOn);

            return this.ExecuteScalar("usp_AddVisitor");
        }

        internal List<VisitorsModel> VisitorsList(VisitorsModel visitor)
        {
            AddParameter("@communityid", visitor.CommunityID);
            DataTable Dt_VisitorsList = this.GetDataTable("usp_GetVisitorsList");
            visitorsList = new List<VisitorsModel>();
            if (Dt_VisitorsList.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_VisitorsList.Rows)
                {
                    visitorObj = new VisitorsModel();
                    visitorObj.VisitorID = Convert.ToInt64(dr["VisitorID"].ToString());
                    visitorObj.CommunityID = Convert.ToInt16(dr["CommunityID"].ToString());
                    visitorObj.VisitorName = dr["VisitorName"].ToString();
                    visitorObj.VisitorTypeID = dr["VisitorTypeID"].ToString();
                    visitorObj.VisitorType = dr["VisitorType"].ToString();
                    visitorObj.VisitingDate = dr["VisitingDate"].ToString();
                    visitorObj.MobileNo = dr["MobileNo"].ToString();
                    visitorObj.EmailID = dr["EmailID"].ToString();
                    visitorObj.VisitingTo = dr["VisitingTo"].ToString();
                    visitorObj.Comments = dr["Comments"].ToString();
                    visitorObj.CreatedOn = Convert.ToDateTime(dr["CreatedOn"].ToString());
                    visitorObj.CreatedUserID = Convert.ToInt64(dr["CreatedUserID"].ToString());
                    visitorObj.CreatedRoleID = Convert.ToByte(dr["CreatedRoleID"].ToString());
                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))
                    {
                        visitorObj.ModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());
                        visitorObj.ModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        visitorObj.ModifiedRoleID = Convert.ToByte(dr["ModifiedRoleID"].ToString());
                    }
                    visitorsList.Add(visitorObj);
                }
            }
            return visitorsList;
        }

        //internal List<VisitorsModel> MyVisitorsList(VisitorsModel visitor)
        //{
        //    AddParameter("@createduserid", visitor.CreatedUserID);
        //    DataTable Dt_MyVisitorsList = this.GetDataTable("usp_GetMyVisitorsList");
        //    visitorsList = new List<VisitorsModel>();
        //    if (Dt_MyVisitorsList.Rows.Count > 0)
        //    {
        //        for (int i = 0; i < Dt_MyVisitorsList.Rows.Count; i++)
        //        {
        //            visitorObj = new VisitorsModel();
        //            visitorObj.VisitorID = Convert.ToInt64(Dt_MyVisitorsList.Rows[i]["VisitorID"].ToString());
        //            visitorObj.VisitorName = Dt_MyVisitorsList.Rows[i]["VisitorName"].ToString();
        //            visitorObj.VisitorTypeID = Dt_MyVisitorsList.Rows[i]["VisitorTypeID"].ToString();
        //            visitorObj.VisitorType = Dt_MyVisitorsList.Rows[i]["VisitorType"].ToString();
        //            visitorObj.VisitingDate = Dt_MyVisitorsList.Rows[i]["VisitingDate"].ToString();
        //            visitorObj.MobileNo = Dt_MyVisitorsList.Rows[i]["MobileNo"].ToString();
        //            visitorObj.EmailID = Dt_MyVisitorsList.Rows[i]["EmailID"].ToString();
        //            visitorObj.VisitingTo = Dt_MyVisitorsList.Rows[i]["VisitingTo"].ToString();
        //            visitorObj.Comments = Dt_MyVisitorsList.Rows[i]["Comments"].ToString();
        //            //visitorObj.Status = Dt_MyVisitorsList.Rows[i]["Status"].ToString();
        //            visitorObj.CreatedOn = Dt_MyVisitorsList.Rows[i]["CreatedOn"].ToString();
        //            visitorObj.CreatedUserID = Dt_MyVisitorsList.Rows[i]["CreatedBy"].ToString();
        //            visitorObj.ModifiedOn = Dt_MyVisitorsList.Rows[i]["ModifiedOn"].ToString();
        //            visitorObj.ModifiedUserID = Dt_MyVisitorsList.Rows[i]["ModifiedBy"].ToString();
        //            visitorsList.Add(visitorObj);
        //        }
        //    }
        //    return visitorsList;
        //}

        internal VisitorsModel VisitorDetails(VisitorsModel visitor)
        {
            AddParameter("@visitorid", visitor.VisitorID);
            DataTable Dt_VisitorDetails = this.GetDataTable("usp_GetVisitorDetails");

            if (Dt_VisitorDetails.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_VisitorDetails.Rows)
                {
                    visitorDetails = new VisitorsModel();
                    visitorDetails.VisitorID = Convert.ToInt64(dr["VisitorID"].ToString());
                    visitorDetails.CommunityID = Convert.ToInt16(dr["CommunityID"].ToString());
                    visitorDetails.VisitorName = dr["VisitorName"].ToString();
                    visitorDetails.VisitorTypeID = dr["VisitorTypeID"].ToString();
                    //visitorDetails.VisitorType = dr["VisitorType"].ToString();
                    visitorDetails.VisitingDate = dr["VisitingDate"].ToString();
                    visitorDetails.MobileNo = dr["MobileNo"].ToString();
                    visitorDetails.EmailID = dr["EmailID"].ToString();
                    visitorDetails.VisitingTo = dr["VisitingTo"].ToString();
                    visitorDetails.Comments = dr["Comments"].ToString();
                    //visitorDetails.Status = dr["Status"].ToString();
                    visitorDetails.CreatedOn = Convert.ToDateTime(dr["CreatedOn"].ToString());
                    visitorDetails.CreatedUserID = Convert.ToInt64(dr["CreatedUserID"].ToString());
                    visitorDetails.CreatedRoleID = Convert.ToByte(dr["CreatedRoleID"].ToString());
                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))
                    {
                        visitorDetails.ModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());
                        visitorDetails.ModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        visitorDetails.ModifiedRoleID = Convert.ToByte(dr["ModifiedRoleID"].ToString());
                    }
                    visitorDetails.Status = Convert.ToChar(dr["Status"].ToString());
                }
            }
            return visitorDetails;
        }

        internal VisitorsModel EditVisitor(VisitorsModel visitor)
        {
            return this.VisitorDetails(visitor);
        }

        internal object UpdateVisitor(VisitorsModel Visitor)
        {
            AddParameter("@visitorid", Visitor.VisitorID);
            AddParameter("@visitorname", Visitor.VisitorName);
            AddParameter("@visitortypeid", Visitor.VisitorType);
            AddParameter("@visitingdate", Visitor.VisitingDate);
            AddParameter("@mobileno", Visitor.MobileNo);
            AddParameter("@emailid", Visitor.EmailID);
            AddParameter("@visitingto", Visitor.VisitingTo);
            AddParameter("@comments", Visitor.Comments);
          //AddParameter("@status", Visitor.Status);
            AddParameter("@modifieduserid", Visitor.ModifiedUserID);
            AddParameter("@modifiedroleid", Visitor.ModifiedRoleID);
            AddParameter("@modifiedon", Visitor.ModifiedOn);

            return this.ExecuteScalar("usp_UpdateVisitor");
        }

        internal Object DeleteVisitor(VisitorsModel visitor)
        {
            AddParameter("@visitorid", visitor.VisitorID);
            AddParameter("@modifieduserid", visitor.ModifiedUserID);
            AddParameter("@modifiedroleid", visitor.ModifiedRoleID);
            AddParameter("@modifiedon", visitor.ModifiedOn); 
            return ExecuteScalar("usp_DeleteVisitor");             
        }

        internal List<VisitorsModel> HomeOwnerVisitors(HomeOwnersModel homeOwner)
        {
            AddParameter("@homeownerid",homeOwner.HomeOwnerID);
            DataTable Dt_HomeOwnerVisitorsList = this.GetDataTable("usp_GetHomeOwnerVisitorsList");
            visitorsList = new List<VisitorsModel>();
            if (Dt_HomeOwnerVisitorsList.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_HomeOwnerVisitorsList.Rows)
                {
                    visitorObj = new VisitorsModel();
                    visitorObj.VisitorID = Convert.ToInt64(dr["VisitorID"].ToString());
                    visitorObj.VisitorName = dr["VisitorName"].ToString();
                    visitorObj.VisitorTypeID = dr["VisitorTypeID"].ToString();
                    visitorObj.VisitorType = dr["VisitorType"].ToString();
                    visitorObj.VisitingDate = dr["VisitingDate"].ToString();
                    visitorObj.MobileNo = dr["MobileNo"].ToString();
                    visitorObj.EmailID = dr["EmailID"].ToString();
                    visitorObj.VisitingTo = dr["VisitingTo"].ToString();
                    visitorObj.Comments = dr["Comments"].ToString();
                    //visitorObj.Status = dr["Status"].ToString();
                    visitorObj.CreatedOn = Convert.ToDateTime(dr["CreatedOn"].ToString());
                    visitorObj.CreatedUserID = Convert.ToInt64(dr["CreatedUserID"].ToString());
                    visitorObj.CreatedRoleID = Convert.ToByte(dr["CreatedRoleID"].ToString());
                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))
                    {
                        visitorObj.ModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());
                        visitorObj.ModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        visitorObj.ModifiedRoleID = Convert.ToByte(dr["ModifiedRoleID"].ToString());
                    }
                    visitorsList.Add(visitorObj);
                }
            }
            return visitorsList;
            
        }

        internal string DeleteVisitors(List<VisitorsModel> visitorsList)
        {
            throw new NotImplementedException();
        }
    }
}