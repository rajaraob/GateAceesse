<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<GateAccess.Models.SecurityManagersModel>>" %>
<div id="Div_ActionInformation" style="color: #800000; font-weight: bold">
</div>
<br />
<div class="divTable-titleRow">
    <div class="divTable-titleCell">
        &nbsp;&nbsp;SecurityManagers List
    </div>
    <div align="right">
        <a id="securityManagersRefresh" style="color: Blue; cursor: pointer;">Refresh</a>&nbsp;&nbsp;|&nbsp;&nbsp;
        <a id="NewSecurityManager" style="color: Blue; cursor: pointer">New SecurityManager</a>&nbsp;&nbsp;
    </div>
</div>
<div id="Div_SecurityManagersListTable">
    <% Html.RenderPartial("Partials/Users/SecurityManagers/SecurityManagersListTable"); %>
</div>
