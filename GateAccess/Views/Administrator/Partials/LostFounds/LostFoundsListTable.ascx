<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.LostFoundsModel>" %>
<%Int32? newLostFoundID = null;
  if (ViewBag.NewLostFoundID != null)
      newLostFoundID = Int32.Parse(ViewBag.NewLostFoundID.ToString());

  if (ViewBag.LostFoundsList != null && ((List<GateAccess.Models.LostFoundsModel>)ViewBag.LostFoundsList).Count > 0)
  {
      using (Html.BeginForm("", "", FormMethod.Post, new { id = "LostFoundsList" }))
      { %>
<table width="100%" rules="all" style="border: 1px solid #000000">
    <tr style="background-color: #E0E0E0">
        <th>
            LostWhat
        </th>
        <th>
            LostWhen
        </th>
        <th>
            LostAt
        </th>
        <th>
            FoundWhat
        </th>
        <th>
            FoundWhen
        </th>
        <th>
            FoundAt
        </th>
        <th>
            Description
        </th>
        <th>
            Edit
        </th>
        <th>
            <input type="checkbox" id="CheckAll" title="Select All" />
        </th>
    </tr>
    <% foreach (var Item in (List<GateAccess.Models.LostFoundsModel>)ViewBag.LostFoundsList)
       {
           if (Item.LostFoundID == newLostFoundID)
           {
    %>
    <tr id="<%= Item.LostFoundID%>" style="background-color: #F5D7C2; font-weight: bold">
        <%}
           else
           { %>
        <tr id="<%= Item.LostFoundID%>">
            <%}%>
            <td>
                &nbsp;&nbsp;<a class="foundDetails" name="<%= Item.LostFoundID%>" href="#"><%= Item.LostWhat%></a>
            </td>
            <td>
                &nbsp; &nbsp;
                <%= Item.FoundWhen%>
            </td>
            <td>
                &nbsp; &nbsp;
                <%= Item.FoundAt%>
            </td>
            <td>
                &nbsp; &nbsp; &nbsp;&nbsp;<a class="lostDetails" name="<%= Item.LostFoundID%>" href="#"><%= Item.FoundWhat%></a>
            </td>
            <td>
                &nbsp; &nbsp;
                <%= Item.LostWhen%>
            </td>
            <td>
                &nbsp; &nbsp;
                <%= Item.LostAt%>
            </td>
            <td>
                &nbsp; &nbsp;
                <%= Item.Description%>
            </td>
            <td align="center">
                <img class="editLostFound" name="<%=Item.LostFoundID%>" src="<%: Url.Content("~/Images/edit.png")%>"
                    alt="Edit" onmousedown="editclick(this)" onmouseup="unclickedit(this)" />
            </td>
            <td align="center">
                <input name="LostFoundsToDelete" id="LostFoundsToDelete" type="checkbox" value="<%=Item.LostFoundID%>" />
                <%--<img src="<%: Url.Content("~/Images/delete.png")%>" alt="Delete" title="<%= Item.LostWhat%> <%= Item.FoundWhat%>"
                        name="<%=Item.LostFoundID%>" class='delete' onclick='.delete' onmousedown="deleteclick(this)"
                        onmouseup="unclickdelete(this)" />--%>
            </td>
        </tr>
        <% } %>
</table>
<div align="right">
    <input type="submit" id="Btn_DeleteLostFounds" disabled="disabled" value="Delete LostFound(s)" />
</div>
<%}%>
<div id="Div_LostFoundDetails">
</div>
<div id="Div_EditLostFound">
</div>
<div id="Div_NewLostFound">
</div>
<% }
  else
  { %><br />
<span style="color: #FF0000">No LostFounds were Registered..</span>
<%}
%>
