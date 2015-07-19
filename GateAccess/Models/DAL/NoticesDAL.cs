using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GateAccess.Models;
using GateAccess.Models.Helper;
using System.Data;

namespace GateAccess.Models.DAL
{
    public class NoticesDAL : Dal
    {
        NoticesModel noticeDetails, noticeObj;
        List<NoticesModel> noticesList;

        internal object AddNotice(NoticesModel notice)
        {
            AddParameter("@communityid", notice.CommunityID);
            AddParameter("@notice", notice.NoticeText);
            AddParameter("@createduserid", notice.CreatedUserID);
            AddParameter("@createdroleid", notice.CreatedRoleID);
            AddParameter("@createdon", notice.CreatedOn);

            return this.ExecuteScalar("usp_AddNotice");            
        }

        internal List<NoticesModel> NoticesList(NoticesModel notice)
        {
            AddParameter("@communityid", notice.CommunityID);
            DataTable Dt_NoticesList = this.GetDataTable("usp_GetNoticesList");
            noticesList = new List<NoticesModel>();
            if (Dt_NoticesList.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_NoticesList.Rows)
                {
                    noticeObj = new NoticesModel();
                    noticeObj.NoticeID = Convert.ToInt64(dr["NoticeID"].ToString());
                    noticeObj.CommunityID = Convert.ToInt16(dr["CommunityID"].ToString());
                    noticeObj.NoticeText = dr["Notice"].ToString();
                    noticeObj.CreatedUserID = Convert.ToInt64(dr["CreatedUserID"].ToString());
                    noticeObj.CreatedRoleID = Convert.ToByte(dr["CreatedRoleID"].ToString());
                    noticeObj.CreatedOn = Convert.ToDateTime(dr["CreatedOn"].ToString());
                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))
                    {
                        noticeObj.ModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        noticeObj.ModifiedRoleID = Convert.ToByte(dr["ModifiedRoleID"].ToString());                     
                        noticeObj.ModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());
                    }

                    noticesList.Add(noticeObj);
                }
            }
            return noticesList;
        }

        internal NoticesModel NoticeDetails(NoticesModel notice)
        {
            AddParameter("@noticeid", notice.NoticeID);
            DataTable Dt_NoticeDetails = this.GetDataTable("usp_GetNoticeDetails");

            if (Dt_NoticeDetails.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_NoticeDetails.Rows)
                {
                    noticeDetails = new NoticesModel();
                    noticeDetails.NoticeID = Convert.ToInt64(dr["NoticeID"].ToString());
                    noticeDetails.CommunityID = Convert.ToInt16(dr["CommunityID"].ToString());
                    noticeDetails.NoticeText = dr["Notice"].ToString();
                    noticeDetails.CreatedUserID = Convert.ToInt64(dr["CreatedUserID"].ToString());
                    noticeDetails.CreatedRoleID = Convert.ToByte(dr["CreatedRoleID"].ToString());
                    noticeDetails.CreatedOn = Convert.ToDateTime(dr["CreatedOn"].ToString());
                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))
                    {
                        noticeDetails.ModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        noticeDetails.ModifiedRoleID = Convert.ToByte(dr["ModifiedRoleID"].ToString());
                        noticeDetails.ModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());
                    }
                    noticeDetails.Status = Convert.ToChar(dr["Status"].ToString());
                }
            }
            return noticeDetails;
        }

        internal NoticesModel EditNotice(NoticesModel notice)
        {
            return this.NoticeDetails(notice);
        }

        internal object UpdateNotice(NoticesModel notice)
        {
            AddParameter("@noticeid", notice.NoticeID);
            AddParameter("@communityid", notice.CommunityID);
            AddParameter("@notice", notice.NoticeText);
            AddParameter("@modifieduserid", notice.ModifiedUserID);
            AddParameter("@modifiedroleid", notice.ModifiedRoleID);
            AddParameter("@modifiedon", notice.ModifiedOn);
 
            return this.ExecuteScalar("usp_UpdateNotice");
        }

        internal Object DeleteNotice(NoticesModel notice)
        {
            AddParameter("@noticeid", notice.NoticeID);
            AddParameter("@modifieduserid", notice.ModifiedUserID);
            AddParameter("@modifiedroleid", notice.ModifiedRoleID);
            AddParameter("@modifiedon", notice.ModifiedOn); 
            
           return ExecuteScalar("usp_DeleteNotice");            
        }

        internal string DeleteNotices(List<NoticesModel> noticesList)
        {
            throw new NotImplementedException();
        }
    }
}