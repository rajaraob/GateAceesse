<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<dynamic>>" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%Int32? newSecurityManagerID = null;
  
  if (ViewBag.NewSecurityManagerID != null)
      newSecurityManagerID = Int32.Parse(ViewBag.NewSecurityManagerID.ToString());

  if (ViewBag.SecurityManagersList != null && ((List<GateAccess.Models.SecurityManagersModel>)ViewBag.SecurityManagersList).Count > 0)
  {
      using (Html.BeginForm("", "", FormMethod.Post, new { id = "SecurityManagersList" }))
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
    <% foreach (var Item in (List<GateAccess.Models.SecurityManagersModel>)ViewBag.SecurityManagersList)
       {           
    %>
    <div id="securityManager<%=Item.SecurityManagerID%>" class="divTable-row">
        <div style="width: 15%" class="divTable-labelCell">
            &nbsp;&nbsp;<a name="<%= Item.SecurityManagerID%>" class="securityManagerDetails"
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
        <div style="width: 10%" align="center" class="divTable-labelCell">
            <img src="<%: Url.Content("~/Images/edit.png")%>" alt="Edit" name="<%=Item.SecurityManagerID%>"
              class="editSecurityManager"  onmousedown="editclick(this)" style="cursor: pointer" onmouseup="unclickedit(this)" />
        </div>
        <div style="width: 10%" align="center" class="divTable-labelCell">
            <input name="SecurityManagersToDelete" id="SecurityManagersToDelete" type="checkbox"
                value="<%=Item.SecurityManagerID%>" />
            <%--<img src="<%: Url.Content("~/Images/delete.png")%>" title="<%= Item.FirstName%>"
                        alt="Delete" name="<%=Item.SecurityManagerID%>" class='delete' onclick='.delete'
                        onmousedown="deleteclick(this)" onmouseup="unclickdelete(this)" />--%>
        </div>
    </div>
    <% } %>
</div>
<div align="right">
    <input type="submit" id="Btn_DeleteSecurityManagers" value="Delete SecurityManager(s)"
        disabled="disabled" />
</div>
<div id="Div_Operations">
</div>
<%
      }
  }
  else
  {%><br />
<span style="color: #FF0000">No Security Managers were Registered..</span>
<%}
%>
