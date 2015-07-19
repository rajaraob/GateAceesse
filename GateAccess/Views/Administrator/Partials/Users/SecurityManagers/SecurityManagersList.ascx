<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<div style="width: 100%">
    <div style="text-align: left">
        <div id="Div_ActionInformation" style="color: #800000; font-weight: bold">
        </div>
    </div>
    <div style="text-align: right">
        <img id="NewSecurityManager" src="<%: Url.Content("~/Images/newsecuritymanager.png")%>" alt="New SecurityManager"
            align="right" onmousedown="this.src='<%:Url.Content("~/Images/newsecuritymanagerclick.png")%>'"
            onmouseup="this.src='<%:Url.Content("~/Images/newsecuritymanager.png")%>'" style="cursor: pointer" />
    </div>
</div>
<% if (ViewBag.SecurityManagersList != null && ((List<GateAccess.Models.SecurityManagersModel>)ViewBag.SecurityManagersList).Count > 0)
   {%>
<div class="divTable-titleRow">
    <div class="divTable-titleCell">
        <img id="securityManagersRefresh" src="<%: Url.Content("~/Images/refresh.png")%>"
            alt="refresh" width="16px" height="16px" onmousedown="this.src='<%:Url.Content("~/Images/refreshclick.png")%>'"
            style="cursor: pointer" onmouseup="this.src='<%:Url.Content("~/Images/refresh.png")%>'" />
        &nbsp;&nbsp;&nbsp;SecurityManagers List&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
</div>
<div id="Div_SecurityManagersListTable">
    <% Html.RenderPartial("Partials/Users/SecurityManagers/SecurityManagersListTable"); %>
</div>
<%}
   else
   {%><br />
<span style="color: #FF0000">No SecurityManager(s) were Registered..</span>
<%}
%>