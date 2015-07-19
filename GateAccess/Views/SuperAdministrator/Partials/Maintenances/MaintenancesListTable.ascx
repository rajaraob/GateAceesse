<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<GateAccess.Models.MaintenancesModel>>" %>
<%Int32? newMaintenanceID = null;
  if (ViewBag.NewMaintenanceID != null)
  {
      newMaintenanceID = Int32.Parse(ViewBag.NewMaintenanceID.ToString());
  }

  if (Model != null && Model.Count() > 0)
  //if (ViewBag.MaintenancesList != null && (((List<GateAccess.Models.MaintenancesModel>)ViewBag.MaintenancesList).Count > 0))
  {
      using (Html.BeginForm("", "", FormMethod.Post, new { id = "MaintenancesList" }))
      { %>
<div class="divTable-body">
    <div class="divTable-headerRow">
        <div class="divTable-headerCell" style="width: 20%">
            Request
        </div>
        <div class="divTable-headerCell" style="width: 15%">
            Created On
        </div>
        <div class="divTable-headerCell" style="width: 25%">
            Contact
        </div>
        <div class="divTable-headerCell" style="width: 25%">
            Email ID
        </div>
        <div class="divTable-headerCell" style="width: 5%">
            Edit
        </div>
        <div class="divTable-headerCell" style="width: 5%">
            <input type="checkbox" id="CheckAll" title="Select All" />
        </div>
    </div>
    <% foreach (var Item in Model)
       //foreach (var Item in (List<GateAccess.Models.MaintenancesModel>)ViewBag.MaintenancesList)
       {
    %>
    <div id="maintenance<%=Item.MaintenanceID%>" class="divTable-row">
        <div class="divTable-labelCell" style="width: 20%">
            <a class="maintenanceDetails" name="<%=Item.MaintenanceID%>" style="cursor: pointer;
                color: Blue;">
                <%= Item.Request%></a>
        </div>
        <div class="divTable-labelCell" style="width: 15%">
            <%= Item.CreatedOn%>
        </div>
        <div class="divTable-labelCell" style="width: 25%">
            <%= Item.Contact%>
        </div>
        <div class="divTable-labelCell" style="width: 25%">
            <%=Item.EmailID%>
        </div>
        <div class="divTable-labelCell" align="center" style="width: 5%">
            <img name="<%=Item.MaintenanceID%>" class="editMaintenance" src="<%: Url.Content("~/Images/edit.png")%>"
                style="cursor: pointer" alt="Edit" onmousedown="editclick(this)" onmouseup="unclickedit(this)" />
        </div>
        <div class="divTable-labelCell" align="center" style="width: 5%">
            <input name="MaintenancesToDelete" id="MaintenancesToDelete" type="checkbox" value="<%=Item.MaintenanceID%>" />
            <%--<img src="<%: Url.Content("~/Images/delete.png")%>" title="<%=Item.Request %>" alt="Delete"
                        name="<%=Item.MaintenanceID%>" class='delete' onclick='.delete' onmousedown="deleteclick(this)"
                        onmouseup="unclickdelete(this)" />--%>
        </div>
    </div>
    <% } %>
</div>
<div align="right">
    <input type="submit" id="Btn_DeleteMaintenances" disabled="disabled" value="Delete Maintenance(s)" />
</div>
<%} %>
<div id="Div_MaintenanceDetails">
</div>
<%}
  else
  {%><br />
<span style="color: #FF0000">No Maintenance(s) for this Community were Registered..</span>
<%} %>
