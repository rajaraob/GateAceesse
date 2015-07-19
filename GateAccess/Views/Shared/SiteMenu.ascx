<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<ul id="menu">
    <li>
        <%: Html.ActionLink("Home", "Default", "Home")%>   
     </li>
    <li>
        <%: Ajax.ActionLink("About", "About", "Home", new AjaxOptions { UpdateTargetId = "main", InsertionMode = InsertionMode.Replace, HttpMethod = "GET", OnBegin = "aboutAjaxBegin", OnSuccess="aboutAjaxSuccess" })%></li>
</ul>
