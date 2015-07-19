<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.NoticesModel>" %>
<%@ Import Namespace="System.Collections.Generic" %>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
    type="text/javascript"></script>
<script type="text/javascript">

//    function loadComplete() {
//        var textlength = $('#NoticeText').val().length;
//        var maxlength = 700;
//        if (textlength >= maxlength) {
//            $('#charNum').text(textlength + 'characters. reached the limit');
//        }
//        else {
//            var remainch = maxlength - textlength;
//            $('#charNum').text(remainch + ' characters left');
//        }
//    }

//    $(document).on("keydown", '#NoticeText', function () {
//        var max = 700;
//        var len = $(this).val().length;
//        if (len >= max) {
//            $('#charNum').text(len + 'characters. reached the limit');
//            return false;
//        } else {
//            var ch = max - len;
//            $('#charNum').text(ch + ' characters left');
//            return true;
//        }
//    });
//    
</script>
<% using (Html.BeginForm("", "", FormMethod.Post, new { id = "Form_EditNotice" }))
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
            <div id="charNum">
            </div>
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td align="left">
            <input type="submit" class="Button" value="Update" />            
        </td>
    </tr>
</table>
<%}%>
