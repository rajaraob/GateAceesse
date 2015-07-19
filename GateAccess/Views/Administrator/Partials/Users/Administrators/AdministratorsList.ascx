<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<div style="width: 100%">
    <div style="text-align: left">
        <div id="Div_ActionInformation" style="color: #800000; font-weight: bold">
        </div>
    </div>
    <div style="text-align: right">
        <img src="<%: Url.Content("~/Images/newadministrator.png")%>" id="NewAdministrator"
            alt="New Administrator" style="cursor: pointer" align="right" onmousedown="this.src='<%:Url.Content("~/Images/newadministratorclick.png")%>'"
            onmouseup="this.src='<%:Url.Content("~/Images/newadministrator.png")%>'" />
    </div>
</div>
<% if (ViewBag.AdministratorsList != null && ((List<GateAccess.Models.AdministratorsModel>)ViewBag.AdministratorsList).Count > 0)
   {%>
<div class="divTable-titleRow">
    <div class="divTable-titleCell">
        <img id="administratorsRefresh" src="<%: Url.Content("~/Images/refresh.png")%>" alt="refresh"
            style="cursor: pointer" width="16px" height="16px" onmousedown="this.src='<%:Url.Content("~/Images/refreshclick.png")%>'"
            onmouseup="this.src='<%:Url.Content("~/Images/refresh.png")%>'" />
        &nbsp;&nbsp;&nbsp;Administrators List&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
</div>
<div id="Div_AdministratorsListTable">
    <% Html.RenderPartial("Partials/Users/Administrators/AdministratorsListTable"); %>
</div>
<%}
   else
   {%><br />
<span style="color: #FF0000">No Administrator(s) were Registered..</span>
<%}
%>