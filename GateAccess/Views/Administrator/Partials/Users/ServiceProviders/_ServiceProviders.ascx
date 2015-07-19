<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script type="text/javascript">

    $(document).on("click", "#serviceProviderRefresh", function () {
        ServiceProvidersRefresh();
    });

    function ServiceProvidersRefresh() {
        $("#Div_ServiceProvidersListTable").empty();
        $("#Div_ServiceProvidersListTable").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
        $.ajax({
            type: "GET",
            timeout: 5000,
            url: "/Administrator/ServiceProvidersListTable",
            success: function (data) {
                $("#Div_ServiceProvidersListTable").html(data);
            },
            error: function (errdata)
            { }
        });
    }

    /* ServiceProvider Details */

    var isserviceproviderdivopen = false;
    var oldserviceproviderid = null;

    $(document).on("click", ".serviceProviderDetails", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        HandlePreviousServiceProvider(this.name);
    });

    function HandlePreviousServiceProvider(serviceproviderid) {
        if (isserviceproviderdivopen == true) {
            if (oldserviceproviderid == serviceproviderid) {
                ClearForServiceProviders(oldserviceproviderid);
                isserviceproviderdivopen = false;
                oldserviceproviderid = null;
            }
            else {
                ClearForServiceProviders(oldserviceproviderid);
                BeforeLoading(serviceproviderid);
                ServiceProviderDetails(serviceproviderid);
                oldserviceproviderid = serviceproviderid;
            }
        }
        else {
            BeforeLoading(serviceproviderid);
            ServiceProviderDetails(serviceproviderid);
            isserviceproviderdivopen = true;
            oldserviceproviderid = serviceproviderid;
        }
    }

    function BeforeLoading(serviceproviderid) {
        $("#Div_Operations").show();
        $("#Div_Operations").insertAfter("#serviceProvider" + serviceproviderid);
        $("#Div_Operations").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
    }

    function ClearForServiceProviders(serviceproviderid) {
        $("#serviceProvider" + serviceproviderid).css('background-color', '#FFFFFF');
        $("#Div_Operations").hide();
        $("#Div_Operations").html('');
    }

    function ServiceProviderDetails(serviceproviderid) {
        $.ajax({
            type: "GET",
            url: "/Administrator/ServiceProviderDetails/?serviceproviderid=" + serviceproviderid,
            success: function (data) {
                $("#serviceProvider" + serviceproviderid).css('background-color', '#F3F3F3');
                $("#Div_Operations").html(data);
            },
            error: function (errdata)
            { }
        });
    }

    $(document).on("click", "#serviceProviderDetailsClose", function () {
        ClearForServiceProviders(this.name);
        isserviceproviderdivopen = false;
        oldserviceproviderid = null;
    });

    /* End of ServiceProvider Details  */

    /* Edit ServiceProvider */

    $(document).on("click", ".editServiceProvider", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();

        var $loading = $('<div align="center"><img src="../../Images/ajax-loader.gif" alt="loading" class="ui-loading-icon"></div>');
        var $url = "/Administrator/EditServiceProvider/?serviceproviderid=" + this.name;
        var $title = "Edit ServiceProvider";
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

    /* End of Edit ServiceProvider */


    /* New ServiceProvider */

    $(document).on("click", "#NewServiceProvider", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var $loading = $('<div align="center"><img src="../../Images/ajax-loader.gif" alt="loading" class="ui-loading-icon"></div>');
        var $url = "/Administrator/RegistrationPartial/?roleid=6";
        var $title = "New ServiceProvider";
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

    /* End of New ServiceProvider */

    /* Multiple Delete */

    $("#CheckAll").live("click", function () {
        $("input[name='ServiceProvidersToDelete']").attr("checked", this.checked);
        deletebuttonenabledisable();
    });

    $("input[name='ServiceProvidersToDelete']").live("click", function () {
        if ($("input[name='ServiceProvidersToDelete']").length == $("input[name='ServiceProvidersToDelete']:checked").length) {
            $("#CheckAll").attr("checked", "checked");
        }
        else {
            $("#CheckAll").removeAttr("checked");
        }
        deletebuttonenabledisable();
    });

    function deletebuttonenabledisable() {
        if ($("input[name='ServiceProvidersToDelete']:checked").length > 0) {
            $("#Btn_DeleteServiceProviders").removeAttr("disabled");
        }
        else {
            $("#Btn_DeleteServiceProviders").attr("disabled", true);
        }
    }

    $(document).on("click", "#Btn_DeleteServiceProviders", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var count = 0;
        count = $("input[name='ServiceProvidersToDelete']:checked").length;
        if (count > 0) {
            if (confirm("R U Sure?  " + count + " ServiceProviders are deleted")) {
                var selectedIDs = $("input[name='ServiceProvidersToDelete']:checked").map(function () {
                    return $(this).val();
                }).toArray();

                $.ajax({
                    type: "post",
                    url: "/superserviceProvider/DeleteServiceProviders/?serviceProviderstodelete=" + selectedIDs,
                    success: function (result) {
                        if (result == "success") {
                            $("#Div_ActionInformation").fadeIn();
                            $("#Div_ActionInformation").html('ServiceProviders delted successfully..');
                            $("#Div_ActionInformation").fadeOut(5000);
                            ServiceProvidersRefresh();
                        }
                    }
                });
            }
        }
        else {
            alert("No ServiceProvider(s) are selected to delete");
        }
    });

    /* End of Multiple Delete */

</script>
<div id="Div_ServiceProviders">
    <% Html.RenderPartial("Partials/Users/ServiceProviders/ServiceProvidersList"); %>
</div>
