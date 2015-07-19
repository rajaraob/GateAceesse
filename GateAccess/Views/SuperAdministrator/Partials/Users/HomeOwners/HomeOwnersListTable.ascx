<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<GateAccess.Models.HomeOwnersModel>>" %>
<%Int32 opHomeOwnerID = 0;
  if (Session["NewHomeOwnerID"] != null)
  {
      Int32.TryParse(Session["NewHomeOwnerID"].ToString(), out opHomeOwnerID);
      Session.Remove("NewHomeOwnerID");
  }

  if (Session["UpdatedHomeOwnerID"] != null)
  {
      Int32.TryParse(Session["UpdatedHomeOwnerID"].ToString(), out opHomeOwnerID);
      Session.Remove("UpdatedHomeOwnerID");
  }

  if (Model != null && Model.Count() > 0)
  {
%>
<div class="divTable-body">
    <div class="divTable-headerRow">
        <div class="divTable-headerCell" style="width: 5%">
            &nbsp;
        </div>
        <div class="divTable-headerCell" style="width: 15%">
            First Name
        </div>
        <div class="divTable-headerCell" style="width: 15%">
            Last Name
        </div>
        <div class="divTable-headerCell" style="width: 20%">
            Mobile
        </div>
        <div class="divTable-headerCell" style="width: 20%">
            Home Phone
        </div>
        <div class="divTable-headerCell" style="width: 15%">
            City
        </div>
        <div class="divTable-headerCell" style="width: 5%">
            &nbsp;&nbsp;
            <input type="checkbox" id="CheckAll" title="Select All" />
        </div>
    </div>
    <% foreach (var Item in Model)
       {          
    %>
    <div id="homeOwner<%=Item.HomeOwnerID%>" class="divTable-row">
        <div style="width: 5%" align="center" class="divTable-labelCell">
            <img src="<%: Url.Content("~/Images/edit.png")%>" alt="Edit" class="editHomeOwner"
                name="<%=Item.HomeOwnerID%>" onmousedown="editclick(this)" onmouseup="unclickedit(this)"
                style="cursor: pointer" />
        </div>
        <div style="width: 15%" class="divTable-labelCell">
            &nbsp;&nbsp; <a name="<%= Item.HomeOwnerID%>" class="homeOwnerDetails" style="color: #0000FF;
                cursor: pointer">
                <%= Item.HO_FirstName%></a>
        </div>
        <div style="width: 15%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.HO_LastName%>
        </div>
        <div style="width: 20%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.HO_Mobile%>
        </div>
        <div style="width: 20%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.HO_HomePhone%>
        </div>
        <div style="width: 15%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.City%>
        </div>
        <div style="width: 5%" align="center" class="divTable-labelCell">
            <input name="HomeOwnersToDelete" id="HomeOwnersToDelete" type="checkbox" value="<%=Item.HomeOwnerID%>" />
        </div>
    </div>
    <% } %>
</div>
<div align="right">
    <input type="submit" id="Btn_DeleteHomeOwners" value="Delete HomeOwner(s)" disabled="disabled" />
</div>
<br />
<div id="Div_EditHomeOwner">
</div>
<%}
  else
  {%>
<span style="color: #FF0000">No Home Owner(s) were Registered..</span>
<%} %>
