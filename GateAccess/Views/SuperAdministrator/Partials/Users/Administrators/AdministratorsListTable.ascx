<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<GateAccess.Models.AdministratorsModel>>" %>
<%  Int32 opAdministratorID = 0;
    if (Session["NewAdministratorID"] != null)
    {
        Int32.TryParse(Session["NewAdministratorID"].ToString(), out opAdministratorID);
        Session.Remove("NewAdministratorID");
    }

    if (Session["UpdatedAdministratorID"] != null)
    {
        Int32.TryParse(Session["UpdatedAdministratorID"].ToString(), out opAdministratorID);
        Session.Remove("UpdatedAdministratorID");
    }

    if (Model != null && Model.Count() > 0)
    {     
%>
<div class="divTable-body">
    <div class="divTable-headerRow">
        <div class="divTable-headerCell"  style="width: 5%">&nbsp;
        </div>
        <div class="divTable-headerCell" style="width: 20%">
            First Name
        </div>
        <div class="divTable-headerCell" style="width: 20%">
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
        <div class="divTable-headerCell" align="center" style="width: 5%">&nbsp;&nbsp;
            <input type="checkbox" id="CheckAll" title="Select All" />
        </div>
    </div>
    <% foreach (var Item in Model)
       {    
    %>
    <div id="administrator<%=Item.AdministratorID%>" class="divTable-row">
        <div style="width: 5%" align="center" class="divTable-labelCell">
            <img src="<%: Url.Content("~/Images/edit.png")%>" name="<%=Item.AdministratorID%>" class="editAdministrator"
                alt="Edit" onmousedown="editclick(this)" onmouseup="unclickedit(this)" style="cursor: pointer" />
        </div>
        <div style="width: 20%" class="divTable-labelCell">
            &nbsp;&nbsp;<%= Item.Admin_FirstName%>
        </div>
        <div style="width: 20%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.Admin_LastName%>
        </div>
        <div style="width: 15%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.Admin_Mobile%>
        </div>
        <div style="width: 15%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.Admin_HomePhone%>
        </div>
        <div style="width: 15%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.City%>
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
        disabled="disabled" />
</div>
<div id="Div_EditAdministrator">
</div>
<%}
    else
    {%><br />
<span style="color: #FF0000">No Administrator(s) were Registered for the Community..</span>
<%} %>
