<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script type="text/javascript" language="javascript">

    $(document).ready(function () {
        $("#Communities").live("change", function () {
            $('#Div_RolesList').empty();
            $('#Div_UsersList').empty();
            if ($(this).val() > 0)
                rolesList();
        });
    });

    function rolesList() {
        $("#Div_UsersList").empty();
        $("#Div_RolesList").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>"  alt="Loading..."/></div>');
        $.ajax({
            cache:false,
            type: "GET",
            timeout: 5000,
            url: "/SuperAdministrator/RolesList/?communityid=" + $("#Communities").val(),
            success: function (data) {
                $("#Div_RolesList").html(data);
            },
            error: function (errdata)
            { }
        });
    }

    function loadPartial(roleid) {
        $("#RolesTable").attr("disabled", true);
        $("#Div_UsersList").empty();
        $("#Div_UsersList").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>"  alt="Loading..."/></div>');
        $.ajax({
            cache: false,
            type: "POST",
            timeout: 5000,
            datatype: "json",
            url: "/SuperAdministrator/UsersList/?roleid=" + roleid + "&communityid=" + $("#Communities").val(),
            success: function (data) {
                $("#Div_UsersList").empty();
                $("#Div_UsersList").html(data);
            },
            error: function (errdata)
            { }
        });
    } 
    
</script>
<br />
<div>
    <fieldset>
        <legend>Users</legend>
        <br />
        <b>Communities :</b>
        <%:Html.DropDownList("Communities", new SelectList((IEnumerable)ViewBag.CommunitiesList, "CommunityID", "CommunityName"), ((List<GateAccess.Models.CommunitiesModel>)ViewBag.CommunitiesList).Count > 0 ? "-- Select Community --" : "-- No Communities --", new { style = "font-size:12px;width:300px" })%>
        <br />
        <div id="Div_RolesList" align="center">
        </div>
        <br />
        <div id="Div_UsersList">
        </div>
    </fieldset>
</div>
