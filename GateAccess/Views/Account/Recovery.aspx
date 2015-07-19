<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<GateAccess.Models.ForgotPasswordModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    GA :: Recovery
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#UserName").focus();
        });

        $(document).on('change', "#UserName", function () {
            handleTextBox();
        });

        $(document).on('keyup', "#UserName", function () {
            handleTextBox();
        });

        function handleTextBox() {
            var uname = $("#UserName").val();
            var unamelength = $("#UserName").val().length;
            if (unamelength > 0) {
                if (isValidEmailAddress(uname) == true) {
                    $("#Btn_UserNameVerify").removeAttr('disabled');
                }
                else {
                    $("#Btn_UserNameVerify").prop('disabled', true);
                }
            }
            else {
                $("#Btn_UserNameVerify").prop('disabled', true);
            }

        }

        function isValidEmailAddress(emailAddress) {
            var emailRegex = new RegExp(/^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$/i);
            var valid = emailRegex.test(emailAddress);
            if (!valid) {
                return false;
            } else
                return true;
        }

        function UsernameCheck() {
            $("#Status").html('<img src="<%: Url.Content("~/Images/ajax-loader-small.gif")%>" alt="Loading..."/>');
        }
    </script>
    <% Html.RenderPartial("_Recovery"); %>
</asp:Content>
