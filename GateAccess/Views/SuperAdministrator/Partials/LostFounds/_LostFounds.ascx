<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script type="text/javascript">

    $(document).on('change', "#Communities", function () {
        CleanForLostFounds();
        if ($(this).val() > 0) {
            LostFoundsList();
        }
    });

    function LostFoundsList() {
        $("#Div_LostFoundsList").empty();
        $("#Div_LostFoundsList").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" /></div>');
        $.ajax({
            type: "GET",
            timout: 5000,
            url: "/SuperAdministrator/LostFoundsList/?communityid=" + $("#Communities").val(),
            success: function (data) {
                $("#Div_LostFoundsList").html(data);
                NewLostFoundEnableDisable(true);
            }
        });
    }

    function CleanForLostFounds() {
        $("#Div_ActionInformation").empty();
        ClearForLostFounds();
        $("#Div_LostFoundsList").empty();
        NewLostFoundEnableDisable(false);
    }

    function NewLostFoundEnableDisable(value) {
        if (value == true)
            $("#NewLostFound").css("visibility", "visible");
        else
            $("#NewLostFound").css("visibility", "hidden");
    }

    $(document).on("click", "#lostFoundsRefresh", function (lfe) {
        lfe.preventDefault();
        lfe.stopImmediatePropagation();
        ClearForLostFounds();
        LostFoundsRefresh();
    });

    function LostFoundsRefresh() {
        $("#Div_LostFoundsListTable").empty();
        $("#Div_LostFoundsListTable").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>"  alt="Loading..." /></div>');
        $.ajax({
            type: "GET",
            timeout: 5000,
            url: "/SuperAdministrator/LostFoundsListTable/?communityid=" + $("#Communities").val(),
            success: function (data) {
                $("#Div_LostFoundsListTable").empty();
                $("#Div_LostFoundsListTable").html(data);
            },
            error: function (errdata)
            { }
        });
    }

    /***/

    $("#CheckAll").live("click", function () {
        $("input[name='LostFoundsToDelete']").attr("checked", this.checked);
        deletebuttonenabledisable();
    });

    $("input[name='LostFoundsToDelete']").live("click", function () {
        if ($("input[name='LostFoundsToDelete']").length == $("input[name='LostFoundsToDelete']:checked").length) {
            $("#CheckAll").attr("checked", "checked");
        }
        else {
            $("#CheckAll").removeAttr("checked");
        }
        deletebuttonenabledisable();
    });

    function deletebuttonenabledisable() {
        if ($("input[name='LostFoundsToDelete']:checked").length > 0) {
            $("#Btn_DeleteLostFounds").removeAttr("disabled");
        }
        else {
            $("#Btn_DeleteLostFounds").attr("disabled", true);
        }
    }

    $(document).on("click", "#Btn_DeleteLostFounds", function (lfe) {
        lfe.preventDefault();
        lfe.stopImmediatePropagation();
        var count = $("input[name='LostFoundsToDelete']:checked").length;
        if (count != 0) {
            if (confirm("R U Sure?   " + count + " LostFound(s) are deleted") == true) {
                var selectedIDs = $("input[name='LostFoundsToDelete']:checked").map(function () {
                    return $(this).val();
                }).toArray();

                $.ajax({
                    type: "post",
                    url: "/superadministrator/DeleteLostFounds/?lostfoundsselectedtodelete=" + selectedIDs,
                    success: function (result) {
                        alert(result);
                        if (result == true)
                            $("#Div_ActionInformation").fadeIn();
                        $("#Div_ActionInformation").html('LostFounds delted successfully..');
                        $("#Div_ActionInformation").fadeOut(5000);
                        LostFoundsRefresh();
                    }
                });
            }
        }
        else
            alert("No LostFound(s) are selected to delete");
    });

    /**/

    function ClearForLostFounds() {
        $("#Div_LostFoundDetails").empty();
        $("#Div_EditLostFound").empty();
        $("#Div_NewLostFound").empty();
    }

    $(document).on("click", ".lostFoundDetails", function (lfe) {
        lfe.preventDefault();
        lfe.stopImmediatePropagation();
        ClearForLostFounds();
        LostFoundDetails(this.name);
    });

    function LostFoundDetails(lostfoundid) {
        $("#Div_LostFoundDetails").empty();
        $("#Div_LostFoundDetails").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
        $.ajax({
            type: "GET",
            timeout: 5000,
            url: "/SuperAdministrator/LostFoundDetails/?lostfoundid=" + lostfoundid + "&communityid=" + $("#Communities").val(),
            success: function (data) {
                $("#Div_LostFoundDetails").html(data);
            },
            error: function (errdata)
            { }
        });
    }

    function DetailsClose(control) {
        ClearForLostFounds();
    }

    $(document).on("click", ".editLostFound", function (lfe) {
        lfe.preventDefault();
        lfe.stopImmediatePropagation();
        ClearForLostFounds();
        EditLostFound(this.name);
    });

    function EditLostFound(lostfoundid) {
        $("#Div_EditLostFound").empty();
        $("#Div_EditLostFound").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
        $.ajax({
            type: "GET",
            timeout: 5000,
            url: "/SuperAdministrator/EditLostFound/?lostfoundid=" + lostfoundid + "&communityid=" + $("#Communities").val(),
            success: function (data) {
                $("#Div_EditLostFound").html(data);
            },
            error: function (errdata)
            { }
        });
    }

    function EditClose(control) {
        ClearForLostFounds();
    }

    $(document).on("submit", "#Form_EditLostFound", function (lfe) {
        lfe.preventDefault();
        lfe.stopImmediatePropagation();
        $.ajax({
            type: "POST",
            data: $(this).serialize(),
            url: "/SuperAdministrator/UpdateLostFound",
            success: function (data) {
                if (data == true) {
                    $("#Div_ActionInformation").fadeIn();
                    $("#Div_ActionInformation").html('LostFound Updated Successfully...');
                    $("#Div_ActionInformation").fadeOut(3000);
                    $("#Div_EditLostFound").empty();
                    LostFoundsRefresh();
                }
            },
            error: function (errdata) { }
        });
    });


    $(document).on("click", ".newLostFound", function (lfe) {
        lfe.preventDefault();
        lfe.stopImmediatePropagation();
        ClearForLostFounds();
        NewLostFound();
    });

    function NewLostFound(communityid) {
        $("#Div_NewLostFound").empty();
        $("#Div_NewLostFound").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
        $.ajax({
            type: "GET",
            timeout: 5000,
            url: "/SuperAdministrator/NewLostFound/?communityid=" + $("#Communities").val(),
            success: function (data) {
                $("#Div_NewLostFound").html(data);
                alert(data);
            },
            error: function (errdata)
            { }
        });
    }

    function NewClose(control) {
        ClearForLostFounds();
    }

    /************************************/

    //    var lostfoundid;
    //    $('.delete').live("click", function (lfe) {
    //        lfe.preventDefault();
    //        lostfoundid = $(this).attr('name');
    //        $('#' + lostfoundid).css("background-color", "#F5D7C2");
    //        EditCleanForLostFounds();
    //        DetailsCleanForLostFounds();
    //        $.confirm({
    //            'title': 'Delete Confirmation',
    //            'message': 'Are you Sure?  Do you want to Delete <br/><b>" ' + $(this).attr('title') + ' "<b>',
    //            'buttons': {
    //                'Yes': {
    //                    'class': 'blue',
    //                    'action': function () {
    //                        $.ajax({
    //                            url: "/SuperAdministrator/DeleteLostFound/?lostfoundid=" + lostfoundid,
    //                            success: function (data) {
    //                                if (data == "NOTFOUND") {
    //                                    alert("Lost/Found not found");
    //                                }
    //                                else if (data == "ajaxerror") {
    //                                    alert("Ajax Error");
    //                                }
    //                                else if (data == "DELETED") {
    //                                    ajaxSuccess(data);
    //                                }
    //                            },
    //                            error: function (data) {
    //                                ajaxError(data);
    //                            }
    //                        })
    //                        return false;
    //                    }
    //                },
    //                'No': {
    //                    'class': 'gray',
    //                    'action': function () {
    //                        $('#' + lostfoundid).css("background-color", "");
    //                    } // Nothing to do in this caslfe. You can as well omit the action property.
    //                }
    //            }
    //        });
    //    });

    //    function ajaxError(edata) {
    //        $("#ActionInformation").fadeIn();
    //        $("#ActionInformation").html('Error, Try after sometimlfe.');
    //        $("#ActionInformation").fadeOut("slow");
    //    }

    //    function ajaxSuccess(sdata) {
    //        $('#' + lostfoundid).remove();
    //        $("#ActionInformation").fadeIn();
    //        $("#ActionInformation").html('Lost/Found Deleted Successfully..');
    //        $("#ActionInformation").fadeOut(4000);
    //    }

    /**********************************/

</script>
<br />
<div>
    <fieldset>
        <legend>Lost/Founds</legend>
        <br />
        <table width="100%">
            <tr>
                <td style="text-align: left">
                    <b>Communities :</b>
                    <%:Html.DropDownList("Communities", new SelectList((IEnumerable)ViewBag.CommunitiesList, "CommunityID", "CommunityName"), ((List<GateAccess.Models.CommunitiesModel>)ViewBag.CommunitiesList).Count > 0 ? "-- Select Community --" : "-- No Communities --", new { style = "font-size:12px;width:300px" })%><br />
                </td>
                <td style="text-align: right">
                    <img src="<%: Url.Content("~/Images/newlostfound.png")%>" style="visibility: hidden;
                        cursor: pointer" id="NewLostFound" class="newLostFound" alt="New LostFound" onmousedown="this.src='<%: Url.Content("~/Images/newlostfoundclick.png")%>'"
                        onmouseup="this.src='<%: Url.Content("~/Images/newlostfound.png")%>'" />
                </td>
            </tr>
        </table>
        <div id="Div_LostFoundsList">
        </div>
    </fieldset>
</div>
