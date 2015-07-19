<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.NoticesModel>" %>
<%@ Import Namespace="System.Collections.Generic" %>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
    type="text/javascript"></script>
<%--<script type="text/javascript">
//    function CharCount() {
//        var max = 700;
//        var len = $(this).val().length;
//        if (len >= max) {
//            $('#charNum').text(len + 'characters. reached the limit');
//        } else {
//            var ch = max - len;
//            $('#charNum').text(ch + ' characters left');
//        }
//    }

//    function OnLoad() {
//        CharCount();
//    }

//    $(document).ready(function () {
//        $('#charNum').text('700 characters left');
//        $(document).on('keydown', '#NoticeText', function () {
//            CharCount();
//        });
//    });
</script>--%>
<% using (Html.BeginForm("", "", FormMethod.Post, new { id = "Form_NewNotice" }))
   { %>
<table width="100%" align="center" style="font-size: 12px">
    <%:Html.HiddenFor(x => x.CommunityID)%>
    <tr>
        <td valign="top" align="right" style="width: 20%">
            <b>
                <%:Html.LabelFor(x => x.NoticeText)%></b>
        </td>
        <td style="width: 80%">
            <%:Html.TextAreaFor(x => x.NoticeText, new { style = "width:300px;height: 150px;resize:none", maxlength="700"})%>
            <%:Html.ValidationMessageFor(x => x.NoticeText)%>
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
            <span id="charNum">
            </span>
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td align="left">
            <input type="submit" class="Button" style="height: 40px; width: 70px" value="Save" />
            <input type="button" class="Button" onclick="Clear(this.form)" value="Clear" />
        </td>
    </tr>
</table>
<%}%>
