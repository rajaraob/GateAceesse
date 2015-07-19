<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<GateAccess.Models.CommunitiesModel>>" %>
<script type="text/javascript">

    /*Multiple Selection for delete*/

    $(document).on("click", "#CheckAll", function () {
        $("input[name='CommunitiesToDelete']").attr("checked", this.checked);
        deletebuttonenabledisable();
    });

    $(document).on("click", "input[name='CommunitiesToDelete']", function () {
        deletebuttonenabledisable();
        if ($("input[name='CommunitiesToDelete']").length == $("input[name='CommunitiesToDelete']:checked").length) {
            $("#CheckAll").attr("checked", "checked");
        }
        else {
            $("#CheckAll").removeAttr("checked");
        }
    });

    function deletebuttonenabledisable() {
        if ($("input[name='CommunitiesToDelete']:checked").length <= 0) {
            $("#Btn_DeleteCommunities").attr("disabled", true);
        }
        else {
            ClearForCommunities();
            $("#Btn_DeleteCommunities").removeAttr("disabled");
        }
    }

    $(document).on("click", "#Btn_DeleteCommunities", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var count = 0;
        count = $("input[name='CommunitiesToDelete']:checked").length;
        if (count > 0) {
            if (confirm("R U Sure?  " + count + " Communities are deleted")) {
                var selctedCommunities = ($("input[name='CommunitiesToDelete']:checked").map(function () {
                    return this.value;
                }).get().join(","));

                $.ajax({
                    type: "post",
                    url: "/superadministrator/Deletecommunities/?selctedcommunities=" + selctedCommunities,
                    success: function (data) {
                        if (data) {
                            $("#Div_ActionInformation").fadeIn();
                            $("#Div_ActionInformation").html('Communities deleted successfully..');
                            $("#Div_ActionInformation").fadeOut(5000);
                            CommunitiesRefresh();
                        }
                        else {

                        }
                    }
                });
            }
        }
        else {
            alert("No Communities are selected to delete");
        }
    });

    /* End of Multiple Delete */

    /* Refresh Communites*/

    $(document).on('click', "#communitiesRefresh", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        CommunitiesRefresh();
    });

    function CommunitiesRefresh() {
        $("#Div_CommunitiesListTable").empty();
        $("#Div_CommunitiesListTable").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
        $.ajax({
            type: "GET",
            timeout: 5000,
            url: "/SuperAdministrator/CommunitiesListTable",
            success: function (data) {
                $("#Div_CommunitiesListTable").empty();
                $("#Div_CommunitiesListTable").html(data);
            },
            error: function (errdata)
            { }
        });
    }

    /* End Refresh */

    /* Edit Community */

    var oldcommunityid = null;
    var iscommunitydivopen = false;

    $(document).on('click', ".editCommunity", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        HandlePreviousCommunity(this.name);
    });

    function HandlePreviousCommunity(communityid) {
        if (iscommunitydivopen == true) {
            if (communityid == oldcommunityid) {
                ClearForCommunities(communityid);
                iscommunitydivopen = false;
                oldcommunityid = null;
            }
            else {
                ClearForCommunities(oldcommunityid);
                BeforeLoading(communityid);
                EditCommunity(communityid);
                oldcommunityid = communityid;
            }
        }
        else {
            BeforeLoading(communityid);
            EditCommunity(communityid);
            oldcommunityid = communityid;
            iscommunitydivopen = true;
        }
    }

    function BeforeLoading(communityid) {
        $("#Div_EditCommunity").insertAfter("#community" + communityid);
        $("#Div_EditCommunity").show();
        $("#Div_EditCommunity").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..."/></div>');
    }

    function ClearForCommunities(communityid) {
        $("#community" + communityid).css('background-color', '#FFFFFF');
        $("#Div_EditCommunity").hide(500);
        $("#Div_EditCommunity").html('');
    }

    function EditCommunity(communityid) {
        $.ajax({
            type: "GET",
            url: "/SuperAdministrator/EditCommunity/?communityid=" + communityid,
            success: function (data) {
                $("#community" + communityid).css('background-color', '#F3F3F3');
                $("#Div_EditCommunity").html(data);
            },
            error: function (errdata)
            { }
        });
    }

    $(document).on("click", "#editCommunityClose", function () {
        EditCommunityClose(this.name);
    });

    function EditCommunityClose(communityid) {
        ClearForCommunities(communityid);
        iscommunitydivopen = false;
        oldcommunityid = null;
    }

    var communityUpdated = false;
    
    function editCommunityBegin() {
        $("#editCommunityForm").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-updating.gif")%>" alt="Processing..." /></div>');
    }
    
    function editCommunitySuccess() {
        if ($("#editCommunityMessage").html() == "True") {
            communityUpdated = true;
            setTimeout(function () { EditCommunityClose(oldcommunityid); }, 3000);
        }
        else {
            $("#Div_EditCommunity").html($("#editCommunityMessage").html());
            $("#editCommunityMessage").html('');
        }
    }

    function editCommunityComplete() {
        if (communityUpdated) {
            CommunitiesRefresh();
            UpdateCommunityActionInfo();
            communityUpdated = false;
        }
    }

    function UpdateCommunityActionInfo() {
        $('#Div_ActionInformation').fadeIn();
        $('#Div_ActionInformation').html("Community Updated Successfully.");
        $('#Div_ActionInformation').fadeOut(5000);
    }
     
    /* End of Edit Community */

    /* New Community */

    var communityCreated = false;

    $('#Div_NewCommunity').dialog({
        autoOpen: false,
        width: 650,
        resizable: false,
        minHeight: 200,
        position: [null, 75],
        modal: true,
        title: "New Community",
        show: {
            effect: "blind",
            duration: 500
        },
        hide: {
            effect: "clip",
            duration: 750
        },
        close: function () {
            if (communityCreated) {
                CommunitiesRefresh();
                CreateCommunityActionInfo();
                communityCreated = false;
            }
        },
        buttons: {
            "Create": function () {
                $("#createMessage").html(''); //make sure there is nothing on the message before we continue                         
                $("#Form_NewCommunity").submit();
            },
            "Clear": function () {
                Clear(this);
            }
        }
    });

    $(document).on("click", "#NewCommunity", function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var $dialog = $("#Div_NewCommunity");
        $dialog.dialog('open');
        $dialog.html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" alt="Loading..." /></div>');
        var $url = "/SuperAdministrator/NewCommunity";
        $.get($url, function (data) {
            $dialog.html(data);
        });
    });

    function createCommunitySuccess() {
        if ($("#createCommunityMessage").html() == "True") {
            communityCreated = true;
            setTimeout(function () { $("#Div_NewCommunity").dialog("close") }, 3000);
        }
        else {
            $("#Div_NewCommunity").html($("#createCommunityMessage").html());
            $("#createCommunityMessage").html('');
        }
    }

    function createCommunityBegin() {
        $("#newCommunityForm").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-processing.gif")%>" alt="Processing..." /></div>');
    }

    function CreateCommunityActionInfo() {
        $('#Div_ActionInformation').fadeIn();
        $('#Div_ActionInformation').html("Community Created Successfully.");
        $('#Div_ActionInformation').fadeOut(5000);
    }

    /* End of New Community */

    function Clear(ele) {
        $(ele).find(':input').each(function () {
            switch (this.type) {
                case 'password':
                case 'select-multiple':
                case 'select-one':
                case 'text':
                case 'textarea':
                    $(this).val('');
                    break;
                case 'checkbox':
                case 'radio':
                    if (this.name != "RoleID")
                        this.checked = false;
            }
        });
        OnLoad();
    }

    $(document).on("keyup", "#TotalUnits", function () {
        if ($(this).val() != '0')
            return true;
        else
            return false;
    });
</script>
<div id="Div_NewCommunity">
</div>
<div id="Div_CommunitiesList">
    <% Html.RenderPartial("Partials/Communities/CommunitiesList"); %>
</div>
