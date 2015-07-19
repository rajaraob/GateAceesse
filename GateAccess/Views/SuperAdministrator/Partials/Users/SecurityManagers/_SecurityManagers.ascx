<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script type="text/javascript">

    $(document).on("click", "#securityManagersRefresh", function () {
        SecurityManagersRefresh();
    });

    function SecurityManagersRefresh() {
        $("#Div_SecurityManagersListTable").empty();
        $("#Div_SecurityManagersListTable").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
        $.ajax({
            type: "GET",
            timeout: 5000,
            url: "/SuperAdministrator/SecurityManagersListTable/?communityid=" + $("#Communities").val(),
            success: function (data) {
                $("#Div_SecurityManagersListTable").html(data);
            },
            error: function (errdata)
            { }
        });
    }

    /* Edit SecurityManager */

    var issecuritymanagerdivopen = false;
    var oldsecuritymanagerid = null;

    $(document).on("click", ".editSecurityManager", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        HandlePreviousSecurityManager(this.name);
    });

    function HandlePreviousSecurityManager(currentsecuritymanagerid) {
        if (issecuritymanagerdivopen == true) {
            if (oldsecuritymanagerid == currentsecuritymanagerid) {
                ClearForSecurityManagers(oldsecuritymanagerid);
                issecuritymanagerdivopen = false;
                oldsecuritymanagerid = null;
            }
            else {
                ClearForSecurityManagers(oldsecuritymanagerid);
                BeforeLoading(currentsecuritymanagerid);
                EditSecurityManager(currentsecuritymanagerid);
                oldsecuritymanagerid = currentsecuritymanagerid;
            }
        }
        else {
            BeforeLoading(currentsecuritymanagerid);
            EditSecurityManager(currentsecuritymanagerid);
            issecuritymanagerdivopen = true;
            oldsecuritymanagerid = currentsecuritymanagerid;
        }
    }

    function BeforeLoading(securitymanagerid) {
        $("#Div_EditSecurityManager").insertAfter("#securityManager" + securitymanagerid);
        $("#Div_EditSecurityManager").show();       
        $("#Div_EditSecurityManager").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
    }

    function ClearForSecurityManagers(securitymanagerid) {
        $("#securityManager" + securitymanagerid).css('background-color', '#FFFFFF');
        $("#Div_EditSecurityManager").hide(500);
        $("#Div_EditSecurityManager").html('');
    }

    function EditSecurityManager(securitymanagerid) {
        $.ajax({
            type: "GET",
            url: "/SuperAdministrator/EditSecurityManager/?securitymanagerid=" + securitymanagerid + "&communityid=" + $("#Communities").val(),
            success: function (data) {
                $("#securityManager" + securitymanagerid).css('background-color', '#F3F3F3');
                $("#Div_EditSecurityManager").html(data);
            },
            error: function (errdata)
            { }
        });
    }

    $(document).on("click", "#editSecurityManagerClose", function () {
        EditAdministratorClose(this.name);
    });

    function EditAdministratorClose(securitymanagerid) {
        ClearForSecurityManagers(securitymanagerid);
        issecuritymanagerdivopen = false;
        oldsecuritymanagerid = null;
    }

    var securityManagerUpdated = false;

    function editSecurityManagerBegin() {
        $("#editSecurityManagerForm").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-updating.gif")%>" alt="Updating..."/></div>');
    }

    function editSecurityManagerSuccess() {
        if ($("#editAdministratorMessage").html() == "True") {
            securityManagerUpdated = true;
            setTimeout(function () { EditSecurityManagerClose(oldsecuritymanagerid); }, 3000);
        }
        else {
            $("#Div_EditSecurityManager").html($("#editSecurityManagerMessage").html());
            $("#editSecurityManagerMessage").html('');
        }
    }

    function editSecurityManagerComplete() {
        if (securityManagerUpdated) {
            SecurityManagersRefresh();
            UpdateSecurityManagerActionInfo();
            securityManagerUpdated = false;
        }
    }

    function UpdateSecurityManagerActionInfo() {
        $('#Div_ActionInformation').fadeIn();
        $('#Div_ActionInformation').html("SecurityManager Updated Successfully.");
        $('#Div_ActionInformation').fadeOut(5000);
    }   

    /* End of Edit SecurityManager */


    /* New SecurityManager */

    $('#Div_NewSecurityManager').dialog({
        autoOpen: false,
        width: 750,
        resizable: false,
        minHeight: 200,
        position: [null, 75],
        modal: true,
        title: "New SecurityManager",
        show: {
            effect: "blind",
            duration: 500
        },
        hide: {
            effect: "clip",
            duration: 750
        },
        buttons: {
            "Create": function () {
                $("#createMessage").html(''); //make sure there is nothing on the message before we continue                         
                $("#Form_NewSecurityManager").submit();
            },
            "Clear": function () {
                Clear(this);
            }
        }
    });

    $(document).on("click", "#NewSecurityManager", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var $dialog = $("#Div_NewSecurityManager");
        $dialog.dialog('open');
        $dialog.html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..." /></div>');
        var $url = "/SuperAdministrator/RegistrationPartial/?roleid=3&communityid=" + $("#Communities").val();
        $.get($url, function (data) {
            $dialog.html(data);
        });
    });

    function createSuccess() {
        if ($("#createMessage").html() == "True") {
            //now we can close the dialog
            $('#Div_NewSecurityManager').dialog('close');
            //twitter type notification
            $('#Div_ActionInformation').fadeIn();
            $('#Div_ActionInformation').html("Created Successfully...");
            $('#Div_ActionInformation').fadeOut(5000);
        }
        else {
            $("#Div_NewSecurityManager").html($("#createMessage").html());
        }
    }

    /* End of New SecurityManager */

    /* Multiple Delete */

    $("#CheckAll").live("click", function () {
        $("input[name='SecurityManagersToDelete']").attr("checked", this.checked);
        deletebuttonenabledisable();
    });

    $("input[name='SecurityManagersToDelete']").live("click", function () {
        if ($("input[name='SecurityManagersToDelete']").length == $("input[name='SecurityManagersToDelete']:checked").length) {
            $("#CheckAll").attr("checked", "checked");
        }
        else {
            $("#CheckAll").removeAttr("checked");
        }
        deletebuttonenabledisable();
    });

    function deletebuttonenabledisable() {
        if ($("input[name='SecurityManagersToDelete']:checked").length > 0) {
            $("#Btn_DeleteSecurityManagers").removeAttr("disabled");
        }
        else {
            $("#Btn_DeleteSecurityManagers").attr("disabled", true);
        }
    }

    $(document).on("click", "#Btn_DeleteSecurityManagers", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var count = 0;
        count = $("input[name='SecurityManagersToDelete']:checked").length;
        if (count > 0) {
            if (confirm("R U Sure?  " + count + " SecurityManagers are deleted")) {
                var selectedIDs = $("input[name='SecurityManagersToDelete']:checked").map(function () {
                    return $(this).val();
                }).toArray();

                $.ajax({
                    type: "post",
                    url: "/supersecurityManager/DeleteSecurityManagers/?securityManagerstodelete=" + selectedIDs,
                    success: function (result) {
                        if (result == "success") {
                            $("#Div_ActionInformation").fadeIn();
                            $("#Div_ActionInformation").html('SecurityManagers delted successfully..');
                            $("#Div_ActionInformation").fadeOut(5000);
                            SecurityManagersRefresh();
                        }
                    }
                });
            }
        }
        else {
            alert("No SecurityManager(s) are selected to delete");
        }
    });

    /* End of Multiple Delete */    
</script>
<div id="Div_NewSecurityManager">
</div>
<div id="Div_SecurityManagers">
    <% Html.RenderPartial("Partials/Users/SecurityManagers/SecurityManagersList"); %>
</div>
