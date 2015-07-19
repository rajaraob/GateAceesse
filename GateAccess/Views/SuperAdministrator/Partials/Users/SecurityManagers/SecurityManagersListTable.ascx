<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<GateAccess.Models.SecurityManagersModel>>" %>
<%Int32 opSecurityManagerID = 0;
  if (Session["NewSecurityManagerID"] != null)
  {
      Int32.TryParse(Session["NewSecurityManagerID"].ToString(), out opSecurityManagerID);
      Session.Remove("NewSecurityManagerID");
  }

  if (Session["UpdatedSecurityManagerID"] != null)
  {
      Int32.TryParse(Session["UpdatedSecurityManagerID"].ToString(), out opSecurityManagerID);
      Session.Remove("UpdatedSecurityManagerID");
  }

  if (Model != null && Model.Count() > 0)
  {
%>
<div class="divTable-body">
    <div class="divTable-headerRow">
        <div class="divTable-headerCell" style="width: 5%">
            &nbsp;
        </div>
        <div class="divTable-headerCell" style="width: 17%">
            First Name
        </div>
        <div class="divTable-headerCell" style="width: 15%">
            Last Name
        </div>
        <div class="divTable-headerCell" style="width: 17%">
            Mobile
        </div>
        <div class="divTable-headerCell" style="width: 18%">
            Home Phone
        </div>
        <div class="divTable-headerCell" style="width: 18%">
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
    <div id="securityManager<%=Item.SecurityManagerID%>" class="divTable-row">
        <div style="width: 5%" align="center" class="divTable-labelCell">
            <img src="<%: Url.Content("~/Images/edit.png")%>" alt="Edit" name="<%=Item.SecurityManagerID%>"
                class="editSecurityManager" onmousedown="editclick(this)" style="cursor: pointer"
                onmouseup="unclickedit(this)" />
        </div>
        <div style="width: 17%" class="divTable-labelCell">
            &nbsp;&nbsp;<%= Item.SM_FirstName%></a>
        </div>
        <div style="width: 15%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.SM_LastName%>
        </div>
        <div style="width: 17%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.SM_Mobile%>
        </div>
        <div style="width: 18%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.SM_HomePhone%>
        </div>
        <div style="width: 18%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.City%>
        </div>
        <div style="width: 5%" align="center" class="divTable-labelCell">
            <input name="SecurityManagersToDelete" id="SecurityManagersToDelete" type="checkbox"
                value="<%=Item.SecurityManagerID%>" />
        </div>
    </div>
    <% } %>
</div>
<div align="right">
    <input type="submit" id="Btn_DeleteSecurityManagers" value="Delete SecurityManager(s)"
        disabled="disabled" />
</div>
<div id="Div_EditSecurityManager">
</div>
<%}
  else
  {%><br />
<span style="color: #FF0000">No Security Manager(s) were Registered..</span>
<%}
%>
