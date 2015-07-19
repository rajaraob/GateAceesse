<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script type="text/javascript">

    $(document).on("click", "#securityPersonnelsRefresh", function () {
        SecurityPersonnelsRefresh();
    });

    function SecurityPersonnelsRefresh() {
        $("#Div_SecurityPersonnelsListTable").empty();
        $("#Div_SecurityPersonnelsListTable").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
        $.ajax({
            type: "GET",
            timeout: 5000,
            url: "/Administrator/SecurityPersonnelsListTable",
            success: function (data) {
                $("#Div_SecurityPersonnelsListTable").html(data);
            },
            error: function (errdata)
            { }
        });
    }

    /* SecurityPersonnel Details */

    var issecuritypersondivopen = false;
    var oldsecuritypersonid = null;

    $(document).on("click", ".securityPersonnelDetails", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        HandlePreviousSecurityPerson(this.name);
    });

    function HandlePreviousSecurityPerson(securitypersonnelid) {
        if (issecuritypersondivopen == true) {
            if (oldsecuritypersonid == securitypersonnelid) {
                ClearForSecurityPersonnels(oldsecuritypersonid);
                issecuritypersondivopen = false;
                oldsecuritypersonid = null;
            }
            else {
                ClearForSecurityPersonnels(oldsecuritypersonid);
                BeforeLoading(securitypersonnelid);
                SecurityPersonnelDetails(securitypersonnelid);
                oldsecuritypersonid = securitypersonnelid;
            }
        }
        else {
            BeforeLoading(securitypersonnelid);
            SecurityPersonnelDetails(securitypersonnelid);
            issecuritypersondivopen = true;
            oldsecuritypersonid = securitypersonnelid;
        }
    }

    function BeforeLoading(securitypersonnelid) {
        $("#Div_Operations").show();
        $("#Div_Operations").insertAfter("#securityPersonnel" + securitypersonnelid);
        $("#Div_Operations").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
    }

    function ClearForSecurityPersonnels(securitypersonnelid) {
        $("#securityPersonnel" + securitypersonnelid).css('background-color', '#FFFFFF');
        $("#Div_Operations").hide();
        $("#Div_Operations").html('');
    }

    function SecurityPersonnelDetails(securitypersonnelid) {
        $.ajax({
            type: "GET",
            url: "/Administrator/SecurityPersonnelDetails/?securitypersonnelid=" + securitypersonnelid,
            success: function (data) {
                $("#securityPersonnel" + securitypersonnelid).css('background-color', '#F3F3F3');
                $("#Div_Operations").html(data);
            },
            error: function (errdata)
            { }
        });
    }

    $(document).on("click", "#securityPersonnelDetailsClose", function () {
        ClearForSecurityPersonnels(this.name);
        issecuritypersondivopen = false;
        oldsecuritypersonid = null;
    });

    /* End of SecurityPersonnel Details  */

    /* Edit SecurityPersonnel */

    $(document).on("click", ".EditSecurityPersonnel", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();

        var $loading = $('<div align="center"><img src="../../Images/ajax-loader.gif" alt="loading" class="ui-loading-icon"></div>');
        var $url = "/Administrator/EditSecurityPersonnel/?securitypersonnelid=" + this.name;
        var $title = "Edit SecurityPersonnel";
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

    /* End of Edit SecurityPersonnel */


    /* New SecurityPersonnel */

    $(document).on("click", "#NewSecurityPerson", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var $loading = $('<div align="center"><img src="../../Images/ajax-loader.gif" alt="loading" class="ui-loading-icon"></div>');
        var $url = "/Administrator/RegistrationPartial/?roleid=4";
        var $title = "New SecurityPersonnel";
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

    /* End of New SecurityPersonnel */

    /* Multiple Delete */

    $("#CheckAll").live("click", function () {
        $("input[name='SecurityPersonnelsToDelete']").attr("checked", this.checked);
        deletebuttonenabledisable();
    });

    $("input[name='SecurityPersonnelsToDelete']").live("click", function () {
        if ($("input[name='SecurityPersonnelsToDelete']").length == $("input[name='SecurityPersonnelsToDelete']:checked").length) {
            $("#CheckAll").attr("checked", "checked");
        }
        else {
            $("#CheckAll").removeAttr("checked");
        }
        deletebuttonenabledisable();
    });

    function deletebuttonenabledisable() {
        if ($("input[name='SecurityPersonnelsToDelete']:checked").length > 0) {
            $("#Btn_DeleteSecurityPersonnels").removeAttr("disabled");
        }
        else {
            $("#Btn_DeleteSecurityPersonnels").attr("disabled", true);
        }
    }

    $(document).on("click", "#Btn_DeleteSecurityPersonnels", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var count = 0;
        count = $("input[name='SecurityPersonnelsToDelete']:checked").length;
        if (count > 0) {
            if (confirm("R U Sure?  " + count + " SecurityPersonnels are deleted")) {
                var selectedIDs = $("input[name='SecurityPersonnelsToDelete']:checked").map(function () {
                    return $(this).val();
                }).toArray();

                $.ajax({
                    type: "post",
                    url: "/supersecurityPersonnel/DeleteSecurityPersonnels/?securityPersonnelstodelete=" + selectedIDs,
                    success: function (result) {
                        if (result == "success") {
                            $("#Div_ActionInformation").fadeIn();
                            $("#Div_ActionInformation").html('SecurityPersonnels delted successfully..');
                            $("#Div_ActionInformation").fadeOut(5000);
                            SecurityPersonnelsRefresh();
                        }
                    }
                });
            }
        }
        else {
            alert("No SecurityPersonnel(s) are selected to delete");
        }
    });

    /* End of Multiple Delete */

</script>
<div id="Div_SecurityPersonnels">
    <% Html.RenderPartial("Partials/Users/SecurityPersonnels/SecurityPersonnelsList"); %>
</div>
