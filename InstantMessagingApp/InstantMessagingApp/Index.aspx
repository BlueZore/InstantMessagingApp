<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="InstantMessagingApp.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        * {
            padding: 0px;
            margin: 0px;
            font-family: 'Microsoft YaHei';
        }

        .main {
            width: 610px;
            height: 425px;
            background-image: url(/Image/bg.png);
            float: left;
        }

        .left {
            width: 223px;
            height: 100%;
            background-image: url(/Image/leftbg.png);
            float: left;
        }

        .self {
            width: 100%;
            height: 43px;
            margin-top: 12px;
        }

        .self_pic {
            width: 43px;
            height: 43px;
            float: left;
            margin-left: 12px;
        }

        .self_name {
            width: 100px;
            float: left;
            font-size: 14px;
            color: #c7c7c7;
            margin-top: 20px;
            margin-left: 10px;
            font-weight: bold;
        }

        .left_op {
            margin-top: 10px;
            width: 100%;
        }

        .left_op_menu {
            width: 39px;
            height: 343px;
            margin-top: 7px;
            background-image: url(/Image/leftmenubg.png);
            float: left;
            padding-top: 10px;
        }

            .left_op_menu li {
                list-style: none;
                float: left;
                width: 30px;
                height: 30px;
                margin-top: 10px;
                margin-left: 4px;
                padding-left: 5px;
                width: 25px;
                padding-top: 5px;
                height: 25px;
            }

        .left_op_menu_li_selected {
            background-image: url(/Image/leftbutton.png);
        }

        .left_user {
            width: 184px;
            float: left;
        }

        .searchadd {
            width: 100%;
            float: left;
        }

        .searchadd_search {
            width: 150px;
            height: 19px;
            float: left;
            margin-left: 8px;
            background-image: url(/Image/search.png);
        }

            .searchadd_search input {
                background-color: transparent;
                border-width: 0;
                color: #fff;
                display: block;
                font-size: 10px;
                height: 18px;
                padding-left: 10px;
                width: 115px;
                float: left;
            }

            .searchadd_search a {
                display: block;
                float: left;
                height: 18px;
                width: 18px;
            }

        .searchadd_add {
            width: 17px;
            height: 17px;
            margin-top: 1px;
            margin-left: 4px;
            float: left;
        }

        .team {
            width: 100%;
            height: 335px;
            overflow: auto;
            overflow-x: hidden;
            margin-top: 6px;
            float: left;
        }

        .team_item {
            width: 100%;
            float: left;
        }

        .team_item_info {
            border-bottom: 1px solid #808080;
            float: left;
            height: 30px;
            margin-left: 10px;
            width: 164px;
            cursor: pointer;
        }

            .team_item_info img {
                display: block;
                float: left;
                margin-top: 9px;
                margin-left: 15px;
            }

            .team_item_info span {
                font-size: 12px;
                color: #ffffff;
                display: block;
                float: left;
                margin-top: 5px;
                margin-left: 17px;
            }

        .team_user {
            width: 100%;
            float: left;
            display: none;
        }

            .team_user li {
                list-style: none;
                height: 25px;
                cursor: pointer;
            }

                .team_user li img {
                    display: block;
                    float: left;
                    margin-left: 34px;
                    margin-top: 4px;
                }

                .team_user li span {
                    font-size: 10px;
                    color: #ffffff;
                    display: block;
                    float: left;
                    margin-top: 5px;
                    margin-left: 7px;
                }

        #GroupListDIV {
            display: none;
        }

        #FoundListDIV {
            display: none;
        }

        .right {
            width: 367px;
            height: 425px;
            float: left;
        }

        #talk {
            width: 314px;
            height: 100%;
            background-image: url(/Image/talkbg.png);
            float: left;
            position: relative;
            display: none;
        }

        .talk {
            position: absolute;
        }

            .talk textarea {
                width: 100%;
                height: 100%;
                font-size: 12px;
                padding: 2px;
            }

        .talk_re_note {
            margin-top: 30px;
            margin-left: 5px;
            margin-right: 5px;
            width: 304px;
            height: 230px;
            background-color: #ffffff;
            float: left;
            overflow: auto;
            overflow-x: hidden;
            font-size: 12px;
        }

            .talk_re_note li {
                list-style: none;
                float: left;
                padding: 2px;
                width: 100%;
            }

        .otheruser_note p {
            color: #7bff3e;
            text-align: left;
            font-size: 12px;
        }

        .otheruser_note span {
            color: #424242;
            text-align: left;
            font-size: 11px;
        }


        .curruser_note p {
            color: #54A6D6;
            text-align: left;
            font-size: 12px;
        }

        .curruser_note span {
            color: #424242;
            text-align: left;
            font-size: 11px;
        }

        .talk_re_note a {
            margin-left: 10px;
            color: #54A6D6;
            text-decoration: underline;
        }

            .talk_re_note a:hover {
                color: #ff6a00;
                text-decoration: none;
            }

        .talk_op {
            margin-top: 5px;
            margin-left: 10px;
            margin-bottom: 5px;
            float: left;
            height: 20px;
        }

            .talk_op img {
                display: block;
                float: left;
            }

        .talk_note {
            background-color: #ffffff;
            float: left;
            margin-left: 5px;
            margin-right: 5px;
            width: 304px;
            height: 100px;
        }

        .talk_run {
            float: left;
            padding-right: 5px;
            width: 100%;
        }

            .talk_run button {
                float: right;
                margin-right: 5px;
                margin-top: 5px;
                font-size: 12px;
            }

        .talktab {
            float: left;
            width: 53px;
            height: 100px;
            padding-top: 50px;
        }

            .talktab li {
                background-image: url(/Image/tab2.png);
                background-repeat: no-repeat;
                padding-left: 6px;
                padding-top: 5px;
                height: 22px;
                width: 46px;
                float: left;
                margin-top: 10px;
                list-style: none;
                color: #ffffff;
                font-size: 12px;
                cursor: pointer;
            }

                .talktab li.talktab_li_selected {
                    background-image: url(/Image/tab1.png);
                    background-repeat: no-repeat;
                    color: #454444;
                }

        #ULLayer {
            float: right;
            height: 150px;
            width: 200px;
            margin-right: 1px;
            margin-top: -153px;
            position: relative;
            display: none;
        }

        .ULLayer {
            position: absolute;
            border: 1px solid #808080;
        }

        #ULLayer li {
            float: left;
            width: 100%;
            list-style: none;
        }

            #ULLayer li.header {
                background-color: #ebf2fa;
                color: #2689dc;
                height: 25px;
                line-height: 25px;
                font-size: 14px;
                border-bottom:1px solid #c9c9c9;
            }

                #ULLayer li.header b {
                    margin-left: 5px;
                    float: left;
                }

                #ULLayer li.header a {
                    margin-right: 5px;
                    margin-top: 3px;
                    float: right;
                    text-decoration: none;
                    color: #ff6a00;
                    cursor: pointer;
                }

                    #ULLayer li.header a:hover {
                        color: #54A6D6;
                        text-decoration: none;
                        color: #fff;
                    }

            #ULLayer li.footer {
                background-color: #ebf2fa;
                height: 25px;
                line-height: 25px;
                text-align: right;
                border-top:1px solid #c9c9c9;
            }

                #ULLayer li.footer a {
                    margin-right: 5px;
                    text-decoration: none;
                    font-size: 14px;
                    color: #2689dc;
                    cursor: pointer;
                }

                    #ULLayer li.footer a:hover {
                        color: #54A6D6;
                    }

            #ULLayer li.body {
                background-color: #ebf2fa;
                height: 100px;
                font-size: 12px;
                line-height: 25px;
                color: #424242;
                padding: 0px 3px;
                width: 194px;
            }

                #ULLayer li.body span {
                    margin: 3px;
                }

        .warning {
            color: #fa2020;
            font-size: 12px;
            margin-left: 100px;
            margin-top: 50px;
            float: left;
        }

        .fm_main_menu {
            height: 52px;
            width: 100px;
            border-top: #d2d2d2 1px solid;
            border-left: #d2d2d2 1px solid;
            border-right: #d2d2d2 1px solid;
            font-size: 12px;
            position: absolute;
            display: none;
            z-index: 99;
        }

            .fm_main_menu li {
                list-style: none;
                border-bottom: #d2d2d2 1px solid;
                background-color: #fff;
                height: 25px;
            }

                .fm_main_menu li a {
                    cursor: pointer;
                    text-decoration: none;
                    display: inline-block;
                    padding-left: 25px;
                    padding-top: 3px;
                    padding-bottom: 3px;
                    height: 18px;
                    width: 75px;
                }

                    .fm_main_menu li a:hover {
                        background-color: #e9e9e9;
                    }
    </style>
    <script src="JS/jquery-1.11.1.min.js"></script>
    <script src="JS/layer/layer.min.js" type="text/javascript"></script>
    <script src="JS/layer/extend/layer.ext.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            //添加
            $(".searchadd_add").bind("click", function () {
                layer.tab({
                    area: ['520px', '300px'],
                    data: [
                        { title: '添加好友', content: '<iframe src=\"Iframe/AddUser.aspx\" frameborder=\"no\" width=\"100%\" height=\"270px\" />' },
                        { title: '添加群', content: '<iframe src=\"Iframe/AddGroup.aspx\" frameborder=\"no\" width=\"100%\" height=\"270px\" />' },
                        { title: '新建组', content: '<iframe src=\"Iframe/NewTeam.aspx\" frameborder=\"no\" width=\"100%\" height=\"270px\" />' },
                        { title: '新建群', content: '<iframe src=\"Iframe/GroupView.aspx\" frameborder=\"no\" width=\"100%\" height=\"270px\" />' }
                    ]
                });
            });

            //用户组菜单
            $("#TeamListDIV .team_user:eq(0)").show();
            $("#TeamListDIV,#GroupListDIV").delegate(".team_item_info", "click", function () {
                $(".team .team_user").hide();
                $(".team .team_item_info img").attr("src", "/Image/sanjian.png");
                $(this).next().show();
                $(this).find("img").attr("src", "/Image/sanjian2.png");
                return false;
            });

            //显示聊天窗口
            $("#TeamListDIV,#FoundListDIV").delegate("li", "dblclick", function () {
                //窗口
                $("#talk>div").hide();//talkType='1'单聊
                var html = "<div class='talk' talkID='" + $(this).attr("uID") + "' talkType='1'><div class='talk_re_note'></div><div class='talk_op'></div><div class='talk_note'><textarea/></div><div class='talk_run'><button>关闭</button><button>发送</button></div></div>";
                $("#talk").html($("#talk").html() + html);
                $("#talk,.uploadify").show();

                //页签
                $(".talktab li").removeClass("talktab_li_selected");
                html = "<li class='talktab_li_selected' talkTabID='" + $(this).attr("uID") + "'>" + $(this).find("span").html() + "</li>";
                $(".talktab").html($(".talktab").html() + html);
            });

            //显示群聊窗口
            $("#GroupListDIV").delegate(".team_item_info", "dblclick", function () {
                //窗口
                $("#talk>div").hide();//talkType='2'群聊
                var html = "<div class='talk' talkID='" + $(this).attr("gID") + "' talkType='2'><div class='talk_re_note'></div><div class='talk_op'></div><div class='talk_note'><textarea/></div><div class='talk_run'><button>关闭</button><button>发送</button></div></div>";
                $("#talk").html($("#talk").html() + html);
                $("#talk,.uploadify").show();

                //页签
                $(".talktab li").removeClass("talktab_li_selected");
                html = "<li class='talktab_li_selected' talkTabID='" + $(this).attr("gID") + "'>" + $(this).find("span").html() + "</li>";
                $(".talktab").html($(".talktab").html() + html);
            });

            //页签切换控制显示聊天窗口
            $(".talktab").delegate("li", "click", function () {
                $(".talktab li").removeClass("talktab_li_selected");
                $(this).addClass("talktab_li_selected");
                $("#talk>div").hide();
                $("#talk").find("[talkID='" + $(this).attr("talkTabID") + "']").show();
            });

            //移除通话
            $("#talk").delegate("button", "click", function () {
                var $talk = $(this).parents(".talk");
                var talkID = $talk.attr("talkID");
                switch ($(this).html()) {
                    case "关闭":
                        $("[talkID='" + talkID + "']").remove();
                        $("[talkTabID='" + talkID + "']").remove();

                        if ($("#talk>div").size() > 0) {//第一页签显示
                            $("#talk>div:eq(0)").show();
                            $(".talktab>li:eq(0)").addClass("talktab_li_selected");
                        }
                        else {//隐藏整个聊天窗口
                            $("#talk,.uploadify").hide();

                        }
                        break;
                    case "发送"://支持单聊和群聊，通过talkType控制
                        var $textArea = $talk.find("textarea");
                        var note = $textArea.val();
                        var talkType = $talk.attr("talkType");
                        if ($.trim(note).length == 0) return false;//发空过滤
                        $.ajax({
                            type: "post",
                            contentType: "application/json",
                            url: "/Common/Ajax.asmx/sendUserTalk",
                            data: "{SendUserID:'" + $("#hidID").val() + "',ReceiveUserID:'" + talkID + "',Type:'" + talkType + "',Note:'" + note + "'}",
                            dataType: "json",
                            success: function (result) {
                                if (result.d != "") {
                                    var html = "<li class='curruser_note'><p>" + $("#divSelfName").html() + " " + result.d + "</p><span>" + note + "</span></li>";

                                    $talk.find(".talk_re_note").html($(".talk_re_note").html() + html);
                                    $talk.find(".talk_re_note").attr("scrollTop", "1000000");
                                    $textArea.val("");
                                }
                            }
                        });
                        break;
                }
                return false;
            });

            //##########################################提示
            //提示关闭
            $("#ULLayer").delegate(".header a", "click", function () {
                $(this).parents(".ULLayer").remove();
                if ($(".ULLayer").size() == 0) { $("#ULLayer").hide(); }//判断是否要隐藏#ULLayer层
                return false;
            });

            //提示查看
            $("#ULLayer").delegate(".footer a", "click", function () {
                var ID = $(this).parents(".ULLayer").attr("newID");
                if (ID != undefined) {//消息
                    var businessType = $(this).parents(".ULLayer").attr("BusinessType");
                    var tmpSrc = "";
                    switch (businessType) {//判断跳转页
                        case "1": tmpSrc = "ConfirmUser"; break;
                        case "2": tmpSrc = "ConfirmGroup"; break;
                    }
                    layer.tab({
                        area: ['340px', '270px'],
                        data: [
                            { title: '申请', content: '<iframe src=\"Iframe/' + tmpSrc + '.aspx?ID=' + ID + '\" frameborder=\"no\" width=\"100%\" height=\"270px\" />' }
                        ]
                    });
                }
                else {//聊天
                    ID = $(this).parents(".ULLayer").attr("UL_talkID");
                    if (ID != undefined) {
                        var talkType = $(this).parents(".ULLayer").attr("UL_talkType");//区分群聊

                        //窗口
                        $("#talk>div").hide();
                        var html = "<div class='talk' talkID='" + ID + "' talkType='" + talkType + "'><div class='talk_re_note'>加载中...</div><div class='talk_op'></div><div class='talk_note'><textarea/></div><div class='talk_run'><button>关闭</button><button>发送</button></div></div>";
                        $("#talk").html($("#talk").html() + html);
                        $("#talk,.uploadify").show();

                        //页签
                        $(".talktab li").removeClass("talktab_li_selected");
                        html = "<li class='talktab_li_selected' talkTabID='" + ID + "'>" + $(this).parents(".ULLayer").attr("UL_talkName") + "</li>";
                        $(".talktab").html($(".talktab").html() + html);


                        $.ajax({
                            type: "post",
                            contentType: "application/json",
                            url: "/Common/Ajax.asmx/sendUserTalkRec",
                            data: "{SendUserID:'" + ID + "',ReceiveUserID:'" + $("#hidID").val() + "',TalkType:'" + talkType + "'}",
                            dataType: "json",
                            success: function (result) {
                                if (result.d != "") {

                                    //加载聊天
                                    var talkList = eval(result.d)[0].TalkList;
                                    var html = "";
                                    for (var i = 0; i < talkList.length; i++) {
                                        var $talk = $("#talk").find("[talkID='" + ID + "']");
                                        if ($talk.size() > 0) {//写入聊天窗口
                                            html += "<li class='otheruser_note'><p>" + talkList[i].SendUserName + " " + talkList[i].CreateDate + "</p> <span>" + talkList[i].Note + "</span></li>";

                                        }
                                    }
                                    $talk.find(".talk_re_note").html(html);
                                    $talk.find(".talk_re_note").attr("scrollTop", $talk.find(".talk_re_note").height());//控制显示内容距底
                                }
                            }
                        });
                    }
                }
                $(this).parents(".ULLayer").remove();
                if ($(".ULLayer").size() == 0) { $("#ULLayer").hide(); }//判断是否要隐藏#ULLayer层
                return false;
            });

            //切换左侧页签
            $(".left_op_menu").delegate("li", "click", function () {//切换左侧页签
                var $index = $(".left_op_menu li").index($(this));
                switch ($index) {
                    case 0:
                    case 1:
                        $(".left_op_menu li").removeClass("left_op_menu_li_selected");
                        $(".left_user .team").hide();
                        $(".left_op_menu li:eq(" + $index + ")").addClass("left_op_menu_li_selected");
                        $(".left_user .team:eq(" + $index + ")").show();
                        break;
                    case 2:
                        layer.tab({
                            area: ['500px', '340px'],
                            data: [
                                { title: '聊天记录', content: '<iframe src=\"Iframe/TalkRecView.aspx\" frameborder=\"no\" width=\"100%\" height=\"330px\" />' }
                            ]
                        });
                    case 3:
                        layer.tab({
                            area: ['500px', '340px'],
                            data: [
                                { title: '新闻', content: '<iframe src=\"Iframe/AboutUsView.aspx\" frameborder=\"no\" width=\"100%\" height=\"330px\" />' }
                            ]
                        });
                        break;
                }
            });

            //用户搜索
            $(".searchadd_search").delegate("a", "click", function () {
                var $userList = $("#TeamListDIV li");//好友集合
                var html = "";
                $("#FoundListDIV ul").html("");//清空结果
                var search = $.trim($(".searchadd_search input").val());
                if (search.length == 0) return false;//空不搜索
                $userList.each(function () {
                    //alert($(this).find("span").html().indexOf(search));
                    if ($(this).find("span").html().indexOf(search) > -1) {//好友核对
                        html += "<li uid=\"" + $(this).attr("uid") + "\"><img width=\"17px\" height=\"17\" src=\"" + $(this).find("img").attr("src") + "\"><span>" + $(this).find("span").html() + "</span></li>";
                    }
                });
                $("#FoundListDIV ul").html(html);
                $(".left_op_menu li").removeClass("left_op_menu_li_selected");
                $(".left_user .team").hide();
                $("#FoundListDIV,#FoundListDIV .team_user").show();
                return false;
            });


            var userIDSelected = "";
            var teamIDSelected = "";
            //组成员鼠标右键层
            $("#TeamListDIV").delegate("li", "contextmenu", function (e) {
                if (e.which == 3) {
                    //获取序号
                    userIDSelected = $(this).attr("uid");
                    teamIDSelected = $(this).parents().prev().attr("tid");
                    $(".fm_main_menu").css({ "margin-top": e.clientY - 5, "margin-left": e.clientX - 5, "height": 52 }).show();
                    $(".fm_main_menu").html("<li><a>移动</a></li><li><a>删除</a></li>");
                }
                return false;
            });

            //移动用户
            $(".fm_main_menu").delegate("li:eq(0)", "click", function (e) {
                switch ($(this).find("a").html()) {
                    case "移动":
                        layer.tab({
                            area: ['340px', '270px'],
                            data: [
                                { title: '移动用户', content: '<iframe src=\"Iframe/MoveUser.aspx?UserID=' + userIDSelected + '\" frameborder=\"no\" width=\"100%\" height=\"270px\" />' }
                            ]
                        });
                        break;
                    case "查看成员":
                        layer.tab({
                            area: ['340px', '270px'],
                            data: [
                                { title: '查看成员', content: '<iframe src=\"Iframe/GroupMemberView.aspx?GroupID=' + groupIDSelected + '\" frameborder=\"no\" width=\"100%\" height=\"270px\" />' }
                            ]
                        });
                        break;
                }

            });

            //删除好友
            $(".fm_main_menu").delegate("li:eq(1)", "click", function (e) {
                if (confirm("确定删除？")) {
                    $.ajax({
                        type: "post",
                        contentType: "application/json",
                        url: "/Common/Ajax.asmx/DeleteUser",
                        data: "{userID:'" + userIDSelected + "',teamID:'" + teamIDSelected + "'}",
                        dataType: "json",
                        success: function (result) {
                            if (result.d == "1") {
                                $("[uid='" + userIDSelected + "']").remove();
                                $(".fm_main_menu").hide();
                            }
                        }
                    });
                }
            });

            var groupIDSelected = "";
            //组成员鼠标右键层
            $("#GroupListDIV").delegate(".team_item_info", "contextmenu", function (e) {
                if (e.which == 3) {
                    //获取序号
                    groupIDSelected = $(this).attr("gid");
                    $(".fm_main_menu").css({ "margin-top": e.clientY - 5, "margin-left": e.clientX - 5, "height": 26 }).show();
                    $(".fm_main_menu").html("<li><a>查看成员</a></li>");
                }
                return false;
            });

            //鼠标移出菜单层，隐藏
            $("body").delegate(".fm_main_menu", "mouseleave", function () {
                $(".fm_main_menu").hide();
            });

            setInterval("getUserAboutNews()", 6000);

        });

        function getUserAboutNews() {
            $.ajax({
                type: "post",
                contentType: "application/json",
                url: "/Common/Ajax.asmx/getUserAboutNews",
                data: "{UserID:'" + $("#hidID").val() + "'}",
                dataType: "json",
                success: function (result) {
                    if (result.d != "") {
                        //加载消息
                        var newsList = eval(result.d)[0].NewsList;
                        var html = "";
                        for (var i = 0; i < newsList.length; i++) {
                            html += "<ul class='ULLayer' newID='" + newsList[i].ID + "' sendID='" + newsList[i].SendUserID + "' BusinessType='" + newsList[i].BusinessType + "'><li class='header'><b>系统提醒</b><a><img src='/Image/close.png'/></a></li><li class='body'>" + newsList[i].Note + "，需要您的处理！</li><li class='footer'><a>查看</a></li></ul>";
                        }
                        if (html.length > 0) {
                            $("#ULLayer").html($("#ULLayer").html() + html);
                            $("#ULLayer").show();
                        }

                        //加载聊天
                        var talkList = eval(result.d)[0].TalkList;
                        html = "";
                        for (var i = 0; i < talkList.length; i++) {
                            var $talk = $("#talk").find("[talkID='" + talkList[i].SendUserID + "']");
                            if ($talk.size() > 0) {//写入聊天窗口
                                html = "<li class='otheruser_note'><p>" + talkList[i].SendUserName + " " + talkList[i].CreateDate + "</p> <span>" + talkList[i].Note + "</span></li>";
                                $talk.find(".talk_re_note").html($talk.find(".talk_re_note").html() + html);
                            }
                            else {
                                if ($("[UL_talkID='" + talkList[i].SendUserID + "']").size() == 0) {//在ULLayer没有发送用户的提示，显示提示框
                                    html += "<ul class='ULLayer' UL_talkID='" + talkList[i].SendUserID + "' UL_talkName='" + talkList[i].SendUserName + "' UL_talkType='1'><li class='header'><b>系统提醒</b><a><img src='/Image/close.png'/></a></li><li class='body'>“" + talkList[i].SendUserName + "”向你发出聊天申请！</li><li class='footer'><a>查看</a></li></ul>";
                                    $("#ULLayer").html($("#ULLayer").html() + html);
                                    $("#ULLayer").show();
                                }
                            }
                        }

                        //加载群聊
                        var talkGroupList = eval(result.d)[0].TalkGroupList;
                        html = "";
                        for (var i = 0; i < talkGroupList.length; i++) {
                            var $talk = $("#talk").find("[talkID='" + talkGroupList[i].GroupID + "']");
                            if ($talk.size() > 0) {//写入聊天窗口
                                html = "<li class='otheruser_note'><p>" + talkGroupList[i].UserName + " " + talkGroupList[i].CreateDate + "</p> <span>" + talkGroupList[i].Note + "</span></li>";
                                $talk.find(".talk_re_note").html($talk.find(".talk_re_note").html() + html);
                            }
                            else {
                                if ($("[UL_talkID='" + talkGroupList[i].GroupID + "']").size() == 0) {//在ULLayer没有发送用户的提示，显示提示框
                                    html += "<ul class='ULLayer' UL_talkID='" + talkGroupList[i].GroupID + "' UL_talkName='" + talkGroupList[i].GroupName + "' UL_talkType='2'><li class='header'><b>系统提醒</b><a><img src='/Image/close.png'/></a></li><li class='body'>“" + talkGroupList[i].GroupName + "”群有人聊天！</li><li class='footer'><a>查看</a></li></ul>";
                                    $("#ULLayer").html($("#ULLayer").html() + html);
                                    $("#ULLayer").show();
                                }
                            }
                        }
                    }
                }
            });
        }

        function addUserForTeam(userID, teamID, userName, pic) {
            var html = "<li uid='" + userID + "'><img width='17px' height='17' src='/UpLoadFiles" + pic + "'><span>" + userName + "</span></li>";
            $("[tid='" + teamID + "']").next().append(html);
        }

        function addGroup(groupID, groupName) {
            var html = "<div class='team_item'><div gid='" + groupID + "' class='team_item_info'><span>" + groupName + "</span></div></div>";
            $("#GroupListDIV").append(html);
        }

        function addTeam(teamID, teamName) {
            var html = "<div class='team_item'><div tid='" + teamID + "' class='team_item_info'><img src='/Image/sanjian.png'><span>" + teamName + "</span></div><ul class='team_user'></ul></div>";
            $("#TeamListDIV").append(html);
        }

        function moveUser(teamID, userID) {
            var $uid = $("[uid='" + userID + "']");
            $("[uid='" + userID + "']").remove();
            $("[tid='" + teamID + "']").next().append($uid);
        }
    </script>
    <link href="/JS/uploadify/uploadify.css" rel="stylesheet" />
    <script src="/JS/uploadify/swfobject.js"></script>
    <script src="/JS/uploadify/jquery.uploadify.min.js"></script>
    <script src="/JS/uploadify/uploadify.js"></script>
