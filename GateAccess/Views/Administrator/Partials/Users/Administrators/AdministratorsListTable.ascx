<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<GateAccess.Models.AdministratorsModel>>" %>
<%Int32? newAdministratorID = null;
  if (ViewBag.NewAdministratorID != null)
      newAdministratorID = Int32.Parse(ViewBag.NewAdministratorID.ToString());

  if (ViewBag.AdministratorsList != null && ((List<GateAccess.Models.AdministratorsModel>)ViewBag.AdministratorsList).Count > 0)
  {
      using (Html.BeginForm("", "", FormMethod.Post, new { id = "AdministratorsList" }))
      {%>
<div class="divTable-body">
    <div class="divTable-headerRow">
        <div class="divTable-headerCell" style="width: 18%">
            First Name
        </div>
        <div class="divTable-headerCell" style="width: 17%">
            Last Name
        </div>
        <div class="divTable-headerCell" style="width: 15%">
            Mobile
        </div>
        <div class="divTable-headerCell" style="width: 15%">
            Home Phone
        </div>
        <div class="divTable-headerCell" style="width: 15%">
            City
        </div>
        <div class="divTable-headerCell" style="width: 10%">
            Edit
        </div>
        <div class="divTable-headerCell" style="width: 5%">
            <input type="checkbox" id="CheckAll" title="Select All" />
        </div>
    </div>
    <% foreach (var Item in (List<GateAccess.Models.AdministratorsModel>)ViewBag.AdministratorsList)
       {    
    %>
    <div id="admin<%=Item.AdministratorID%>" class="divTable-row">
        <div style="width: 18%" class="divTable-labelCell">
            &nbsp;&nbsp;<a name="<%= Item.AdministratorID%>" class="administratorDetails" style="color: #0000FF;
                cursor: pointer" onmouseover="this.style.textDecoration='underline'" onmouseout="this.style.textDecoration='none'"><%= Item.FirstName%></a>
        </div>
        <div style="width: 17%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.LastName%>
        </div>
        <div style="width: 15%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.Mobile%>
        </div>
        <div style="width: 15%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.HomePhone%>
        </div>
        <div style="width: 15%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.City%>
        </div>
        <div style="width: 10%" align="center" class="divTable-labelCell">
            <a name="<%=Item.AdministratorID%>" class="editAdministrator">
                <img src="<%: Url.Content("~/Images/edit.png")%>" alt="Edit" onmousedown="editclick(this)"
                    onmouseup="unclickedit(this)" style="cursor: pointer" /></a>
        </div>
        <div style="width: 5%" align="center" class="divTable-labelCell">
            <input name="AdministratorsToDelete" id="AdministratorsToDelete" type="checkbox"
                value="<%=Item.AdministratorID%>" />
        </div>
    </div>
    <% } %>
</div>
<div align="right">
    <input type="submit" id="Btn_DeleteAdministrators" value="Delete Administrator(s)"
        disabled="disabled" /></div>
<div id="Div_Operations" style="height: auto;">
</div>
<%}
  }
  else
  {%><br />
<span style="color: #FF0000">No Administrator(s) were Registered for the Community..</span>
<%} %>
