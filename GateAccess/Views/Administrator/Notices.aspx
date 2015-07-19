<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Administrator/Administrator.Master"
    Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Notices
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">

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
                url: "/Administrator/NoticesListTable/?communityid=" + $("#Communities").val(),
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
            $("#Div_Operations").show("slow");
            $("#Div_Operations").insertAfter("#notice" + noticeid);
            $("#Div_Operations").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
        }

        function ClearForNotices(noticeid) {
            $("#notice" + noticeid).css('background-color', '#FFFFFF');
            $("#Div_Operations").hide();
            $("#Div_Operations").html('');
        }

        function NoticeDetails(noticeid) {
            $.ajax({
                type: "GET",
                url: "/Administrator/NoticeDetails/?noticeid=" + noticeid + "&communityid=" + $("#Communities").val(),
                success: function (data) {
                    $("#notice" + noticeid).css('background-color', '#F3F3F3');
                    $("#Div_Operations").html(data);
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

        $(document).on("click", ".editNotice", function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            var $loading = $('<div align="center"><img src="../../Images/ajax-loader.gif" alt="loading" class="ui-loading-icon"></div>');
            var $url = "/Administrator/EditNotice/?noticeid=" + this.name + "&communityid=" + $("#Communities").val();
            var $title = "Edit Notice";
            var $dialog = $('<div></div>');
            $dialog.empty();
            $dialog
            .append($loading)
            .load($url)
            .dialog({
                autoOpen: false
                , title: $title
                , width: 450
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
                , position: 'center'
            });
            $dialog.dialog('open');
        });

        /* New Notice */

        $(document).on("click", "#NewNotice", function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            var $loading = $('<div align="center"><img src="../../Images/ajax-loader.gif" alt="loading" class="ui-loading-icon"></div>');
            var $url = "/Administrator/NewNotice/?communityid=" + $("#Communities").val();
            var $title = "New Notice";
            var $dialog = $('<div></div>');
            $dialog.empty();
            $dialog
            .append($loading)
            .load($url)
            .dialog({
                autoOpen: false
                , title: $title
                , width: 450
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
                , open: function () {

                }
                , position: 'center'
            });
            $dialog.dialog('open');
        });

        /* End of New Notice */

        //    $(document).on("submit", "#Form_EditNotice", function (e) {
        //        ne.preventDefault();
        //        ne.stopImmediatePropagation();
        //        $.ajax({
        //            type: "POST",
        //            data: $(this).serialize(),
        //            url: "/Administrator/UpdateNotice",
        //            success: function (data) {
        //                if (data == true) {
        //                    $("#Div_ActionInformation").fadeIn();
        //                    $("#Div_ActionInformation").html('Notice Updated Successfully...');
        //                    $("#Div_ActionInformation").fadeOut(3000);
        //                    $("#Div_EditLostFound").empty();
        //                    NoticesRefresh();
        //                }
        //            },
        //            error: function (errdata) { }
        //        });
        //    });

        /* End of Edit Notice */

    </script>
    <div>
        <fieldset>
            <legend>Notices</legend>
            <table width="100%">
                <tr>
                    <td style="text-align: right">
                        <img id="NewNotice" class="newNotice" style="cursor: pointer" src="<%: Url.Content("~/Images/newnotice.png")%>"
                            alt="NewCommunity" onmousedown="this.src='<%: Url.Content("~/Images/newnoticeclick.png")%>'"
                            onmouseup="this.src='<%: Url.Content("~/Images/newnotice.png")%>'" />
                    </td>
                </tr>
            </table>
            <div id="Div_NoticesList">
                <% Html.RenderPartial("Partials/Notices/NoticesList");%>
            </div>
        </fieldset>
    </div>
</asp:Content>
