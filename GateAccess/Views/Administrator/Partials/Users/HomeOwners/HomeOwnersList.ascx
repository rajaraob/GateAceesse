<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<div style="width: 100%">
    <div style="text-align: left">
        <div id="Div_ActionInformation" style="color: #800000; font-weight: bold">
        </div>
    </div>
    <div style="text-align: right">
        <img id="NewHomeOwner" src="<%: Url.Content("~/Images/newhomeowner.png")%>" alt="New HomeOwner" align="right"
            style="cursor: pointer" onmousedown="this.src='<%:Url.Content("~/Images/newhomeownerclick.png")%>'"
            onmouseup="this.src='<%:Url.Content("~/Images/newhomeowner.png")%>'" />
    </div>
</div>
<% if (ViewBag.HomeOwnersList != null && ((List<GateAccess.Models.HomeOwnersModel>)ViewBag.HomeOwnersList).Count > 0)
   {%><br />
<br />
<div class="divTable-titleRow">
    <div class="divTable-titleCell">
        <img id="homeOwnersRefresh" src="<%: Url.Content("~/Images/refresh.png")%>" alt="refresh"
            style="cursor: pointer" width="16px" height="16px" onmousedown="src='<%: Url.Content("~/Images/refreshclick.png")%>'"
            onmouseup="src='<%: Url.Content("~/Images/refresh.png")%>'" />
        &nbsp;&nbsp;&nbsp;HomeOwners List&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
</div>
<div id="Div_HomeOwnersListTable">
    <% Html.RenderPartial("Partials/Users/HomeOwners/HomeOwnersListTable"); %></div>
<%}
   else
   {%><br />
<span style="color: #FF0000">No HomeOwner(s) were Registered..</span>
<%}
%>