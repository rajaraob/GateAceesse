<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.VisitorsModel>" %>
<script type="text/javascript">

    var visitorid;
    $('.delete').live("click", function (e) {
        e.preventDefault();
        visitorid = $(this).attr('name');
        $('#' + visitorid).css("background-color", "#F5D7C2");
        EditClean();
        DetailsClean();

        $.confirm({
            'title': 'Delete Confirmation',
            'message': 'Are you Sure?  Do you want to Delete <br/><b>" ' + $(this).attr('title') + ' "<b>',
            'buttons': {
                'Yes': {
                    'class': 'blue',
                    'action': function () {
                        $.ajax({
                            url: "/SuperAdministrator/DeleteVisitor/?visitorid=" + visitorid,
                            success: function (data) {
                                if (data == "NOTFOUND") {
                                    alert("Visitor not found");
                                }
                                else if (data == "ajaxerror") {
                                    alert("Ajax Error");
                                }
                                else if (data == "DELETED") {
                                    ajaxSuccess(data);
                                }
                            },
                            error: function (data) {
                                ajaxError(data);
                            }
                        })
                        return false;
                    }
                },
                'No': {
                    'class': 'gray',
                    'action': function () {
                        $('#' + visitorid).css("background-color", "#F5D7C2");
                    } // Nothing to do in this case. You can as well omit the action property.
                }
            }
        });
    });

    function ajaxError(edata) {
        $("#ActionInformation").fadeIn();
        $("#ActionInformation").html('Error, Try after sometime.');
        $("#ActionInformation").fadeOut("slow");
    }

    function ajaxSuccess(sdata) {
        $('#' + visitorid).remove();
        $("#ActionInformation").fadeIn();
        $("#ActionInformation").html('Visitor Deleted Successfully..');
        $("#ActionInformation").fadeOut(4000);
    }

    $(document).ready(function () {
        deletebuttonenabledisable();
    });

    $("#CheckAll").live("click", function () {
        $("input[name='VisitorsToDelete']").attr("checked", this.checked);
        deletebuttonenabledisable();
    });

    $("input[name='VisitorsToDelete']").live("click", function () {
        if ($("input[name='VisitorsToDelete']").length == $("input[name='VisitorsToDelete']:checked").length) {
            $("#CheckAll").attr("checked", "checked");
        }
        else {
            $("#CheckAll").removeAttr("checked");
        }
        deletebuttonenabledisable();
    });

    function deletebuttonenabledisable() {
        if ($("input[name='VisitorsToDelete']:checked").length > 0) {
            $("#Btn_DeleteVisitors").removeAttr("disabled");
        }
        else {
            $("#Btn_DeleteVisitors").attr("disabled",true);
        }
    }

    $(".visitorDetails").live("click", function (e) { loadDialog(this, event, '#Div_VisitorDetails'); });
    $(".editVisitor").live("click", function (e) { loadDialog(this, event, '#Div_EditVisitor'); });
    $(".newVisitor").live("click", function (e) { addItem(this, event, '#Div_NewVisitor'); });
    $("#VisitorsList").submit(function (e) {
        e.preventDefault();
        var count = $("input[name='VisitorsToDelete']:checked").length;
        if (count > 0) {
            if (confirm(count + " Visitor(s) are deleted") == true) {
                $.ajax({
                    type: "post",
                    url: "/superadministrator/DeleteVisitors",
                    data: $(this).serialize(),
                    success: function (result) {
                        alert(result);
                    }
                });
            }
        }
        else
            alert("No Visitor(s) are selected to delete");
    });
</script>
<%Int32? newVisitorID = null;
  
  if (ViewBag.NewVisitorID != null)
  {
      newVisitorID = Int32.Parse(ViewBag.NewVisitorID.ToString());
  }  
if (ViewBag.VisitorsList != null && ((List<GateAccess.Models.VisitorsModel>)ViewBag.VisitorsList).Count > 0)
      {  using (Html.BeginForm("DeleteVisitors", "SuperAdministrator", FormMethod.Post, new { id = "VisitorsList" }))
      {%>
<table width="100%" rules="all" style="border: 1px solid #000000">
    <tr style="background-color: #E0E0E0">
        <th>
            Visitor Name
        </th>
        <th>
            Visiting To
        </th>
        <th>
            Visitor Type
        </th>
        <th>
            Visiting Date
        </th>
        <th>
            Visitor Mobile No
        </th>
        <th>
            Visitor Mail ID
        </th>
        <%--<th>
                        Comments
                    </th>--%>
        <%--<th>
                        Status
                    </th>--%>
        <th>
            Edit
        </th>
        <th>
            <input type="checkbox" id="CheckAll" title="Select All" />
        </th>
    </tr>
    <% foreach (var Item in (List<GateAccess.Models.VisitorsModel>)ViewBag.VisitorsList)
                   {  if (Item.VisitorID == newVisitorID)
               {
    %>
    <tr style="background-color: #F5D7C2; font-weight: bold">
        <%}
               else
               { %>
        <tr>
            <%}%>
            <td>
                &nbsp;&nbsp; <a id="VisitorDetails" name="<%= Item.VisitorID%>" onclick="return VisitorDetails(this)" style="cursor:pointer;color:Blue">
                    <%= Item.VisitorName%></a>
            </td>
            <td>
                &nbsp; &nbsp;
                <%= Item.VisitingTo %>
            </td>
            <td>
                &nbsp; &nbsp;
                <%= Item.VisitorType%>
            </td>
            <td>
                &nbsp; &nbsp;
                <%= Item.VisitingDate%>
            </td>
            <td>
                &nbsp; &nbsp;
                <%= Item.MobileNo%>
            </td>
            <td>
                &nbsp; &nbsp;
                <%=Item.%>
            </td>
            <%--<td>
                        &nbsp; &nbsp;
                        <%= Item.Comments%>
                    </td> 
                    <td>
                        &nbsp; &nbsp;
                        <%= Item.Status %>
                    </td>  --%>
            <td align="center">
                <img id="<%=Item.VisitorID%>" style="cursor:pointer" onclick="EditVisitor(this)" src="<%: Url.Content("~/Images/edit.png")%>"
                    alt="Edit" onmousedown="editclick(this)" onmouseup="unclickedit(this)" />
            </td>
            <td align="center">
                <input name="VisitorsToDelete" id="VisitorsToDelete" type="checkbox" value="<%=Item.CommunityID%>" />
                <%-- <img src="<%: Url.Content("~/Images/delete.png")%>" alt="Delete" title="<%= Item.VisitorName%>" name="<%=Item.VisitorID%>"
                        class='delete' onclick='.delete' onmousedown="deleteclick(this)" onmouseup="unclickdelete(this)" />--%>
            </td>
        </tr>
        <% } %>
</table>
<div align="right">
    <input type="submit" id="Btn_DeleteVisitors" value="Delete Visitors" />
</div>
<%}
%>
<div id="Div_VisitorDetails">
</div>
<div id="Div_EditVisitor">
</div>
<div id="Div_NewVisitor">
</div>
<%  
  }
  else
  {%><br />
<span style="color: #FF0000">No Visitors were Registered..</span>
<%} %>