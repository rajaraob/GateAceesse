<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<GateAccess.Models.HomeOwnersModel>>" %>
<div id="Div_ActionInformation" style="color: #800000; font-weight: bold">
</div>
<br />
<div class="divTable-titleRow">
    <div class="divTable-titleCell">
        &nbsp;&nbsp;HomeOwners List
    </div>
    <div align="right">
        <a id="homeOwnersRefresh" style="color: Blue; cursor: pointer;">Refresh</a>&nbsp;&nbsp;|&nbsp;&nbsp;
        <a id="NewHomeOwner" style="color: Blue; cursor: pointer">New HomeOwner</a>&nbsp;&nbsp;
    </div>
</div>
<div id="Div_HomeOwnersListTable">
    <% Html.RenderPartial("Partials/Users/HomeOwners/HomeOwnersListTable"); %></div>
