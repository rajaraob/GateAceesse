<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<dynamic>>" %>
<%Int32? newServiceProviderID = null;
  if (ViewBag.NewServiceProviderID != null)
      newServiceProviderID = Int32.Parse(ViewBag.NewServiceProviderID.ToString());

  if (ViewBag.ServiceProvidersList != null && ((List<GateAccess.Models.ServiceProvidersModel>)ViewBag.ServiceProvidersList).Count > 0)
  {
      using (Html.BeginForm("", "", FormMethod.Post, new { id = "ServiceProvidersList" }))
      {%>
<div class="divTable-body">
    <div class="divTable-headerRow">
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
            Edit
        </div>
        <div class="divTable-headerCell" style="width: 5%">
            <input type="checkbox" id="CheckAll" title="Select All" />
        </div>
    </div>
    <% foreach (var Item in (List<GateAccess.Models.ServiceProvidersModel>)ViewBag.ServiceProvidersList)
       {         
    %>
    <div id="serviceProvider<%=Item.ServiceProviderID%>" class="divTable-row">
        <div style="width: 14%" class="divTable-labelCell">
            <a name="<%= Item.ServiceProviderID%>" class="serviceProviderDetails" style="color: #0000FF;
                cursor: pointer">
                <%= Item.Name%></a>
        </div>
        <div style="width: 14%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.ServiceTypes%>
        </div>
        <div style="width: 14%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.Address%>
        </div>
        <div style="width: 14%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.ContactPerson%>
        </div>
        <div style="width: 14%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.Phone1%>
        </div>
        <div style="width: 14%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.EmailID%>
        </div>
        <div style="width: 5%" class="divTable-labelCell" align="center">
            <a name="<%=Item.ServiceProviderID%>" class="editServiceProvider">
                <img src="<%: Url.Content("~/Images/edit.png")%>" alt="Edit" onmousedown="editclick(this)"
                    style="cursor: pointer" onmouseup="unclickedit(this)" /></a>
        </div>
        <div style="width: 5%" class="divTable-labelCell" align="center">
            <input name="ServiceProvidersToDelete" id="ServiceProvidersToDelete" type="checkbox"
                value="<%=Item.ServiceProviderID%>" />
            <%--  <img src="<%: Url.Content("~/Images/delete.png")%>" title="<%= Item.FirstName%>" alt="Delete"
                            name="<%=Item.ServiceProviderID%>" class='delete' onclick='.delete' onmousedown="deleteclick(this)"
                            onmouseup="unclickdelete(this)" />--%>
        </div>
    </div>
    <% } %>
</div>
<div align="right">
    <input type="submit" id="Btn_DeleteServiceProviders" value="Delete ServiceProvider(s)"
        disabled="disabled" />
</div>
<div id="Div_Operations">
</div>
<%}
  }
  else
  {%><br />
<span style="color: #FF0000">No ServiceProvider(s) were Registered..</span>
<%} %>
