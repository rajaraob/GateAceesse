<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Administrator/Administrator.Master"
    Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Maintenances
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" language="javascript">

        $(document).on("click", "#maintenancesRefresh", function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            MaintenancesRefresh()
        });

        function MaintenancesRefresh() {
            $("#Div_MaintenancesListTable").empty();
            $("#Div_MaintenancesListTable").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>"  alt="Loading..." /></div>');
            $.ajax({
                type: "GET",
                timeout: 5000,
                url: "/Administrator/MaintenancesListTable",
                success: function (data) {
                    $("#Div_MaintenancesListTable").empty();
                    $("#Div_MaintenancesListTable").html(data);
                },
                error: function (errdata)
                { }
            });
        }

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
            $("#Div_Operations").show();
            $("#Div_Operations").insertAfter("#maintenance" + maintenanceid);
            $("#Div_Operations").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
        }

        function ClearForMaintenances(maintenanceid) {
            $("#maintenance" + maintenanceid).css('background-color', '#FFFFFF');
            $("#Div_Operations").hide();
            $("#Div_Operations").html('');
        }

        function MaintenanceDetails(maintenanceid) {
            $.ajax({
                type: "GET",
                url: "/Administrator/MaintenanceDetails/?maintenanceid=" + maintenanceid,
                success: function (data) {
                    $("#maintenance" + maintenanceid).css('background-color', '#F3F3F3');
                    $("#Div_Operations").html(data);
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

        $(document).on("click", ".editMaintenance", function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            var $loading = $('<div align="center"><img src="../../Images/ajax-loader.gif" alt="loading" class="ui-loading-icon"></div>');
            var $url = "/Administrator/EditMaintenance/?maintenanceid=" + this.name;
            var $title = "Edit Maintenance";
            var $dialog = $('<div></div>');
            $dialog.empty();
            $dialog
            .append($loading)
            .load($url)
            .dialog({
                autoOpen: false
                , title: $title
                , width: 570
                , modal: true
                , minHeight: 200
                , resizable: false
                , show: {
                    effect: "blind",
                    duration: 500
                }
                , hide: {
                    effect: "clip",
                    duration: 500
                }
                , position: [null, 75]
            });
            $dialog.dialog('open');
        });



        //    $(document).on("submit", "#Form_EditMaintenance", function (me) {
        //        me.preventDefault();
        //        me.stopImmediatePropagation();
        //        $.ajax({
        //            type: "POST",
        //            data: $(this).serialize(),
        //            url: "/Administrator/UpdateMaintenance",
        //            success: function (data) {
        //                if (data == true) {
        //                    $("#Div_ActionInformation").fadeIn();
        //                    $("#Div_ActionInformation").html('Maintenance Updated Successfully...');
        //                    $("#Div_ActionInformation").fadeOut(3000);
        //                    $("#Div_EditLostFound").empty();
        //                    MaintenancesRefresh();
        //                }
        //            },
        //            error: function (errdata) { }
        //        });
        //    });

        /* End of Edit Maintenance */

        /* New Maintenance */

        $(document).on("click", "#NewMaintenance", function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            var $loading = $('<div align="center"><img src="../../Images/ajax-loader.gif" alt="loading" class="ui-loading-icon"></div>');
            var $url = "/Administrator/NewMaintenance";
            var $title = "New Maintenance";
            var $dialog = $('<div></div>');
            $dialog.empty();
            $dialog
            .append($loading)
            .load($url)
            .dialog({
                autoOpen: false
                , title: $title
            	, width: 570
                , modal: true
            	, minHeight: 200
                , resizable: false
                , show: {
                    effect: "blind",
                    duration: 500
                }
            	, hide: {
            	    effect: "clip",
            	    duration: 500
            	}
                , position: [null, 75]
            });
            $dialog.dialog('open');
        });

        /* End of New Maintenance */

    </script>
    <div>
        <fieldset>
            <legend>Maintenances</legend>
            <br />
            <table width="100%">
                <tr>
                    <td style="text-align: right">
                        <img id="NewMaintenance" style="cursor: pointer" src="<%: Url.Content("~/Images/newmaintenance.png")%>"
                            alt="NewCommunity" align="right" onmousedown="this.src='<%: Url.Content("~/Images/newmaintenanceclick.png")%>'"
                            onmouseup="this.src='<%: Url.Content("~/Images/newmaintenance.png")%>'" />
                    </td>
                </tr>
            </table>
            <div id="Div_MaintenancesList">
                <% Html.RenderPartial("Partials/Maintenances/MaintenancesList");%>
            </div>
        </fieldset>
    </div>
</asp:Content>
