using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GateAccess.Models;
using GateAccess.Models.Helper;
using System.Data;

namespace GateAccess.Models.DAL
{
    public class ServiceProvidersDAL:Dal
    {
        private ServiceProvidersModel serviceProviderDetails, serviceProviderObj;
        private List<ServiceProvidersModel> serviceProvidersList;

        internal object AddServiceProvider(ServiceProvidersModel serviceprovider)
        {
            AddParameter("@communityid", serviceprovider.CommunityID);

            AddParameter("@email", serviceprovider.EmailID);
            AddParameter("@password", serviceprovider.Password);
            AddParameter("@hintquestionid", serviceprovider.SRP_HintQuestionID);
            AddParameter("@hint", serviceprovider.SRP_Hint);

            AddParameter("@name", serviceprovider.SRP_Name);
            AddParameter("@servicetypes", serviceprovider.SRP_ServiceTypes);
            AddParameter("@contactperson", serviceprovider.SRP_ContactPerson);
            AddParameter("@address", serviceprovider.SRP_Address);         
            AddParameter("@phone1", serviceprovider.SRP_Phone1);
            AddParameter("@phone2", serviceprovider.SRP_Phone2);
            AddParameter("@rating", serviceprovider.SRP_Rating);
            AddParameter("@referredby", serviceprovider.SRP_ReferredBy);
            AddParameter("@specialization", serviceprovider.SRP_Specialization);

            AddParameter("@createdon", serviceprovider.SRP_CreatedOn);
            AddParameter("@createduserid", serviceprovider.SRP_CreatedUserID);
            AddParameter("@createdroleid", serviceprovider.SRP_CreatedRoleID);

            return this.ExecuteScalar("usp_AddServiceProvider");
        }

        public List<ServiceProvidersModel> ServiceProvidersList(ServiceProvidersModel serviceprovider)
        {
            AddParameter("@communityid", serviceprovider.CommunityID);
            DataTable Dt_ServiceProvidersList = GetDataTable("usp_GetServiceProvidersList");
            serviceProvidersList = new List<ServiceProvidersModel>();

            if (Dt_ServiceProvidersList.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_ServiceProvidersList.Rows)
                {
                    serviceProviderObj = new ServiceProvidersModel();

                    serviceProviderObj.ServiceProviderID = Convert.ToInt64(dr["ServiceProviderID"].ToString());

                    serviceProviderObj.EmailID = dr["UserName"].ToString();
                    serviceProviderObj.SRP_HintQuestionID = Convert.ToByte(dr["HintQuestionID"].ToString());
                    serviceProviderObj.SRP_HintQuestion = dr["HintQuestion"].ToString();
                    serviceProviderObj.SRP_Hint = dr["Hint"].ToString();
                    serviceProviderObj.VFCode = dr["VFCode"].ToString();
                    serviceProviderObj.UserStatus = Convert.ToChar(dr["Status"]);
                    serviceProviderObj.UserID = Convert.ToInt64(dr["UserID"].ToString());
                    serviceProviderObj.Password = dr["Password"].ToString();
                    serviceProviderObj.RoleID = Convert.ToByte(dr["RoleID"].ToString());
                    serviceProviderObj.Role = dr["Role"].ToString();

                    serviceProviderObj.CommunityID = Convert.ToInt16(dr["CommunityID"].ToString());
                    serviceProviderObj.CommunityName = dr["CommunityName"].ToString();
                    serviceProviderObj.CommunityAddress = dr["CommunityAddress"].ToString();
                    serviceProviderObj.City = dr["City"].ToString();
                    serviceProviderObj.Zip = dr["Zip"].ToString();
                    serviceProviderObj.State = dr["State"].ToString();
                    serviceProviderObj.Country = dr["Country"].ToString();
                    serviceProviderObj.CommunityPhone1 = dr["CommunityPhone1"].ToString();
                    serviceProviderObj.CommunityPhone2 = dr["CommunityPhone2"].ToString();
                    serviceProviderObj.CommunityEmail = dr["CommunityEmail"].ToString();
                    serviceProviderObj.TotalUnits = Convert.ToByte(dr["TotalUnits"].ToString());
                    serviceProviderObj.MaxGates = Convert.ToByte(dr["MaxGates"].ToString());
                    serviceProviderObj.MenuOptions = dr["MenuOptions"].ToString();
                                     
                    serviceProviderObj.SRP_Name =  dr["Name"].ToString();
                    serviceProviderObj.SRP_ServiceTypes=  dr["ServiceTypes"].ToString();
                    serviceProviderObj.SRP_ContactPerson =  dr["ContactPerson"].ToString();                   
                    serviceProviderObj.SRP_Phone1 = dr["Phone1"].ToString();
                    serviceProviderObj.SRP_Phone2 =  dr["Phone2"].ToString();
                    serviceProviderObj.SRP_Address= dr["Address"].ToString();                     
                    serviceProviderObj.SRP_Rating = dr["Rating"].ToString();
                    serviceProviderObj.SRP_Specialization = dr["Specialization"].ToString();
                    serviceProviderObj.SRP_ReferredBy = dr["ReferredBy"].ToString();

                    serviceProviderObj.SRP_CreatedOn = Convert.ToDateTime(dr["CreatedOn"].ToString());
                    serviceProviderObj.SRP_CreatedUserID = Convert.ToInt64(dr["CreatedUserID"].ToString());
                    serviceProviderObj.SRP_CreatedRoleID = Convert.ToByte(dr["CreatedRoleID"].ToString());
                    
                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))
                    {
                        serviceProviderObj.SRP_ModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());
                        serviceProviderObj.SRP_ModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        serviceProviderObj.SRP_ModifiedRoleID = Convert.ToByte(dr["ModifiedRoleID"].ToString());
                    }

