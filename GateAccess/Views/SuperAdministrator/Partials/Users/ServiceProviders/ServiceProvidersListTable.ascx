<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<GateAccess.Models.ServiceProvidersModel>>" %>
<%Int32? newServiceProviderID = null;
  if (ViewBag.NewServiceProviderID != null)
      newServiceProviderID = Int32.Parse(ViewBag.NewServiceProviderID.ToString());

  if (Model != null && Model.Count() > 0)
  {
%>
<div class="divTable-body">
    <div class="divTable-headerRow">
        <div class="divTable-headerCell" style="width: 5%">
            &nbsp;
        </div>
        <div class="divTable-headerCell" style="width: 14%">
            Name
        </div>
        <div class="divTable-headerCell" style="width: 14%">
            ServiceTypes
        </div>
        <div class="divTable-headerCell" style="width: 14%">
            Address
        </div>
        <div class="divTable-headerCell" style="width: 14%">
            ContactPerson
        </div>
        <div class="divTable-headerCell" style="width: 14%">
            Phone
        </div>
        <div class="divTable-headerCell" style="width: 14%">
            Email
        </div>
        <div class="divTable-headerCell" style="width: 5%">
            &nbsp;&nbsp;
            <input type="checkbox" id="CheckAll" title="Select All" />
        </div>
    </div>
    <% foreach (var Item in Model)
       {         
    %>
    <div id="serviceProvider<%=Item.ServiceProviderID%>" class="divTable-row">
        <div style="width: 5%" class="divTable-labelCell" align="center">
            <img src="<%: Url.Content("~/Images/edit.png")%>" name="<%=Item.ServiceProviderID%>"
                alt="Edit" onmousedown="editclick(this)" class="editServiceProvider" style="cursor: pointer"
                onmouseup="unclickedit(this)" />
        </div>
        <div style="width: 14%" class="divTable-labelCell">
            <a name="<%= Item.ServiceProviderID%>" class="serviceProviderDetails" style="color: #0000FF;
                cursor: pointer">
                <%= Item.SRP_Name%></a>
        </div>
        <div style="width: 14%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.SRP_ServiceTypes%>
        </div>
        <div style="width: 14%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.SRP_Address%>
        </div>
        <div style="width: 14%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.SRP_ContactPerson%>
        </div>
        <div style="width: 14%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.SRP_Phone1%>
        </div>
        <div style="width: 14%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.EmailID%>
        </div>
        <div style="width: 5%" class="divTable-labelCell" align="center">
            <input name="ServiceProvidersToDelete" id="ServiceProvidersToDelete" type="checkbox"
                value="<%=Item.ServiceProviderID%>" />
        </div>
    </div>
    <% } %>
</div>
<div align="right">
    <input type="submit" id="Btn_DeleteServiceProviders" value="Delete ServiceProvider(s)"
        disabled="disabled" />
</div>
<div id="Div_EditServiceProvider">
</div>
<%}
  else
  {%><br />
<span style="color: #FF0000">No ServiceProvider(s) were Registered..</span>
<%} %>
