using System;
using System.Diagnostics;
using System.Web;
using System.Web.Security;

namespace GateAccess.Models.Helper
{
	public sealed class CookieHelper
	{
        private HttpRequestBase httpRequest;
        private HttpResponseBase httpResponse;
        private HttpCookie httpCookie;

        public CookieHelper(HttpRequestBase request,HttpResponseBase response)
		{
			httpRequest = request;
			httpResponse = response;
            if (request.Cookies["myCookie"] != null)
                httpCookie = request.Cookies["myCookie"];
            else
                httpCookie = new HttpCookie("myCookie");
		}

        public String UserID
        {
            set { }
            get { return httpCookie["UserID"].ToString(); }
        }

        public String RoleID
        {
            set { }
            get { return httpCookie["RoleID"].ToString(); }
        }

        public String UserName
        {
            set { }
            get { return httpCookie["UserName"].ToString(); }
        }

        public String FirstName
        {
            set { }
            get { return httpCookie["FirstName"].ToString(); }
        }

        public String CommunityID
        {
            set { }
            get { return httpCookie["CommunityID"].ToString(); }
        }

        public String CommunityName
        {
            set { }
            get { return httpCookie["CommunityName"].ToString(); }
        }

        public String CommunityMenuOptions
        {
            set { }
            get { return httpCookie["CommunityMenuOptions"].ToString(); }
        }

        public bool HttpOnly
        {
            get { return Convert.ToBoolean(httpCookie["HttpOnly"].ToString()); }
            set { }
        }

        public HttpCookie Cookie
        {
            get { return this.httpCookie; }
        }
        
        //[DebuggerStepThrough()]
        //public void SetLoginCookie(AccountModel model)
        //{
        //    if (httpResponse != null)
        //    {
        //        String userName = model.UserName;
        //        String password = model.Password;
        //       // Boolean isPersistent = model.RememberMe;

        //        if (isPersistent)
        //        {
        //            FormsAuthenticationTicket userAuthTicket = new FormsAuthenticationTicket(1, userName, DateTime.Now,DateTime.Now.AddDays(1), isPersistent, password, FormsAuthentication.FormsCookiePath);
        //            String encUserAuthTicket = FormsAuthentication.Encrypt(userAuthTicket);
        //            HttpCookie userAuthCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encUserAuthTicket);
        //            if (userAuthTicket.IsPersistent) userAuthCookie.Expires = userAuthTicket.Expiration;
        //            userAuthCookie.Path = FormsAuthentication.FormsCookiePath;
        //            httpResponse.Cookies.Add(userAuthCookie);
        //        }
        //        else
        //        {                    
        //            FormsAuthenticationTicket userAuthTicket = new FormsAuthenticationTicket(1, userName, DateTime.Now,DateTime.Now.AddHours(1), isPersistent, password, FormsAuthentication.FormsCookiePath);
        //            String encUserAuthTicket = FormsAuthentication.Encrypt(userAuthTicket);
        //            HttpCookie userAuthCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encUserAuthTicket);
        //            if (userAuthTicket.IsPersistent) userAuthCookie.Expires = userAuthTicket.Expiration;
        //            userAuthCookie.Path = FormsAuthentication.FormsCookiePath;
        //            httpResponse.Cookies.Add(userAuthCookie);
        //        }
        //    }
        //}
	}
}