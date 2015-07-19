<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script type="text/javascript">

    $(document).on("click", "#homeOwnersRefresh", function () {
        HomeOwnersRefresh();
    });

    function HomeOwnersRefresh() {
        $("#Div_HomeOwnersListTable").empty();
        $("#Div_HomeOwnersListTable").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
        $.ajax({
            type: "GET",
            timeout: 5000,
            url: "/SuperAdministrator/HomeOwnersListTable/?communityid=" + $("#Communities").val(),
            success: function (data) {
                $("#Div_HomeOwnersListTable").empty();
                $("#Div_HomeOwnersListTable").html(data);
            },
            error: function (errdata)
            { }
        });
    }

    /* HomeOwner Details */

    var ishomeownerdivopen = false;
    var oldhomeownerid = null;

    $(document).on("click", ".editHomeOwner", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        HandlePreviousHomeOwner(this.name);
    });

    function HandlePreviousHomeOwner(homeownerid) {
        if (ishomeownerdivopen == true) {
            if (oldhomeownerid == homeownerid) {
                ClearForHomeOwners(oldhomeownerid);
                ishomeownerdivopen = false;
                oldhomeownerid = null;
            }
            else {
                ClearForHomeOwners(oldhomeownerid);
                BeforeLoading(homeownerid);
                EditHomeOwner(homeownerid);
                oldhomeownerid = homeownerid;
            }
        }
        else {
            BeforeLoading(homeownerid);
            EditHomeOwner(homeownerid);
            ishomeownerdivopen = true;
            oldhomeownerid = homeownerid;
        }
    }

    function BeforeLoading(homeownerid) {
        $("#Div_EditHomeOwner").insertAfter("#homeOwner" + homeownerid);
        $("#Div_EditHomeOwner").show();
        $("#Div_EditHomeOwner").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
    }

    function ClearForHomeOwners(homeownerid) {
        $("#homeOwner" + homeownerid).css('background-color', '#FFFFFF');
        $("#Div_EditHomeOwner").hide();
        $("#Div_EditHomeOwner").html('');
    }

    function EditHomeOwner(homeownerid) {
        $.ajax({
            type: "GET",
            url: "/SuperAdministrator/EditHomeOwner/?homeownerid=" + homeownerid + "&communityid=" + $("#Communities").val(),
            success: function (data) {
                alert(data);
                //                $("#homeOwner" + homeownerid).css('background-color', '#F3F3F3');
                //                $("#Div_EditHomeOwner").html(data);

            },
            error: function (errdata)
            { }
        });
    }

    $(document).on("click", "#edotHomeOwnerClose", function () {
        EditSecurityPersonnelClose(this.name);
    });

    function EditSecurityPersonnelClose(homeownerid) {
        ClearForHomeOwners(homeownerid);
        ishomeownerdivopen = false;
        oldhomeownerid = null;
    }

    var homeOwnerUpdated = false;

    function editHomeOwnerBegin() {
        $("#editHomeOwnerForm").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-updating.gif")%>" alt="Updating..."/></div>');
    }

    function editHomeOwnerSuccess() {
        if ($("#editHomeOwnerMessage").html() == "True") {
            homeOwnerUpdated = true;
            setTimeout(function () { EditHomeOwnerClose(oldhomeownerid); }, 3000);
        }
        else {
            $("#Div_EditHomeOwner").html($("#editHomeOwnerMessage").html());
            $("#editHomeOwnerMessage").html('');
        }
    }

    function editHomeOwnerComplete() {
        if (homeOwnerUpdated) {
            HomeOwnersRefresh();
            UpdateHomeOwnerActionInfo();
            homeOwnerUpdated = false;
        }
    }

    function UpdateHomeOwnerActionInfo() {
        $('#Div_ActionInformation').fadeIn();
        $('#Div_ActionInformation').html("HomeOwner Updated Successfully.");
        $('#Div_ActionInformation').fadeOut(5000);
    }   

    /* End of Edit HomeOwner */


    /* New HomeOwner */

    $('#Div_NewHomeOwner').dialog({
        autoOpen: false,
        width: 750,
        resizable: false,
        minHeight: 200,
        position: [null, 75],
        modal: true,
        title: "New HomeOwner",
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
                $("#Form_NewHomeOwner").submit();
            },
            "Clear": function () {
                Clear(this);
            }
        }
    });

    $(document).on("click", "#NewHomeOwner", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var $dialog = $("#Div_NewHomeOwner");
        $dialog.dialog('open');
        $dialog.html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..." /></div>');
        var $url = "/SuperAdministrator/RegistrationPartial/?roleid=5&communityid=" + $("#Communities").val();
        $.get($url, function (data) {
            $dialog.html(data);
        });
    });

    function createSuccess() {
        if ($("#createMessage").html() == "True") {
            //now we can close the dialog
            $('#Div_NewHomeOwner').dialog('close');
            //twitter type notification
            $('#Div_ActionInformation').fadeIn();
            $('#Div_ActionInformation').html("Created Successfully...");
            $('#Div_ActionInformation').fadeOut(5000);
        }
        else {
            $("#Div_NewHomeOwner").html($("#createMessage").html());
        }
    }

    /* End of New HomeOwner */

    /* Multiple Delete */

    $("#CheckAll").live("click", function () {
        $("input[name='HomeOwnersToDelete']").attr("checked", this.checked);
        deletebuttonenabledisable();
    });

    $("input[name='HomeOwnersToDelete']").live("click", function () {
        if ($("input[name='HomeOwnersToDelete']").length == $("input[name='HomeOwnersToDelete']:checked").length) {
            $("#CheckAll").attr("checked", "checked");
        }
        else {
            $("#CheckAll").removeAttr("checked");
        }
        deletebuttonenabledisable();
    });

    function deletebuttonenabledisable() {
        if ($("input[name='HomeOwnersToDelete']:checked").length > 0) {
            $("#Btn_DeleteHomeOwners").removeAttr("disabled");
        }
        else {
            $("#Btn_DeleteHomeOwners").attr("disabled", true);
        }
    }

    $(document).on("click", "#Btn_DeleteHomeOwners", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var count = 0;
        count = $("input[name='HomeOwnersToDelete']:checked").length;
        if (count > 0) {
            if (confirm("R U Sure?  " + count + " HomeOwners are deleted")) {
                var selectedIDs = $("input[name='HomeOwnersToDelete']:checked").map(function () {
                    return $(this).val();
                }).toArray();

                $.ajax({
                    type: "post",
                    url: "/superhomeOwner/DeleteHomeOwners/?homeOwnerstodelete=" + selectedIDs,
                    success: function (result) {
                        if (result == "success") {
                            $("#Div_ActionInformation").fadeIn();
                            $("#Div_ActionInformation").html('HomeOwners delted successfully..');
                            $("#Div_ActionInformation").fadeOut(5000);
                            HomeOwnersRefresh();
                        }
                    }
                });
            }
        }
        else {
            alert("No HomeOwner(s) are selected to delete");
        }
    });

    /* End of Multiple Delete */
    $("#HintQuestionID").live("change", function () {
        var adhqid = $("#HintQuestionID").val();
        if (adhqid != null && adhqid > 0) {
            $(document).find("#Hint").removeAttr("disabled");
        }
        else {
            $(document).find("#Hint").val(" ");
            $(document).find("#Hint").prop("disabled", "disabled");
        }
    });
    

</script>
<div id="Div_NewHomeOwner">
</div>
<div id="Div_EditHomeOwner">
</div>
<div id="Div_HomeOwners">
    <% Html.RenderPartial("Partials/Users/HomeOwners/HomeOwnersList"); %>
</div>
