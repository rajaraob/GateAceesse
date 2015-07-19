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
            url: "/SuperAdministrator/ServiceProvidersListTable/?communityid=" + $("#Communities").val(),
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
        $("#Div_ServiceProviderDetails").show();
        $("#Div_ServiceProviderDetails").insertAfter("#serviceProvider" + serviceproviderid);
        $("#Div_ServiceProviderDetails").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
    }

    function ClearForServiceProviders(serviceproviderid) {
        $("#serviceProvider" + serviceproviderid).css('background-color', '#FFFFFF');
        $("#Div_ServiceProviderDetails").hide();
        $("#Div_ServiceProviderDetails").html('');
    }

    function ServiceProviderDetails(serviceproviderid) {
        $.ajax({
            type: "GET",
            url: "/SuperAdministrator/ServiceProviderDetails/?serviceproviderid=" + serviceproviderid + "&communityid=" + $("#Communities").val(),
            success: function (data) {
                $("#serviceProvider" + serviceproviderid).css('background-color', '#F3F3F3');
                $("#Div_ServiceProviderDetails").html(data);
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

    $('#Div_EditServiceProvider').dialog({
        autoOpen: false,
        width: 750,
        resizable: false,
        minHeight: 200,
        position: [null, 75],
        modal: true,
        title: "Edit ServiceProvider",
        show: {
            effect: "blind",
            duration: 500
        },
        hide: {
            effect: "clip",
            duration: 750
        },
        buttons: {
            "Update": function () {
                $("#editMessage").html(''); //make sure there is nothing on the message before we continue                         
                $("#Form_EditServiceProvider").submit();
            },
            "Cancel": function () {
                $(this).dialog("close");
            }
        }
    });

    $(document).on("click", ".editServiceProvider", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var $dialog = $("#Div_EditServiceProvider");
        $dialog.dialog('open');
        $dialog.html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..." /></div>');
        var $url = "/SuperAdministrator/EditServiceProvider/?serviceproviderid=" + this.name + "&communityid=" + $("#Communities").val();
        $.get($url, function (data) {
            $dialog.html(data);
        });
    });

    function updateSuccess() {
        if ($("#editMessage").html() == "True") {
            //now we can close the dialog
            $('#Div_EditServiceProvider').dialog('close');
            //twitter type notification
            $('#Div_ActionInformation').fadeIn();
            $('#Div_ActionInformation').html("Update Complete");
            $('#Div_ActionInformation').fadeOut(5000);
        }
        else {
            $("#Div_EditServiceProvider").html($("#editMessage").html());
        }
    }

    /* End of Edit ServiceProvider */


    /* New ServiceProvider */

    $('#Div_NewServiceProvider').dialog({
        autoOpen: false,
        width: 750,
        resizable: false,
        minHeight: 200,
        position: [null, 75],
        modal: true,
        title: "New ServiceProvider",
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
                $("#Form_NewServiceProvider").submit();
            },
            "Clear": function () {
                Clear(this);
            }
        }
    });

    $(document).on("click", "#NewServiceProvider", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var $dialog = $("#Div_NewServiceProvider");
        $dialog.dialog('open');
        $dialog.html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..." /></div>');
        var $url = "/SuperAdministrator/RegistrationPartial/?roleid=6&communityid=" + $("#Communities").val();
        $.get($url, function (data) {
            $dialog.html(data);
        });
    });

    function createSuccess() {
        if ($("#createMessage").html() == "True") {
            //now we can close the dialog
            $('#Div_NewServiceProvider').dialog('close');
            //twitter type notification
            $('#Div_ActionInformation').fadeIn();
            $('#Div_ActionInformation').html("Created Successfully...");
            $('#Div_ActionInformation').fadeOut(5000);
        }
        else {
            $("#Div_NewServiceProvider").html($("#createMessage").html());
        }
    }

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
<div id="Div_NewServiceProvider">
</div>
<div id="Div_EditServiceProvider">
</div>
<div id="Div_ServiceProviders">
    <% Html.RenderPartial("Partials/Users/ServiceProviders/ServiceProvidersList"); %>
</div>
