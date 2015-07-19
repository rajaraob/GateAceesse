<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="GateAccess.Models.Helper" %>
<script type="text/javascript">

    $(document).on("click", "#securityPersonnelsRefresh", function () {
        SecurityPersonnelsRefresh();
    });

    function SecurityPersonnelsRefresh() {
        $("#Div_SecurityPersonnelsListTable").empty();
        $("#Div_SecurityPersonnelsListTable").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
        $.ajax({
            type: "GET",
            timeout: 5000,
            url: "/SuperAdministrator/SecurityPersonnelsListTable/?communityid=" + $("#Communities").val(),
            success: function (data) {
                $("#Div_SecurityPersonnelsListTable").html(data);
            },
            error: function (errdata)
            { }
        });
    }

    /* SecurityPersonnel Details */

    var issecuritypersonneldivopen = false;
    var oldsecuritypersonnelid = null;

    $(document).on("click", ".editSecurityPersonnel", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        HandlePreviousSecurityPersonnel(this.name);
    });

    function HandlePreviousSecurityPersonnel(securitypersonnelid) {
        if (issecuritypersonneldivopen == true) {
            if (oldsecuritypersonnelid == securitypersonnelid) {
                ClearForSecurityPersonnels(oldsecuritypersonnelid);
                issecuritypersonneldivopen = false;
                oldsecuritypersonnelid = null;
            }
            else {
                ClearForSecurityPersonnels(oldsecuritypersonnelid);
                BeforeLoading(securitypersonnelid);
                EditSecurityPersonnel(securitypersonnelid);
                oldsecuritypersonnelid = securitypersonnelid;
            }
        }
        else {
            BeforeLoading(securitypersonnelid);
            EditSecurityPersonnel(securitypersonnelid);
            issecuritypersonneldivopen = true;
            oldsecuritypersonnelid = securitypersonnelid;
        }
    }

    function BeforeLoading(securitypersonnelid) {
        $("#Div_EditSecurityPersonnel").insertAfter("#securityPersonnel" + securitypersonnelid);
        $("#Div_EditSecurityPersonnel").show();        
        $("#Div_EditSecurityPersonnel").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
    }

    function ClearForSecurityPersonnels(securitypersonnelid) {
        $("#securityPersonnel" + securitypersonnelid).css('background-color', '#FFFFFF');
        $("#Div_EditSecurityPersonnel").hide();
        $("#Div_EditSecurityPersonnel").html('');
    }

    function EditSecurityPersonnel(securitypersonnelid) {
        $.ajax({
            type: "GET",
            url: "/SuperAdministrator/EditSecurityPersonnel/?securitypersonnelid=" + securitypersonnelid + "&communityid=" + $("#Communities").val(),
            success: function (data) {               
                $("#securityPersonnel" + securitypersonnelid).css('background-color', '#F3F3F3');
                $("#Div_EditSecurityPersonnel").html(data);
            },
            error: function (errdata)
            { }
        });
    }

    $(document).on("click", "#editSecurityPersonnelClose", function () {
        EditSecurityPersonnelClose(this.name);
    });


    function EditSecurityPersonnelClose(securitypersonnelid) {
        ClearForSecurityPersonnels(securitypersonnelid);
        issecuritypersonneldivopen = false;
        oldsecuritypersonnelid = null;
    }

    var securityPersonnelUpdated = false;

    function editSecurityPersonnelBegin() {
        $("#editSecurityPersonnelForm").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-updating.gif")%>" alt="Updating..."/></div>');
    }

    function editSecurityPersonnelSuccess() {
        if ($("#editSecurityPersonnelMessage").html() == "True") {
            securityPersonnelUpdated = true;
            setTimeout(function () { EditSecurityPersonnelClose(oldsecuritypersonnelid); }, 3000);
        }
        else {
            $("#Div_EditSecurityPersonnel").html($("#editSecurityPersonnelMessage").html());
            $("#editSecurityPersonnelMessage").html('');
        }
    }

    function editSecurityPersonnelComplete() {
        if (securityPersonnelUpdated) {
            SecurityPersonnelsRefresh();
            UpdateSecurityPersonnelActionInfo();
            securityPersonnelUpdated = false;
        }
    }

    function UpdateSecurityPersonnelActionInfo() {
        $('#Div_ActionInformation').fadeIn();
        $('#Div_ActionInformation').html("SecurityPersonnel Updated Successfully.");
        $('#Div_ActionInformation').fadeOut(5000);
    }   

    /* End of Edit SecurityPersonnel */

    /* New SecurityPersonnel */

    $('#Div_NewSecurityPersonnel').dialog({
        autoOpen: false,
        width: 750,
        resizable: false,
        minHeight: 200,
        position: [null, 75],
        modal: true,
        title: "New SecurityPersonnel",
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
                $("#Form_NewSecurityPersonnel").submit();
            },
            "Clear": function () {
                Clear(this);
            }
        }
    });

    $(document).on("click", "#NewSecurityPersonnel", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var $dialog = $("#Div_NewSecurityPersonnel");
        $dialog.dialog('open');
        $dialog.html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..." /></div>');
        var $url = "/SuperAdministrator/RegistrationPartial/?roleid=4&communityid=" + $("#Communities").val();
        $.get($url, function (data) {
            $dialog.html(data);
        });
    });

    function createSuccess() {
        if ($("#createMessage").html() == "True") {
            //now we can close the dialog
            $('#Div_NewSecurityPersonnel').dialog('close');
            //twitter type notification
            $('#Div_ActionInformation').fadeIn();
            $('#Div_ActionInformation').html("Created Successfully...");
            $('#Div_ActionInformation').fadeOut(5000);
        }
        else {
            $("#Div_NewSecurityPersonnel").html($("#createMessage").html());
        }
    }

    /* End of New SecurityPersonnel */

    /* Multiple Delete */

    $("#CheckAll").live("click", function () {
        $("input[name='SecurityPersonnelsToDelete']").attr("checked", this.checked);
        deletebuttonenabledisable();
    });

    $("input[name='SecurityPersonnelsToDelete']").live("click", function () {
        if ($("input[name='SecurityPersonnelsToDelete']").length == $("input[name='SecurityPersonnelsToDelete']:checked").length) {
            $("#CheckAll").attr("checked", "checked");
        }
        else {
            $("#CheckAll").removeAttr("checked");
        }
        deletebuttonenabledisable();
    });

    function deletebuttonenabledisable() {
        if ($("input[name='SecurityPersonnelsToDelete']:checked").length > 0) {
            $("#Btn_DeleteSecurityPersonnels").removeAttr("disabled");
        }
        else {
            $("#Btn_DeleteSecurityPersonnels").attr("disabled", true);
        }
    }

    $(document).on("click", "#Btn_DeleteSecurityPersonnels", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var count = 0;
        count = $("input[name='SecurityPersonnelsToDelete']:checked").length;
        if (count > 0) {
            if (confirm("R U Sure?  " + count + " SecurityPersonnels are deleted")) {
                var selectedIDs = $("input[name='SecurityPersonnelsToDelete']:checked").map(function () {
                    return $(this).val();
                }).toArray();

                $.ajax({
                    type: "post",
                    url: "/supersecurityPersonnel/DeleteSecurityPersonnels/?securityPersonnelstodelete=" + selectedIDs,
                    success: function (result) {
                        if (result == "success") {
                            $("#Div_ActionInformation").fadeIn();
                            $("#Div_ActionInformation").html('SecurityPersonnels delted successfully..');
                            $("#Div_ActionInformation").fadeOut(5000);
                            SecurityPersonnelsRefresh();
                        }
                    }
                });
            }
        }
        else {
            alert("No SecurityPersonnel(s) are selected to delete");
        }
    });

    /* End of Multiple Delete */
    
</script>
<div id="Div_EditSecurityPersonnel">
</div>
<div id="Div_NewSecurityPersonnel">
</div>
<div id="Div_SecurityPersonnels">
    <% Html.RenderPartial("Partials/Users/SecurityPersonnels/SecurityPersonnelsList"); %>
</div>
