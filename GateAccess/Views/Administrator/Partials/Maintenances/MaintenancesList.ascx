<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<div style="width: 100%">
    <div style="text-align: left">
        <div id="Div_ActionInformation" style="color: #800000; font-weight: bold">
        </div>
    </div>
</div><br />
<%if (ViewBag.MaintenancesList != null && (((List<GateAccess.Models.MaintenancesModel>)ViewBag.MaintenancesList).Count > 0))
  {%><div class="divTable-titleRow">
      <div class="divTable-titleCell">
          <img id="maintenancesRefresh" src="<%: Url.Content("~/Images/refresh.png")%>" alt="refresh"
              style="cursor: pointer" height="16px" width="16px" onmousedown="this.src='<%: Url.Content("~/Images/refreshclick.png")%>'"
              onmouseup="this.src='<%: Url.Content("~/Images/refresh.png")%>'" />
          &nbsp;&nbsp;&nbsp;Maintenances List &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
      </div>
  </div>
<div id="Div_MaintenancesListTable">
    <% Html.RenderPartial("Partials/Maintenances/MaintenancesListTable"); %></div>
<%}
  else
  {%><br />
<span style="color: #FF0000">No Maintenances were Registered..</span>
<%}
%>
