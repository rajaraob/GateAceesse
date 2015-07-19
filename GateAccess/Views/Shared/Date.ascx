<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ OutputCache Duration="86400" VaryByParam="none"%>
<%String[] Date = DateTime.Now.ToLongDateString().Split(',');%>
  <span style="font-size: 13px; font-family: Arial; font-variant: normal"><%Response.Write(Date[1] + ", " + Date[2]);%></span>
  
