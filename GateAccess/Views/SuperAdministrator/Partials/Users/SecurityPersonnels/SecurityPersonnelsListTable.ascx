<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<GateAccess.Models.SecurityPersonnelsModel>>" %>
<%Int32 opSecurityPersonnelID = 0;
  if (Session["NewSecurityPersonnelID"] != null)
  {
      Int32.TryParse(Session["NewSecurityPersonnelID"].ToString(), out opSecurityPersonnelID);
      Session.Remove("NewSecurityPersonnelID");
  }

  if (Session["UpdatedSecurityPersonnelID"] != null)
  {
      Int32.TryParse(Session["UpdatedSecurityPersonnelID"].ToString(), out opSecurityPersonnelID);
      Session.Remove("UpdatedSecurityPersonnelID");
  }
    
  if (Model != null && Model.Count() > 0)
  {
%>
<div class="divTable-body">
    <div class="divTable-headerRow">
        <div class="divTable-headerCell" style="width: 5%">&nbsp;
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
        <div class="divTable-headerCell" style="width: 5%">&nbsp;&nbsp;
            <input type="checkbox" id="CheckAll" title="Select All" />
        </div>
    </div>
    <% foreach (var Item in Model)
       {
    %>
    <div id="securityPersonnel<%=Item.SecurityPersonnelID%>" class="divTable-row">
        <div style="width: 5%" class="divTable-labelCell" align="center">
            <a name="<%=Item.SecurityPersonnelID%>" class="editSecurityPersonnel">
                <img src="<%: Url.Content("~/Images/edit.png")%>" alt="Edit" onmousedown="editclick(this)"
                    style="cursor: pointer" onmouseup="unclickedit(this)" /></a>
        </div>
        <div style="width: 15%" class="divTable-labelCell">
            &nbsp;&nbsp;<%= Item.SP_FirstName%>
        </div>
        <div style="width: 15%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.SP_LastName%>
        </div>
        <div style="width: 20%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.SP_Mobile%>
        </div>
        <div style="width: 20%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.SP_HomePhone%>
        </div>
        <div style="width: 15%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.City%>
        </div>
        <div style="width: 5%" class="divTable-labelCell" align="center">
            <input name="SecurityPersonnelsToDelete" id="SecurityPersonnelsToDelete" type="checkbox"
                value="<%=Item.SecurityPersonnelID%>" />
        </div>
    </div>
    <% } %>
</div>
<div align="right">
    <input type="submit" id="Btn_DeleteSecurityPersonnels" value="Delete SecurityPersonnel(s)"
        disabled="disabled" />
</div>
<div id="Div_EditSecurityPersonnel">
</div>
<%}
  else
  {%><br />
<span style="color: #FF0000">No Security Personnel(s) were Registered..</span>
<%} %>
