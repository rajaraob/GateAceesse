<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script type="text/javascript" language="javascript">

    $(document).on('change', "#Communities", function () {
        CleanForMaintenances();
        if ($(this).val() > 0) {
            MaintenancesList();
        }
    });

    function MaintenancesList() {
        $("#Div_MaintenancesList").empty();
        $("#Div_MaintenancesList").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" /></div>');
        $.ajax({
            type: "GET",
            timout: 5000,
            url: "/SuperAdministrator/MaintenancesList/?communityid=" + $("#Communities").val(),
            success: function (data) {
                $("#Div_MaintenancesList").html(data);
                NewMaintenanceEnableDisable(true);
            }
        });
    }

    function CleanForMaintenances() {
        $("#Div_ActionInformation").empty();
        $("#Div_MaintenancesList").empty();
        NewMaintenanceEnableDisable(false);
    }

    function NewMaintenanceEnableDisable(value) {
        if (value == true)
            $("#NewMaintenance").css("visibility", "visible");
        else
            $("#NewMaintenance").css("visibility", "hidden");
    }


    /*  Maintenance Refresh */

    $(document).on("click", "#maintenancesRefresh", function () {
        MaintenancesRefresh()
    });

    function MaintenancesRefresh() {
        $("#Div_MaintenancesListTable").empty();
        $("#Div_MaintenancesListTable").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>"  alt="Loading..." /></div>');
        $.ajax({
            type: "GET",
            timeout: 5000,
            url: "/SuperAdministrator/MaintenancesListTable/?communityid=" + $("#Communities").val(),
            success: function (data) {
                $("#Div_MaintenancesListTable").empty();
                $("#Div_MaintenancesListTable").html(data);
                history.pushState({}, "", "/SuperAdministrator/Maintenances");
            },
            error: function (errdata)
            { }
        });
    }

    /* End of Multiple Refrsh */

    /* Multiple Delete */

    $("#CheckAll").live("click", function () {
        $("input[name='MaintenancesToDelete']").attr("checked", this.checked);
        deletebuttonenabledisable();
    });

    $("input[name='MaintenancesToDelete']").live("click", function () {
        if ($("input[name='MaintenancesToDelete']").length == $("input[name='MaintenancesToDelete']:checked").length) {
            $("#CheckAll").attr("checked", "checked");
        }
        else {
            $("#CheckAll").removeAttr("checked");
        }
        deletebuttonenabledisable();
    });

    function deletebuttonenabledisable() {
        if ($("input[name='MaintenancesToDelete']:checked").length > 0) {
            $("#Btn_DeleteMaintenances").removeAttr("disabled");
        }
        else {
            $("#Btn_DeleteMaintenances").attr("disabled", true);
        }
    }

    $(document).on('click', "#Btn_DeleteMaintenances", function (me) {
        me.preventDefault();
        me.stopImmediatePropagation();
        var count = $("input[name='MaintenancesToDelete']:checked").length;
        if (count != 0) {
            if (confirm("R U Sure?   " + count + " Maintenance(s) are deleted") == true) {
                var selectedIDs = $("input[name='MaintenancesToDelete']:checked").map(function () {
                    return $(this).val();
                }).toArray();

                $.ajax({
                    type: "post",
                    url: "/superadministrator/DeleteMaintenances/?maintenancesselectedtodelete=" + selectedIDs,
                    success: function (result) {
                        $("#Div_ActionInformation").fadeIn();
                        $("#Div_ActionInformation").html('Maintenances delted successfully..');
                        $("#Div_ActionInformation").fadeOut(5000);
                        MaintenancesRefresh();
                    }
                });
            }
        }
        else
            alert("No Maintenance(s) are selected to delete");
    });

    /* End of Multiple Delete */

    /* Maintenance Details */

    var pmid = null;
    var isdivopen = false;

    $(document).on('click', ".maintenanceDetails", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        HandlePreviousMaintenance(this.name);
    });

    function HandlePreviousMaintenance(cmid) {
        if (isdivopen == true) {
            if (cmid == pmid) {
                ClearForMaintenances(pmid);
                isdivopen = false;
                pmid = null;
            }
            else {
                ClearForMaintenances(pmid);
                BeforeLoading(cmid);
                MaintenanceDetails(cmid);
                pmid = cmid;
            }
        }
        else {
            BeforeLoading(cmid);
            MaintenanceDetails(cmid);
            pmid = cmid;
            isdivopen = true;
        }
    }

    function BeforeLoading(maintenanceid) {
        $("#Div_MaintenanceDetails").show();
        $("#Div_MaintenanceDetails").insertAfter("#maintenance" + maintenanceid);
        $("#Div_MaintenanceDetails").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
    }

    function ClearForMaintenances(maintenanceid) {
        $("#maintenance" + maintenanceid).css('background-color', '#FFFFFF');
        $("#Div_MaintenanceDetails").hide();
        $("#Div_MaintenanceDetails").html('');
    }

    function MaintenanceDetails(maintenanceid) {
        $.ajax({
            type: "GET",
            url: "/SuperAdministrator/MaintenanceDetails/?maintenanceid=" + maintenanceid + "&communityid=" + $("#Communities").val(),
            success: function (data) {
                $("#maintenance" + maintenanceid).css('background-color', '#F3F3F3');
                $("#Div_MaintenanceDetails").html(data);
            },
            error: function (errdata)
            { }
        });
    }

    $(document).on("click", "#MaintenanceDetailsClose", function () {
        ClearForMaintenances(this.name);
        isdivopen = false;
        pmid = null;
    });


    /* End of Maintenance Details */

    /* Edit Maintenance */

    $('#Div_EditMaintenance').dialog({
        autoOpen: false,
        width: 575,
        resizable: false,
        minHeight: 200,
        position: [null, 75],
        modal: true,
        title: "Edit Maintenance",
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
                $("#Form_EditMaintenance").submit();
            },
            "Cancel": function () {
                $(this).dialog("close");
            }
        }
    });

    $(document).on("click", ".editMaintenance", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var $dialog = $("#Div_EditMaintenance");
        $dialog.dialog('open');
        $dialog.html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..." /></div>');
        var $url = "/SuperAdministrator/EditMaintenance/?maintenanceid=" + this.name + "&communityid=" + $("#Communities").val();        
        $.get($url, function (data) {
            $dialog.html(data);
        });
    });

    function updateSuccess() {
        if ($("#editMessage").html() == "True") {
            //now we can close the dialog
            $('#Div_EditMaintenance').dialog('close');
            //twitter type notification
            $('#Div_ActionInformation').fadeIn();
            $('#Div_ActionInformation').html("Update Complete");
            $('#Div_ActionInformation').fadeOut(5000);
        }
        else {
            $("#Div_EditMaintenance").html($("#editMessage").html());
        }
    }

    /* End of Edit Maintenance */

    /* New Maintenance */

    $('#Div_NewMaintenance').dialog({
        autoOpen: false,
        width: 575,
        resizable: false,
        minHeight: 200,
        position: [null, 75],
        modal: true,
        title: "New Maintenance",
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
                $("#Form_NewMaintenance").submit();
            },
            "Clear": function () {
                Clear(this);
            }
        }
    });

    $(document).on("click", "#NewMaintenance", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var $dialog = $("#Div_NewMaintenance");
        $dialog.dialog('open');
        $dialog.html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..." /></div>');
        var $url = "/SuperAdministrator/NewMaintenance/?communityid=" + $("#Communities").val();
        var $title = "New Maintenance";
        $.get($url, function (data) {
            $dialog.html(data);
        });
    });

    function createSuccess() {
        if ($("#createMessage").html() == "True") {
            //now we can close the dialog
            $('#Div_NewMaintenance').dialog('close');
            //twitter type notification
            $('#Div_ActionInformation').fadeIn();
            $('#Div_ActionInformation').html("Created Successfully...");
            $('#Div_ActionInformation').fadeOut(5000);
        }
        else {
            $("#Div_NewMaintenance").html($("#createMessage").html());
        }
    }

    /* End of New Maintenance */

</script>
<div>
    <fieldset>
        <legend>Maintenances</legend>
        <br />
        <table width="100%">
            <tr>
                <td style="text-align: left">
                    <b>Communities :</b>
                    <%:Html.DropDownList("Communities", new SelectList((IEnumerable)ViewBag.CommunitiesList, "CommunityID", "CommunityName"), ((List<GateAccess.Models.CommunitiesModel>)ViewBag.CommunitiesList).Count > 0 ? "-- Select Community --" : "-- No Communities --", new { style = "font-size:12px;width:300px" })%><br />
                </td>
                <td style="text-align: right">
                    <img id="NewMaintenance" style="visibility: hidden; cursor: pointer" src="<%: Url.Content("~/Images/newmaintenance.png")%>"
                        alt="NewCommunity" align="right" onmousedown="this.src='<%: Url.Content("~/Images/newmaintenanceclick.png")%>'"
                        onmouseup="this.src='<%: Url.Content("~/Images/newmaintenance.png")%>'" />
                </td>
            </tr>
        </table>
        <div id="Div_EditMaintenance">
        </div>
        <div id="Div_NewMaintenance">
        </div>
        <div id="Div_MaintenancesList">
        </div>
    </fieldset>
</div>