</head>
<body>
    <form id="form1" runat="server">

        <ul class="fm_main_menu">
            <li><a>移动</a></li>
            <li><a>删除</a></li>
        </ul>

        <div class="main">
            <div class="left">
                <div class="self">
                    <div class="self_pic">
                        <asp:Image ID="imgSelfUserPic" runat="server" ImageUrl="~/Image/userpic.png" Width="43px" Height="43px" />
                    </div>
                    <div class="self_name" runat="server" id="divSelfName">赵本山</div>
                </div>
                <div class="left_op">
                    <ul class="left_op_menu">
                        <li class="left_op_menu_li_selected" title="好友">
                            <img src="Image/leftmenu1.png" />
                        </li>
                        <li title="群">
                            <img src="Image/leftmenu2.png" />
                        </li>
                        <li title="聊天记录">
                            <img src="Image/leftmenu3.png" />
                        </li>
                        <li title="新闻">
                            <img src="Image/leftmenu4.png" />
                        </li>
                    </ul>
                    <div class="left_user">
                        <div class="searchadd">
                            <div class="searchadd_search">
                                <input style="background-color: transparent" />
                                <a>&nbsp;</a>
                            </div>
                            <div class="searchadd_add">
                                <img src="/Image/adduser.png" />
                            </div>
                        </div>
                        <div class="team" id="TeamListDIV" runat="server">
                            <%--<div class="team_item">
                                <div class="team_item_info">
                                    <img src="/Image/sanjian.png" />
                                    <span>好友</span>
                                </div>
                                <ul class="team_user">
                                    <li>
                                        <img src="/Image/userpic2.png" />
                                        <span>用户A</span>
                                    </li>
                                </ul>
                            </div>--%>
                        </div>
                        <div class="team" id="GroupListDIV" runat="server">
                            <%--<div class="team_item">
                                <div class="team_item_info">
                                    <img src="/Image/sanjian.png" />
                                    <span>好友</span>
                                </div>
                                <ul class="team_user">
                                    <li>
                                        <img src="/Image/userpic2.png" />
                                        <span>用户A</span>
                                    </li>
                                </ul>
                            </div>--%>
                        </div>
                        <div class="team" id="FoundListDIV" runat="server">
                            <div class="team_item">
                                <div class="team_item_info">
                                    <span>搜索结果</span>
                                </div>
                                <ul class="team_user">
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="right">
                <div id="file_upload">
                </div>
                <div id="talk">
                    <%--<div class="talk">
                        <ul class="talk_re_note">
                            <li class="otheruser_note">
                                <p>XXXX 2014-11-23 13:00</p>
                                <span>note</span>
                            </li>
                            <li class="curruser_note">
                                <p>XXXX 2014-11-23 13:00</p>
                                <span>note</span>
                            </li>
                        </ul>
                        <div class="talk_op">
                        </div>
                        <div class="talk_note"></div>
                        <div class="talk_run">
                            <button>关闭</button>
                            <button>发送</button>
                        </div>
                    </div>--%>
                </div>
                <ul class="talktab">
                    <%--<li>用户A</li>
                    <li class="talktab_li_selected">用户B</li>
                    <li>用户C</li>--%>
                </ul>
            </div>

            <div id="ULLayer">
            </div>
        </div>
        <div class="fm_main_queue">
            <div class="fm_main_queue_head">
                <span>上传完成</span>

                <a class="fm_main_queue_head_close"></a>
                <a class="fm_main_queue_head_max"></a>
                <a class="fm_main_queue_head_min"></a>
            </div>
            <div id="uploadfileQueue">
            </div>
        </div>

        <asp:HiddenField ID="hidID" runat="server" />
        <asp:HiddenField ID="hidReceiveID" runat="server" Value="6AC2AEED-DB26-4AD5-BEE8-292CEFEA9356" />

        <ul class="warning">
            <%--<li style="text-decoration: line-through;">加入群</li>--%>
            <li style="text-decoration: line-through;">1.删除好友价格提示。</li>
            <li style="text-decoration: line-through;">2.左侧图标加tooltip。</li>
            <li style="text-decoration: line-through;">3.左侧加一个新闻的图标。</li>
            <li>5.单开切换用户，接受消息时的cookie处理。</li>
            <li style="text-decoration: line-through;">6.创建新组后，移动好友。</li>
            <li>7.点击群名称，下面显示成员名单，右键可以删除成员。</li>
            <li>9.在人员和群上点右键的菜单项上，加一项详细资料，点击后出现div，里面显示基本信息</li>
            <li style="text-decoration: line-through;">10.提示框颜色，提示关闭按钮样式</li>
            <li style="text-decoration: line-through;">11.把好友移动到另一个组，然后，使用该账户再次登陆，发现有重复姓名的。</li>
        </ul>
    </form>
</body>
</html>
