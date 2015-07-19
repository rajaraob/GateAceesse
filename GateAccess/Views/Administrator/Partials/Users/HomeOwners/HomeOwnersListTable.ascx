<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<dynamic>>" %>
<%Int32? newHomeOwnerID = null;
  if (ViewBag.NewHomeOwnerID != null)
      newHomeOwnerID = Int32.Parse(ViewBag.NewHomeOwnerID.ToString());

  if (ViewBag.HomeOwnersList != null && ((List<GateAccess.Models.HomeOwnersModel>)ViewBag.HomeOwnersList).Count > 0)
  {
      using (Html.BeginForm("", "", FormMethod.Post, new { id = "HomeOwnersList" }))
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
    <% foreach (var Item in (List<GateAccess.Models.HomeOwnersModel>)ViewBag.HomeOwnersList)
       {          
    %>
    <div id="homeOwner<%=Item.HomeOwnerID%>" class="divTable-row">
        <div style="width: 15%" class="divTable-labelCell">
            &nbsp;&nbsp; <a name="<%= Item.HomeOwnerID%>" class="homeOwnerDetails" style="color: #0000FF;
                cursor: pointer">
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
        <div style="width: 10%" align="center" class="divTable-labelCell">
            <img src="<%: Url.Content("~/Images/edit.png")%>" alt="Edit" class="editHomeOwner" name="<%=Item.HomeOwnerID%>"
                onmousedown="editclick(this)" onmouseup="unclickedit(this)" style="cursor: pointer" />
        </div>
        <div style="width: 10%" align="center" class="divTable-labelCell">
            <input name="HomeOwnersToDelete" id="HomeOwnersToDelete" type="checkbox" value="<%=Item.HomeOwnerID%>" />
            <%--  <img src="<%: Url.Content("~/Images/delete.png")%>" title="<%= Item.FirstName%>" alt="Delete"
                            name="<%=Item.HomeOwnerID%>" class='delete' onclick='.delete' onmousedown="deleteclick(this)"
                            onmouseup="unclickdelete(this)" />--%>
        </div>
    </div>
    <% } %>
</div>
<div align="right">
    <input type="submit" id="Btn_DeleteHomeOwners" value="Delete HomeOwner(s)" disabled="disabled" />
</div>
<br />
<div id="Div_Operations">
</div>
<%}
  }
  else
  {%>
<span style="color: #FF0000">No Home Owner(s) were Registered..</span>
<%} %>
