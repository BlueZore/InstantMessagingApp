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

        .talk_op {
            margin-top: 5px;
            margin-left: 10px;
            margin-bottom: 5px;
            float: left;
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
                background-color: #54A6D6;
                color: #fff;
                height: 25px;
                line-height: 25px;
                font-size: 14px;
            }

                #ULLayer li.header b {
                    margin-left: 5px;
                    float: left;
                }

                #ULLayer li.header a {
                    margin-right: 5px;
                    float: right;
                    text-decoration: none;
                    color: #ff6a00;
                    cursor: pointer;
                }

                    #ULLayer li.header a:hover {
                        background-color: #54A6D6;
                        text-decoration: none;
                        color: #fff;
                    }

            #ULLayer li.footer {
                background-color: #54A6D6;
                height: 25px;
                line-height: 25px;
                text-align: right;
            }

                #ULLayer li.footer a {
                    margin-right: 5px;
                    text-decoration: none;
                    font-size: 14px;
                    color: #fff;
                    cursor: pointer;
                }

                    #ULLayer li.footer a:hover {
                        background-color: #54A6D6;
                    }

            #ULLayer li.body {
                background-color: #fff;
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
                        { title: '添加群', content: '' },
                        { title: '新建组', content: '<iframe src=\"Iframe/NewTeam.aspx\" frameborder=\"no\" width=\"100%\" height=\"270px\" />' },
                        { title: '新建群', content: '<iframe src=\"Iframe/GroupView.aspx\" frameborder=\"no\" width=\"100%\" height=\"270px\" />' }
                    ]
                });
            });

            //用户组菜单
            $("#TeamListDIV .team_user:eq(0)").show();
            $("#TeamListDIV").delegate(".team_item_info", "click", function () {
                $("#TeamListDIV .team_user").hide();
                $("#TeamListDIV .team_item_info img").attr("src", "/Image/sanjian.png");
                $(this).next().show();
                $(this).find("img").attr("src", "/Image/sanjian2.png");
                return false;
            });

            //显示聊天窗口
            $("#TeamListDIV").delegate("li", "dblclick", function () {
                //窗口
                $("#talk>div").hide();
                var html = "<div class='talk' talkID='" + $(this).attr("uID") + "'><div class='talk_re_note'></div><div class='talk_op'><img src='Image/upload1.png' /></div><div class='talk_note'><textarea/></div><div class='talk_run'><button>关闭</button><button>发送</button></div></div>";
                $("#talk").html($("#talk").html() + html);
                $("#talk").show();

                //页签
                $(".talktab li").removeClass("talktab_li_selected");
                html = "<li class='talktab_li_selected' talkTabID='" + $(this).attr("uID") + "'>" + $(this).find("span").html() + "</li>";
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
                            $("#talk").hide();
                        }
                        break;
                    case "发送":
                        var $textArea = $talk.find("textarea");
                        var note = $textArea.val();
                        if ($.trim(note).length == 0) return false;//发空过滤
                        $.ajax({
                            type: "post",
                            contentType: "application/json",
                            url: "/Common/Ajax.asmx/sendUserTalk",
                            data: "{SendUserID:'" + $("#hidID").val() + "',ReceiveUserID:'" + talkID + "',Note:'" + note + "'}",
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
                    layer.tab({
                        area: ['340px', '270px'],
                        data: [
                            { title: '申请', content: '<iframe src=\"Iframe/ConfirmUser.aspx?ID=' + ID + '\" frameborder=\"no\" width=\"100%\" height=\"270px\" />' }
                        ]
                    });
                }
                else {//聊天
                    ID = $(this).parents(".ULLayer").attr("UL_talkID");
                    if (ID != undefined) {
                        //窗口
                        $("#talk>div").hide();
                        var html = "<div class='talk' talkID='" + ID + "'><div class='talk_re_note'>加载中...</div><div class='talk_op'><img src='Image/upload1.png' /></div><div class='talk_note'><textarea/></div><div class='talk_run'><button>关闭</button><button>发送</button></div></div>";
                        $("#talk").html($("#talk").html() + html);
                        $("#talk").show();

                        //页签
                        $(".talktab li").removeClass("talktab_li_selected");
                        html = "<li class='talktab_li_selected' talkTabID='" + ID + "'>" + $(this).parents(".ULLayer").attr("UL_talkName") + "</li>";
                        $(".talktab").html($(".talktab").html() + html);


                        $.ajax({
                            type: "post",
                            contentType: "application/json",
                            url: "/Common/Ajax.asmx/sendUserTalkRec",
                            data: "{SendUserID:'" + ID + "',ReceiveUserID:'" + $("#hidID").val() + "'}",
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
                                    $talk.find(".talk_re_note").attr("scrollTop", "1000000");
                                }
                            }
                        });
                    }
                }
                $(this).parents(".ULLayer").remove();
                if ($(".ULLayer").size() == 0) { $("#ULLayer").hide(); }//判断是否要隐藏#ULLayer层
                return false;
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
                            html += "<ul class='ULLayer' newID='" + newsList[i].ID + "' sendID='" + newsList[i].SendUserID + "' BusinessType='" + newsList[i].BusinessType + "'><li class='header'><b>系统提醒</b><a>关闭</a></li><li class='body'>“" + newsList[i].Note + "”，需要您的处理！</li><li class='footer'><a>查看</a></li></ul>";
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
                                    html += "<ul class='ULLayer' UL_talkID='" + talkList[i].SendUserID + "' UL_talkName='" + talkList[i].SendUserName + "'><li class='header'><b>系统提醒</b><a>关闭</a></li><li class='body'>“" + talkList[i].SendUserName + "”向你发出聊天申请！</li><li class='footer'><a>查看</a></li></ul>";
                                    $("#ULLayer").html($("#ULLayer").html() + html);
                                    $("#ULLayer").show();
                                }
                            }
                        }
                    }
                }
            });
        }

        function addUserForTeam(userID, teamID) {
            //alert("OK");
        }

        function addGroup(userID, groupID) {
            //alert("OK");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
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
                        <li class="left_op_menu_li_selected">
                            <img src="Image/leftmenu1.png" />
                        </li>
                        <li>
                            <img src="Image/leftmenu2.png" />
                        </li>
                    </ul>
                    <div class="left_user">
                        <div class="searchadd">
                            <div class="searchadd_search"></div>
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
                    </div>
                </div>
            </div>

            <div class="right">
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
                            <img src="Image/upload1.png" />
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


        <asp:HiddenField ID="hidID" runat="server" />

    </form>
</body>
</html>
