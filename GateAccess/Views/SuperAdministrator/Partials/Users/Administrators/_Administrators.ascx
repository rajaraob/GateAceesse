<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script type="text/javascript">

    $(document).on("click", "#administratorsRefresh", function () {
        AdministratorsRefresh();
    });

    function AdministratorsRefresh() {
        $("#Div_AdministratorsListTable").empty();
        $("#Div_AdministratorsListTable").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
        $.ajax({
            type: "GET",
            timeout: 5000,
            url: "/SuperAdministrator/AdministratorsListTable/?communityid=" + $("#Communities").val(),
            success: function (data) {
                $("#Div_AdministratorsListTable").empty();
                $("#Div_AdministratorsListTable").html(data);
            },
            error: function (errdata)
            { }
        });
    }

    /*Edit Administrator */

    var oldadministratorid = null;
    var isadministratordivopen = false;

    $(document).on("click", ".editAdministrator", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        HandlePreviousAdmin(this.name);
    });

    function HandlePreviousAdmin(administratorid) {
        if (isadministratordivopen == true) {
            if (administratorid == oldadministratorid) {
                ClearForAdministrators(administratorid);
                isadministratordivopen = false;
                oldadministratorid = null;
            }
            else {
                ClearForAdministrators(oldadministratorid);
                BeforeLoading(administratorid);
                EditAdministrator(administratorid);
                oldadministratorid = administratorid;
            }
        }
        else {
            BeforeLoading(administratorid);
            EditAdministrator(administratorid);
            oldadministratorid = administratorid;
            isadministratordivopen = true;
        }
    }

    function BeforeLoading(administratorid) {
        $("#Div_EditAdministrator").insertAfter("#administrator" + administratorid);
        $("#Div_EditAdministrator").show();        
        $("#Div_EditAdministrator").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');

    }

    function ClearForAdministrators(administratorid) {
        $("#administrator" + administratorid).css('background-color', '#FFFFFF');
        $("#Div_EditAdministrator").hide();
        $("#Div_EditAdministrator").html('');
    }

    function EditAdministrator(administratorid) {
        $.ajax({
            type: "GET",
            url: "/SuperAdministrator/EditAdministrator/?administratorid=" + administratorid + "&communityid=" + $("#Communities").val(),
            success: function (data) {
                $("#administrator" + administratorid).css('background-color', '#F3F3F3');               
                $("#Div_EditAdministrator").html(data);
            },
            error: function (errdata)
            { }
        });
    }

    $(document).on("click", "#editAdministratorClose", function () {
        EditAdministratorClose(this.name);
    });

    function EditAdministratorClose(administratorid) {
        ClearForAdministrators(administratorid);
        isadministratordivopen = false;
        oldadministratorid = null;
    }

    var administratorUpdated = false;

    function editAdministratorBegin() {
        $("#editAdministratorForm").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-updating.gif")%>" alt="Updating..."/></div>');
    }
    
    function editAdministratorSuccess() {
        if ($("#editAdministratorMessage").html() == "True") {
            administratorUpdated = true;
            setTimeout(function () { EditAdministratorClose(oldadministratorid); }, 3000);
        }
        else {
           $("#Div_EditAdministrator").html($("#editAdministratorMessage").html());
            $("#editAdministratorMessage").html('');
        }
    }

    function editAdministratorComplete() {
        if (administratorUpdated) {
            AdministratorsRefresh();
            UpdateAdministratorActionInfo();
            administratorUpdated = false;
        }
    }

    function UpdateAdministratorActionInfo() {
        $('#Div_ActionInformation').fadeIn();
        $('#Div_ActionInformation').html("Administrator Updated Successfully.");
        $('#Div_ActionInformation').fadeOut(5000);
    }

    /* End of Administrator Details  */

    /* Multiple Delete */

    $("#CheckAll").live("click", function () {
        $("input[name='AdministratorsToDelete']").attr("checked", this.checked);
        deletebuttonenabledisable();
    });

    $("input[name='AdministratorsToDelete']").live("click", function () {
        if ($("input[name='AdministratorsToDelete']").length == $("input[name='AdministratorsToDelete']:checked").length) {
            $("#CheckAll").attr("checked", "checked");
        }
        else {
            $("#CheckAll").removeAttr("checked");
        }
        deletebuttonenabledisable();
    });

    function deletebuttonenabledisable() {
        if ($("input[name='AdministratorsToDelete']:checked").length > 0) {
            $("#Btn_DeleteAdministrators").removeAttr("disabled");
        }
        else {
            $("#Btn_DeleteAdministrators").attr("disabled", true);
        }
    }

    $(document).on("click", "#Btn_DeleteAdministrators", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var count = 0;
        count = $("input[name='AdministratorsToDelete']:checked").length;
        if (count > 0) {
            if (confirm("R U Sure?  " + count + " Administrators are deleted")) {
                var selectedAdmins = ($("input[name='AdministratorsToDelete']:checked").map(function () {
                    return this.value;
                }).get().join(","));

                $.ajax({
                    type: "post",
                    url: "/superadministrator/DeleteAdministrators/?administratorstodelete=" + selectedAdmins,
                    success: function (data) {
                        if (data) {
                            $("#Div_ActionInformation").fadeIn();
                            $("#Div_ActionInformation").html('Administrators delted successfully..');
                            $("#Div_ActionInformation").fadeOut(5000);
                            AdministratorsRefresh();
                        }
                        else{}
                    }
                });
            }
        }
        else {
            alert("No Administrator(s) are selected to delete");
        }
    });

    /* End of Multiple Delete */


    /* New Administrator */

    var adminCreated = false;

    $('#Div_NewAdministrator').dialog({
        autoOpen: false,
        width: 700,
        resizable: false,
        minHeight: 200,
        position: [null, 75],
        modal: true,
        title: "New Administrator",
        show: {
            effect: "blind",
            duration: 500
        },
        hide: {
            effect: "clip",
            duration: 750
        },
        close: function () {
            if (adminCreated) {
                AdministratorsRefresh();
                CreateAdminActionInfo();
                AdminCreated = false;
            }
        },
        buttons: {
            "Create": {
                text: "Create",
                id: "CreateAdministrator",
                click: function () {
                    $("#Form_NewAdministrator").submit();
                }
            },
            "Clear": function () {
                Clear(this);
            }
        }
    });

    $(document).on("click", "#NewAdministrator", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var $dialog = $("#Div_NewAdministrator");
        $dialog.dialog('open');
        $dialog.html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..." /></div>');
        var $url = "/SuperAdministrator/RegistrationPartial/?roleid=2&communityid=" + $("#Communities").val();
        $.get($url, function (data) {
            $dialog.html(data);
        });
    });

    function createSuccess() {
        if ($("#createMessage").html() == "True") {
            //now we can close the dialog
            $('#Div_NewAdministrator').dialog('close');
            //twitter type notification
            $('#Div_ActionInformation').fadeIn();
            $('#Div_ActionInformation').html("Created Successfully...");
            $('#Div_ActionInformation').fadeOut(5000);
        }
        else if ($("#createMessage").html() == "errors") {
            $("#Dlg_NewAdministrator").html();
        }
    }

    /* End of New Administrator */
   
</script>
<div id="Div_NewAdministrator">
</div>
<div id="Div_AdministratorsList">
    <% Html.RenderPartial("Partials/Users/Administrators/AdministratorsList"); %>
</div>
