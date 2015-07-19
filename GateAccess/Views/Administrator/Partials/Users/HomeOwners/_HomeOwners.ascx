<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script type="text/javascript">

    $(document).on("click", "#homeOwnersRefresh", function () {
        HomeOwnersRefresh();
    });

    function HomeOwnersRefresh() {
        $("#Div_HomeOwnersListTable").empty();
        $("#Div_HomeOwnersListTable").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
        $.ajax({
            type: "GET",
            timeout: 5000,
            url: "/Administrator/HomeOwnersListTable",
            success: function (data) {
                $("#Div_HomeOwnersListTable").html(data);
            },
            error: function (errdata)
            { }
        });
    }

    /* HomeOwner Details */

    var ishomeownerdivopen = false;
    var oldhomeownerid = null;

    $(document).on("click", ".homeOwnerDetails", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        HandlePreviousHomeOwner(this.name);
    });

    function HandlePreviousHomeOwner(homeownerid) {
        if (ishomeownerdivopen == true) {
            if (oldhomeownerid == homeownerid) {
                ClearForHomeOwners(oldhomeownerid);
                ishomeownerdivopen = false;
                oldhomeownerid = null;
            }
            else {
                ClearForHomeOwners(oldhomeownerid);
                BeforeLoading(homeownerid);
                HomeOwnerDetails(homeownerid);
                oldhomeownerid = homeownerid;
            }
        }
        else {
            BeforeLoading(homeownerid);
            HomeOwnerDetails(homeownerid);
            ishomeownerdivopen = true;
            oldhomeownerid = homeownerid;
        }
    }

    function BeforeLoading(homeownerid) {
        $("#Div_Operations").show("slow");
        $("#Div_Operations").insertAfter("#homeOwner" + homeownerid);
        $("#Div_Operations").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
    }

    function ClearForHomeOwners(homeownerid) {
        $("#homeOwner" + homeownerid).css('background-color', '#FFFFFF');
        $("#Div_Operations").hide();
        $("#Div_Operations").html('');
    }

    function HomeOwnerDetails(homeownerid) {
        $.ajax({
            type: "GET",
            url: "/Administrator/HomeOwnerDetails/?homeownerid=" + homeownerid,
            success: function (data) {
                $("#homeOwner" + homeownerid).css('background-color', '#F3F3F3');
                $("#Div_Operations").html(data);

            },
            error: function (errdata)
            { }
        });
    }

    $(document).on("click", "#homeOwnerDetailsClose", function () {
        ClearForHomeOwners(this.name);
        ishomeownerdivopen = false;
        oldhomeownerid = null;
    });

    /* End of HomeOwner Details  */

    /* Edit HomeOwner */

    $(document).on("click", ".editHomeOwner", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var $loading = $('<div align="center"><img src="../../Images/ajax-loader.gif" alt="loading" class="ui-loading-icon"></div>');
        var $url = "/Administrator/EditHomeOwner/?homeownerid=" + this.name;
        var $title = "Edit HomeOwner";
        var $dialog = $('<div></div>');
        $dialog.empty();
        $dialog
            .append($loading)
            .load($url)
            .dialog({
                autoOpen: false
                , title: $title
                , width: 650
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

    /* End of Edit HomeOwner */


    /* New HomeOwner */

    $(document).on("click", "#NewHomeOwner", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var $loading = $('<div align="center"><img src="../../Images/ajax-loader.gif" alt="loading" class="ui-loading-icon"></div>');
        var $url = "/Administrator/RegistrationPartial/?roleid=5";
        var $title = "New HomeOwner";
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

    /* End of New HomeOwner */

    /* Multiple Delete */

    $("#CheckAll").live("click", function () {
        $("input[name='HomeOwnersToDelete']").attr("checked", this.checked);
        deletebuttonenabledisable();
    });

    $("input[name='HomeOwnersToDelete']").live("click", function () {
        if ($("input[name='HomeOwnersToDelete']").length == $("input[name='HomeOwnersToDelete']:checked").length) {
            $("#CheckAll").attr("checked", "checked");
        }
        else {
            $("#CheckAll").removeAttr("checked");
        }
        deletebuttonenabledisable();
    });

    function deletebuttonenabledisable() {
        if ($("input[name='HomeOwnersToDelete']:checked").length > 0) {
            $("#Btn_DeleteHomeOwners").removeAttr("disabled");
        }
        else {
            $("#Btn_DeleteHomeOwners").attr("disabled", true);
        }
    }

    $(document).on("click", "#Btn_DeleteHomeOwners", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var count = 0;
        count = $("input[name='HomeOwnersToDelete']:checked").length;
        if (count > 0) {
            if (confirm("R U Sure?  " + count + " HomeOwners are deleted")) {
                var selectedIDs = $("input[name='HomeOwnersToDelete']:checked").map(function () {
                    return $(this).val();
                }).toArray();

                $.ajax({
                    type: "post",
                    url: "/superhomeOwner/DeleteHomeOwners/?homeOwnerstodelete=" + selectedIDs,
                    success: function (result) {
                        if (result == "success") {
                            $("#Div_ActionInformation").fadeIn();
                            $("#Div_ActionInformation").html('HomeOwners delted successfully..');
                            $("#Div_ActionInformation").fadeOut(5000);
                            HomeOwnersRefresh();
                        }
                    }
                });
            }
        }
        else {
            alert("No HomeOwner(s) are selected to delete");
        }
    });

    /* End of Multiple Delete */

</script>
<div id="Div_HomeOwners">
    <% Html.RenderPartial("Partials/Users/HomeOwners/HomeOwnersList"); %>
</div>
