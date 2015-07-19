<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div align="right">
    <%Html.RenderPartial("Date");%></div>
Welcome!
<%
    HttpCookie useMyCookie = Request.Cookies.Get("myCookie");
    if (useMyCookie != null)
    {    
%>
<strong>
    <%if (useMyCookie["FirstName"] != null)
          Response.Write(useMyCookie["FirstName"].ToString());

      else if (useMyCookie["Name"] != null)
          Response.Write(useMyCookie["Name"].ToString());
              
    %></strong><br />
<%: Html.ActionLink("LogOut", "LogOff", "Account")%>
<%        
    }
    else
    {                
%>
Guest<br />
<%: Ajax.ActionLink("LogIn", "LogOn", "Account", new AjaxOptions() { HttpMethod = "Get", UpdateTargetId = "main", InsertionMode = InsertionMode.Replace, OnBegin = "loginAjaxBegin", OnSuccess = "loginAjaxSuccess" })%>
<%--<%: Ajax.ActionLink("LogIn", "LogOn", "Account", null, new { ID = "LoginLink" })%>--%>
<%
    }
%>
