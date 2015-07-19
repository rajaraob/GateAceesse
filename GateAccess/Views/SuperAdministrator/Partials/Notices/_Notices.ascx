<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script type="text/javascript">

    $(document).on("change", "#Communities", function () {
        CleanForNotices();
        if ($(this).val() > 0) {
            NoticesList();
        }
    });

    function NoticesList() {
        $("#Div_NoticesList").empty();
        $("#Div_NoticesList").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" /></div>');
        $.ajax({
            type: "GET",
            timeout: 5000,
            url: "/SuperAdministrator/NoticesList/?communityid=" + $("#Communities").val(),
            success: function (data) {
                $("#Div_NoticesList").html(data);
                NewNoticeEnableDisable(true);
            },
            error: function (errdata)
            { }
        });
    }

    function CleanForNotices() {
        $("#Div_ActionInformation").empty();
        $("#Div_NoticesList").empty();
        NewNoticeEnableDisable(false);
    }

    function NewNoticeEnableDisable(value) {
        if (value == true)
            $("#NewNotice").css("visibility", "visible");
        else
            $("#NewNotice").css("visibility", "hidden");
    }

    $(document).on("click", "#noticesRefresh", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        NoticesRefresh();
    });

    function NoticesRefresh() {
        $("#Div_NoticesListTable").empty();
        $("#Div_NoticesListTable").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
        $.ajax({
            type: "GET",
            timeout: 5000,
            url: "/SuperAdministrator/NoticesListTable/?communityid=" + $("#Communities").val(),
            success: function (data) {
                $("#Div_NoticesListTable").html(data);
            },
            error: function (errdata)
            { }
        });
    }

    /* Multiple Delete */

    $("#CheckAll").live("click", function () {
        $("input[name='NoticesToDelete']").attr("checked", this.checked);
        deletebuttonenabledisable();
    });

    $("input[name='NoticesToDelete']").live("click", function () {
        if ($("input[name='NoticesToDelete']").length == $("input[name='NoticesToDelete']:checked").length) {
            $("#CheckAll").attr("checked", "checked");
        }
        else {
            $("#CheckAll").removeAttr("checked");
        }
        deletebuttonenabledisable();
    });

    function deletebuttonenabledisable() {
        if ($("input[name='NoticesToDelete']:checked").length > 0) {
            $("#Btn_DeleteNotices").removeAttr("disabled");
        }
        else {
            $("#Btn_DeleteNotices").attr("disabled", true);
        }
    }

    $(document).on("submit", "#NoticesList", function (e) {
        ne.preventDefault();
        ne.stopImmediatePropagation();
        var count = $("input[name='NoticesToDelete']:checked").length;
        if (count != 0) {
            if (confirm("R U Sure?   " + count + " Notice(s) are deleted") == true) {
                var selectedIDs = $("input[name='NoticesToDelete']:checked").map(function () {
                    return $(this).val();
                }).toArray();

                $.ajax({
                    type: "post",
                    url: "/superadministrator/DeleteNotices/?noticesselectedtodelete=" + selectedIDs,
                    success: function (result) {
                        if (result == true) {
                            $("#Div_ActionInformation").fadeIn();
                            $("#Div_ActionInformation").html('Notices delted successfully..');
                            $("#Div_ActionInformation").fadeOut(5000);
                            NoticesRefresh();
                        }
                    }
                });
            }
        }
        else
            alert("No Notice(s) are selected to delete");
    });

    /*End of Multiple Delete*/

    /* Notice Details */

    var isnoticedivopen = false;
    var oldnoticeid = null;

    $(document).on("click", ".noticeDetails", function (ne) {
        ne.preventDefault();
        ne.stopImmediatePropagation();
        HandlePreviousNotice(this.name);
    });

    function HandlePreviousNotice(noticeid) {
        if (isnoticedivopen == true) {
            if (noticeid == oldnoticeid) {
                ClearForNotices(oldnoticeid);
                isnoticedivopen = false;
                oldnoticeid = null;
            }
            else {
                ClearForNotices(oldnoticeid);
                BeforeLoading(noticeid);
                NoticeDetails(noticeid);
                oldnoticeid = noticeid;
            }
        }
        else {
            BeforeLoading(noticeid);
            NoticeDetails(noticeid);
            oldnoticeid = noticeid;
            isnoticedivopen = true;
        }
    }

    function BeforeLoading(noticeid) {
        $("#Div_NoticeDetails").show("slow");
        $("#Div_NoticeDetails").insertAfter("#notice" + noticeid);
        $("#Div_NoticeDetails").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
    }

    function ClearForNotices(noticeid) {
        $("#notice" + noticeid).css('background-color', '#FFFFFF');
        $("#Div_NoticeDetails").hide();
        $("#Div_NoticeDetails").html('');
    }

    function NoticeDetails(noticeid) {
        $.ajax({
            type: "GET",
            url: "/SuperAdministrator/NoticeDetails/?noticeid=" + noticeid + "&communityid=" + $("#Communities").val(),
            success: function (data) {
                $("#notice" + noticeid).css('background-color', '#F3F3F3');
                $("#Div_NoticeDetails").html(data);
            },
            error: function (errdata)
            { }
        });
    }

    $(document).on("click", "#NoticeDetailsClose", function () {
        ClearForNotices(this.name);
        isnoticedivopen = false;
        oldnoticeid = null;
    });

    /* End of Notice Details */

    /* Edit Notice */

    $('#Div_EditNotice').dialog({
        autoOpen: false,
        width: 450,
        resizable: false,
        minHeight: 200,
        position: [null, 75],
        modal: true,
        title: "Edit Notice",
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
                $("#Form_EditNotice").submit();
            },
            "Cancel": function () {
                $(this).dialog("close");
            }
        }
    });

    $(document).on("click", ".editNotice", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var $dialog = $("#Div_EditNotice");
        $dialog.dialog('open');
        $dialog.html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..." /></div>');
        var $url = "/SuperAdministrator/EditNotice/?noticeid=" + this.name + "&communityid=" + $("#Communities").val();
        $.get($url, function (data) {
            $dialog.html(data);
        });
    });

    function updateSuccess() {
        if ($("#editMessage").html() == "True") {
            //now we can close the dialog
            $('#Div_EditNotice').dialog('close');
            //twitter type notification
            $('#Div_ActionInformation').fadeIn();
            $('#Div_ActionInformation').html("Update Complete");
            $('#Div_ActionInformation').fadeOut(5000);
        }
        else {
            $("#Div_EditNotice").html($("#editMessage").html());
        }
    }

    /* End of Edit Notice */

    /* New Notice */

    $('#Div_NewNotice').dialog({
        autoOpen: false,
        width: 450,
        resizable: false,
        minHeight: 200,
        position: [null, 75],
        modal: true,
        title: "New Notice",
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
                $("#Form_NewNotice").submit();
            },
            "Clear": function () {
                Clear(this);
            }
        }
    });

    $(document).on("click", "#NewNotice", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var $dialog = $("#Div_NewNotice");
        $dialog.dialog('open');
        $dialog.html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..." /></div>');
        var $url = "/SuperAdministrator/NewNotice/?communityid=" + $("#Communities").val();
        $.get($url, function (data) {
            $dialog.html(data);
        });
    });

    function createSuccess() {
        if ($("#createMessage").html() == "True") {
            //now we can close the dialog
            $('#Div_NewNotice').dialog('close');
            //twitter type notification
            $('#Div_ActionInformation').fadeIn();
            $('#Div_ActionInformation').html("Created Successfully...");
            $('#Div_ActionInformation').fadeOut(5000);
        }
        else {
            $("#Div_NewNotice").html($("#createMessage").html());
        }
    }

    /* End of New Notice */      

</script>
<div>
    <fieldset>
        <legend>Notices</legend>
        <br />
        <table width="100%">
            <tr>
                <td style="text-align: left">
                    <b>Communities :</b>
                    <%:Html.DropDownList("Communities", new SelectList((IEnumerable)ViewBag.CommunitiesList, "CommunityID", "CommunityName"), ((List<GateAccess.Models.CommunitiesModel>)ViewBag.CommunitiesList).Count > 0 ? "-- Select Community --" : "-- No Communities --", new { style = "font-size:12px;width:300px;" })%><br />
                </td>
                <td style="text-align: right">
                    <img id="NewNotice" class="newNotice" style="visibility: hidden; cursor: pointer"
                        src="<%: Url.Content("~/Images/newnotice.png")%>" alt="NewNotice" onmousedown="this.src='<%: Url.Content("~/Images/newnoticeclick.png")%>'"
                        onmouseup="this.src='<%: Url.Content("~/Images/newnotice.png")%>'" />
                </td>
            </tr>
        </table>
        <div id="Div_EditNotice">
        </div>
        <div id="Div_NewNotice">
        </div>
        <div id="Div_NoticesList">
        </div>
    </fieldset>
</div>
