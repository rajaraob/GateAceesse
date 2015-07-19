<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<dynamic>>" %>
<%Int32? newSecurityPersonID = null;

  if (ViewBag.NewSecurityPersonID != null)
      newSecurityPersonID = Int32.Parse(ViewBag.NewSecurityPersonID.ToString());

  if (ViewBag.SecurityPersonnelsList != null && ((List<GateAccess.Models.SecurityPersonnelsModel>)ViewBag.SecurityPersonnelsList).Count > 0)
  {
      using (Html.BeginForm("", "", FormMethod.Post, new { id = "SecurityPersonnelsList" }))
      {%>
<div class="divTable-body">
    <div class="divTable-headerRow">
        <div class="divTable-headerCell" style="width: 15%">
            First Name
        </div>
        <div class="divTable-headerCell" style="width: 15%">
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
        <div class="divTable-headerCell" style="width: 10%">
            <input type="checkbox" id="CheckAll" title="Select All" />
        </div>
    </div>
    <% foreach (var Item in (List<GateAccess.Models.SecurityPersonnelsModel>)ViewBag.SecurityPersonnelsList)
       {
    %>
    <div id="securityPersonnel<%=Item.SecurityPersonnelID%>" class="divTable-row">
        <div style="width: 15%" class="divTable-labelCell">
            &nbsp;&nbsp; <a name="<%= Item.SecurityPersonnelID%>" class="securityPersonnelDetails"
                style="color: #0000FF; cursor: pointer">
                <%= Item.FirstName%></a>
        </div>
        <div style="width: 15%" class="divTable-labelCell">
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
        <div style="width: 10%" class="divTable-labelCell" align="center">
            <a name="<%=Item.SecurityPersonnelID%>" class="EditSecurityPersonnel">
                <img src="<%: Url.Content("~/Images/edit.png")%>" alt="Edit" onmousedown="editclick(this)"
                    style="cursor: pointer" onmouseup="unclickedit(this)" /></a>
        </div>
        <div style="width: 10%" class="divTable-labelCell" align="center">
            <input name="SecurityPersonnelsToDelete" id="SecurityPersonnelsToDelete" type="checkbox"
                value="<%=Item.SecurityPersonnelID%>" />
            <%-- <img src="<%: Url.Content("~/Images/delete.png")%>" title="" <%= Item.FirstName%>
                        alt="Delete" name="<%=Item.SecurityPersonnelID%>" class='delete' onclick='.delete'
                        onmousedown="deleteclick(this)" onmouseup="unclickdelete(this)" />--%>
        </div>
    </div>
    <% } %>
</div>
<div align="right">
    <input type="submit" id="Btn_DeleteSecurityPersonnels" value="Delete SecurityPersonnel(s)" disabled="disabled" />
</div>
<div id="Div_Operations">
</div>
<%
      }
  }
  else
  {%><br />
<span style="color: #FF0000">No Security Persons were Registered..</span>
<%} %>