                    serviceProvidersList.Add(serviceProviderObj);
                }
            }
            return serviceProvidersList;
        }

        internal ServiceProvidersModel ServiceProviderDetails(ServiceProvidersModel serviceprovider)
        {
            AddParameter("@serviceproviderid", serviceprovider.ServiceProviderID);
            AddParameter("@communityid", serviceprovider.CommunityID);
            DataTable Dt_ServiceProviderDetails = this.GetDataTable("usp_GetServiceProviderDetails");


            if (Dt_ServiceProviderDetails.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_ServiceProviderDetails.Rows)
                {
                    serviceProviderDetails = new ServiceProvidersModel();

                    serviceProviderDetails.ServiceProviderID = Convert.ToInt64(dr["ServiceProviderID"].ToString());

                    serviceProviderDetails.EmailID = dr["UserName"].ToString();
                    serviceProviderDetails.SRP_HintQuestionID = Convert.ToByte(dr["HintQuestionID"].ToString());
                    serviceProviderDetails.SRP_HintQuestion = dr["HintQuestion"].ToString();
                    serviceProviderDetails.SRP_Hint = dr["Hint"].ToString();
                    serviceProviderDetails.VFCode = dr["VFCode"].ToString();
                    serviceProviderDetails.UserStatus = Convert.ToChar(dr["Status"]);
                    serviceProviderDetails.UserID = Convert.ToInt64(dr["UserID"].ToString());
                    serviceProviderDetails.Password = dr["Password"].ToString();
                    serviceProviderDetails.RoleID = Convert.ToByte(dr["RoleID"].ToString());
                    serviceProviderDetails.Role = dr["Role"].ToString();

                    serviceProviderDetails.CommunityID = Convert.ToInt16(dr["CommunityID"].ToString());
                    serviceProviderDetails.CommunityName = dr["CommunityName"].ToString();
                    serviceProviderDetails.CommunityAddress = dr["CommunityAddress"].ToString();
                    serviceProviderDetails.City = dr["City"].ToString();
                    serviceProviderDetails.Zip = dr["Zip"].ToString();
                    serviceProviderDetails.State = dr["State"].ToString();
                    serviceProviderDetails.Country = dr["Country"].ToString();
                    serviceProviderDetails.CommunityPhone1 = dr["CommunityPhone1"].ToString();
                    serviceProviderDetails.CommunityPhone2 = dr["CommunityPhone2"].ToString();
                    serviceProviderDetails.CommunityEmail = dr["CommunityEmail"].ToString();
                    serviceProviderDetails.TotalUnits = Convert.ToByte(dr["TotalUnits"].ToString());
                    serviceProviderDetails.MaxGates = Convert.ToByte(dr["MaxGates"].ToString());
                    serviceProviderDetails.MenuOptions = dr["MenuOptions"].ToString();
                    
                    serviceProviderDetails.SRP_Name = dr["Name"].ToString();
                    serviceProviderDetails.SRP_ServiceTypes = dr["ServiceTypes"].ToString();
                    serviceProviderDetails.SRP_ContactPerson = dr["ContactPerson"].ToString();                   
                    serviceProviderDetails.SRP_Phone1 = dr["Phone1"].ToString();
                    serviceProviderDetails.SRP_Phone2 = dr["Phone2"].ToString();
                    serviceProviderDetails.SRP_Address = dr["Address"].ToString();                  
                    serviceProviderDetails.SRP_Rating = dr["Rating"].ToString();
                    serviceProviderDetails.SRP_Specialization = dr["Specialization"].ToString();
                    serviceProviderDetails.SRP_ReferredBy = dr["ReferredBy"].ToString();                  

                    serviceProviderDetails.SRP_CreatedOn = Convert.ToDateTime(dr["CreatedOn"].ToString());
                    serviceProviderDetails.SRP_CreatedUserID = Convert.ToInt64(dr["CreatedUserID"].ToString());
                    serviceProviderDetails.SRP_CreatedRoleID = Convert.ToByte(dr["CreatedRoleID"].ToString());

                    if (!String.IsNullOrEmpty(dr["ModifiedOn"].ToString()))
                    {
                        serviceProviderDetails.SRP_ModifiedOn = Convert.ToDateTime(dr["ModifiedOn"].ToString());
                        serviceProviderDetails.SRP_ModifiedUserID = Convert.ToInt64(dr["ModifiedUserID"].ToString());
                        serviceProviderDetails.SRP_ModifiedRoleID = Convert.ToByte(dr["ModifiedRoleID"].ToString());
                    }
                }
            }
            return serviceProviderDetails;
        }

        internal ServiceProvidersModel EditServiceProvider(ServiceProvidersModel serviceprovider)
        {
            return this.ServiceProviderDetails(serviceprovider);
        }

        internal object UpdateServiceProvider(ServiceProvidersModel serviceprovider)
        {
            AddParameter("@serviceproviderid", serviceprovider.ServiceProviderID);
            AddParameter("@communityid", serviceprovider.CommunityID);

            AddParameter("@password", serviceprovider.Password);
            AddParameter("@hintquestionid", serviceprovider.SRP_HintQuestionID);
            AddParameter("@hint", serviceprovider.SRP_Hint);

            AddParameter("@name", serviceprovider.SRP_Name);
            AddParameter("@servicetypes", serviceprovider.SRP_ServiceTypes);
            AddParameter("@contactperson", serviceprovider.SRP_ContactPerson);        
            AddParameter("@phone1", serviceprovider.SRP_Phone1);
            AddParameter("@phone2", serviceprovider.SRP_Phone2);
            AddParameter("@address", serviceprovider.SRP_Address);          
            AddParameter("@rating", serviceprovider.SRP_Rating);
            AddParameter("@referredby", serviceprovider.SRP_ReferredBy);
            AddParameter("@specialization", serviceprovider.SRP_Specialization);

            AddParameter("@modifiedon", serviceprovider.SRP_ModifiedOn);
            AddParameter("@modifieduserid", serviceprovider.SRP_ModifiedUserID);
            AddParameter("@modifiedroleid", serviceprovider.SRP_ModifiedRoleID);

            return this.ExecuteScalar("usp_UpdateServiceProvider");
        }

        internal Object DeleteServiceProvider(ServiceProvidersModel serviceprovider)
        {
            AddParameter("@serviceproviderid", serviceprovider.ServiceProviderID);
            AddParameter("@communityid", serviceprovider.CommunityID);

            AddParameter("@modifiedon", serviceprovider.SRP_ModifiedOn);
            AddParameter("@modifieduserid", serviceprovider.SRP_ModifiedUserID);
            AddParameter("@modifiedroleid", serviceprovider.SRP_ModifiedRoleID);

            return ExecuteScalar("usp_DeleteServiceProvider");
        }

        internal string DeleteServiceProviders(List<ServiceProvidersModel> serviceproviderslist)
        {
            throw new NotImplementedException();
        }

        internal void NewServiceProviderCommunity(ref ServiceProvidersModel serviceprovider)
        {
            CommunitiesModel community = new CommunitiesModel();
            CommunitiesModel communityDetails = new CommunitiesModel();

            community.CommunityID = serviceprovider.CommunityID;
            CommunitiesDAL communitiesDAL = new CommunitiesDAL();
            communityDetails = communitiesDAL.CommunityDetails(community);

            serviceprovider.CommunityName = communityDetails.CommunityName;
            serviceprovider.CommunityAddress = communityDetails.CommunityAddress;
            serviceprovider.City = communityDetails.City;
            serviceprovider.Zip = communityDetails.Zip;
            serviceprovider.State = communityDetails.State;
            serviceprovider.Country = communityDetails.Country; 
        }
    }
}