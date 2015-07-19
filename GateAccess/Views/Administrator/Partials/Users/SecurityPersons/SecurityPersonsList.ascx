<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<div style="width: 100%">
    <div style="text-align: left">
        <div id="Div_ActionInformation" style="color: #800000; font-weight: bold">
        </div>
    </div>
    <div style="text-align: right">
        <img id="NewSecurityPerson" src="<%:Url.Content("~/Images/newsecurityperson.png")%>"
            alt="New SecurityPersonnel" style="cursor: pointer" align="right" onmousedown="this.src='<%:Url.Content("~/Images/newsecuritypersonclick.png")%>'"
            onmouseup="this.src='<%:Url.Content("~/Images/newsecurityperson.png")%>'" />
    </div>
</div>
<% if (ViewBag.SecurityPersonnelsList != null && ((List<GateAccess.Models.SecurityPersonnelsModel>)ViewBag.SecurityPersonnelsList).Count > 0)
   {%>
<div class="divTable-titleRow">
    <div class="divTable-titleCell">
        <img id="securityPersonnelsRefresh" src="<%: Url.Content("~/Images/refresh.png")%>"
            alt="refresh" width="16px" height="16px" onmousedown="this.src='<%:Url.Content("~/Images/refreshclick.png")%>'"
            style="cursor: pointer" onmouseup="this.src='<%:Url.Content("~/Images/refresh.png")%>'" />
        &nbsp;&nbsp;&nbsp;SecurityPersonnels List&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
</div>
<div id="Div_SecurityPersonnelsListTable">
    <% Html.RenderPartial("Partials/Users/SecurityPersonnels/SecurityPersonnelsListTable"); %></div>
<%}
   else
   {%><br />
<span style="color: #FF0000">No SecurityPersonnel(s) were Registered..</span>
<%}
%>