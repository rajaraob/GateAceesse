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
            url: "/Administrator/AdministratorsListTable",
            success: function (data) {
                $("#Div_AdministratorsListTable").html(data);
            },
            error: function (errdata)
            { }
        });
    }

    /* Administrator Details */

    var isadmindivopen = false;
    var oldadminid = null;

    $(document).on("click", ".administratorDetails", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        HandlePreviousAdmin(this.name);        
    });

    function HandlePreviousAdmin(currentadminid) {
        if (isadmindivopen == true) {
            if (oldadminid == currentadminid) {
                ClearForAdministrators(oldadminid);
                isadmindivopen = false;
                oldadminid = null;
             }
            else {
                ClearForAdministrators(oldadminid);
                BeforeLoading(currentadminid);
                AdministratorDetails(currentadminid);
                oldadminid = currentadminid;
            }
        }
        else {
            BeforeLoading(currentadminid);
            AdministratorDetails(currentadminid);
            isadmindivopen = true;
            oldadminid = currentadminid;
        }
    }

    function BeforeLoading(adminid) {
        $("#Div_Operations").show("slow");
        $("#Div_Operations").insertAfter("#admin" + adminid);
        $("#Div_Operations").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
    }

    function ClearForAdministrators(adminid) {
        $("#admin" + adminid).css('background-color', '#FFFFFF');
        $("#Div_Operations").hide();
        $("#Div_Operations").html('');
    }

    function AdministratorDetails(adminid) {
        $.ajax({
            type: "GET",
            url: "/Administrator/AdministratorDetails/?administratorid=" + adminid,
            success: function (data) {
                $("#admin" + adminid).css('background-color', '#F3F3F3');
                $("#Div_Operations").html(data);                
            },
            error: function (errdata)
            { }
        });
    }

    $(document).on("click", "#administratorDetailsClose", function () {
        ClearForAdministrators(this.name);
        isadmindivopen = false;
        oldadminid = null;
    });

    /* End of Administrator Details  */

    /* Edit Administrator */

    $(document).on("click", ".editAdministrator", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var $loading = $('<div align="center"><img src="../../Images/ajax-loader.gif" alt="loading" class="ui-loading-icon"></div>');
        var $url = "/Administrator/EditAdministrator/?administratorid=" + this.name;
        var $title = "Edit Administrator";
        var $dialog = $('<div></div>');
        $dialog.empty();
        $dialog
            .append($loading)
            .load($url)
            .dialog({
                autoOpen: false
                , title: $title
            	, width: 650
                , modal: true
            	, minHeight: 200
                , resizable: false
                , show: {
                    effect: "blind",
                    duration: 500
                }
            	, hide: {
            	    effect: "clip",
            	    duration: 700
            	}
                , open: function (event, ui) {

                }
            	, close: function (event, ui) {

            	}
                , position: [null, 75]
            });
        $dialog.dialog('open');
    });

    /* End of Edit Administrator */


    /* New Administrator */

    $(document).on("click", "#NewAdministrator", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var $loading = $('<div align="center"><img src="../../Images/ajax-loader.gif" alt="loading" class="ui-loading-icon"></div>');
        var $url = "/Administrator/RegistrationPartial/?roleid=2";
        var $title = "New Administrator";
        var $dialog = $('<div></div>');
        $dialog.empty();
        $dialog
            .append($loading)
            .load($url)
            .dialog({
                autoOpen: false
                , title: $title
                , width: 750
                , modal: true
                , minHeight: 200
                , resizable: false
                , show: {
                    effect: "blind",
                    duration: 500
                }
                , hide: {
                    effect: "clip",
                    duration: 700
                }
                , open: function (event, ui) {

                }
                , close: function (event, ui) {

                }
                , position: [null, 75]
            });
        $dialog.dialog('open');
    });

    /* End of New Administrator */

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
                var selectedIDs = $("input[name='AdministratorsToDelete']:checked").map(function () {
                    return $(this).val();
                }).toArray();

                $.ajax({
                    type: "post",
                    url: "/Administrator/DeleteAdministrators/?administratorstodelete=" + selectedIDs,
                    success: function (result) {
                        if (result == "success") {
                            $("#Div_ActionInformation").fadeIn();
                            $("#Div_ActionInformation").html('Administrators delted successfully..');
                            $("#Div_ActionInformation").fadeOut(5000);
                            AdministratorsRefresh();
                        }
                    }
                });
            }
        }
        else {
            alert("No Administrator(s) are selected to delete");
        }
    });

    /* End of Multiple Delete */

</script>
<div id="Div_Administrators">
    <% Html.RenderPartial("Partials/Users/Administrators/AdministratorsList"); %>
</div>