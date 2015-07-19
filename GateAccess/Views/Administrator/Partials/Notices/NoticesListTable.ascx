<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.NoticesModel>" %>
<%Int32? newNoticeID = null;
  if (ViewBag.NewNoticeID != null)
      newNoticeID = Int32.Parse(TempData["NewNoticeID"].ToString());

  if (ViewBag.NoticesList != null && ((List<GateAccess.Models.NoticesModel>)ViewBag.NoticesList).Count > 0)
  {
      using (Html.BeginForm("", "", FormMethod.Post, new { id = "NoticesList" }))
      {%>
<div class="divTable-body">
    <div class="divTable-headerRow">
        <div class="divTable-headerCell" style="width: 75%">
            Notice
        </div>
        <div class="divTable-headerCell" style="width: 10%">
            Edit
        </div>
        <div class="divTable-headerCell" style="width: 10%">
            <input type="checkbox" id="CheckAll" title="Select All" />
        </div>
    </div>
    <% foreach (var Item in (List<GateAccess.Models.NoticesModel>)ViewBag.NoticesList)
       {
    %>
    <div id="notice<%=Item.NoticeID%>" class="divTable-row">
        <div style="width: 75%" align="left" class="divTable-labelCell">
            &nbsp;&nbsp;<a class="noticeDetails" name="<%= Item.NoticeID%>"
                style="color: Blue; cursor: pointer"><%= Item.NoticeText%></a>
        </div>
        <div style="width: 10%" align="center" class="divTable-labelCell">
            <img name="<%=Item.NoticeID%>" class="editNotice" src="<%: Url.Content("~/Images/edit.png")%>"
                alt="Edit" onmousedown="editclick(this)" onmouseup="unclickedit(this)" style="cursor: pointer" />
        </div>
        <div style="width: 10%" class="divTable-labelCell" align="center">
            <input name="NoticesToDelete" id="NoticesToDelete" type="checkbox" value="<%=Item.NoticeID%>" />
            <%--<img src="<%: Url.Content("~/Images/delete.png")%>" alt="Delete" name="<%=Item.NoticeID%>" class='delete'
                        onclick='.delete' onmousedown="deleteclick(this)" onmouseup="unclickdelete(this)" />--%>
        </div>
    </div>
    <% } %>
</div>
<div align="right">
    <input type="submit" id="Btn_DeleteNotices" disabled="disabled" value="Delete Notice(s)" />
</div>
<%}%><div id="Div_Operations">
</div>
<%
  }
  else
  { %><br />
<span style="color: #FF0000">No Notices were Registered..</span>
<%}
%>