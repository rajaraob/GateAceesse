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
            url: "/Administrator/SecurityManagersListTable",
            success: function (data) {
                $("#Div_SecurityManagersListTable").html(data);
            },
            error: function (errdata)
            { }
        });
    }

    /* SecurityManager Details */

    var issecuritymanagerdivopen = false;
    var oldsecuritymanagerid = null;

    $(document).on("click", ".securityManagerDetails", function (e) {
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
                SecurityManagerDetails(currentsecuritymanagerid);
                oldsecuritymanagerid = currentsecuritymanagerid;
            }
        }
        else {            
            BeforeLoading(currentsecuritymanagerid);
            SecurityManagerDetails(currentsecuritymanagerid);
            issecuritymanagerdivopen = true;
            oldsecuritymanagerid = currentsecuritymanagerid;
        }
    }

    function BeforeLoading(securitymanagerid) {
        $("#Div_Operations").show("slow");
        $("#Div_Operations").insertAfter("#securityManager" + securitymanagerid);
        $("#Div_Operations").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
    }

    function ClearForSecurityManagers(securitymanagerid) {
        $("#securityManager" + securitymanagerid).css('background-color', '#FFFFFF');
        $("#Div_Operations").hide();
        $("#Div_Operations").html('');
    }

    function SecurityManagerDetails(securitymanagerid) {
        $.ajax({
            type: "GET",
            url: "/Administrator/SecurityManagerDetails/?securitymanagerid=" + securitymanagerid,
            success: function (data) {
                $("#securityManager" + securitymanagerid).css('background-color', '#F3F3F3');
                $("#Div_Operations").html(data);                
            },
            error: function (errdata)
            { }
        });
    }

    $(document).on("click", "#securityManagerDetailsClose", function () {
        ClearForSecurityManagers(this.name);
        issecuritymanagerdivopen = false;
        oldsecuritymanagerid = null;
    });

    /* End of SecurityManager Details  */

    /* Edit SecurityManager */

    $(document).on("click", ".editSecurityManager", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var $loading = $('<div align="center"><img src="../../Images/ajax-loader.gif" alt="loading" class="ui-loading-icon"></div>');
        var $url = "/Administrator/EditSecurityManager/?securitymanagerid=" + this.name;
        var $title = "Edit SecurityManager";
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

    /* End of Edit SecurityManager */


    /* New SecurityManager */

    $(document).on("click", "#NewSecurityManager", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var $loading = $('<div align="center"><img src="../../Images/ajax-loader.gif" alt="loading" class="ui-loading-icon"></div>');
        var $url = "/Administrator/RegistrationPartial/?roleid=3";
        var $title = "New SecurityManager";
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
<div id="Div_SecurityManagers">
    <% Html.RenderPartial("Partials/Users/SecurityManagers/SecurityManagersList"); %>
</div>
