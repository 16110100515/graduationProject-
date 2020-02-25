<%--
  Created by IntelliJ IDEA.
  User: forstudy
  Date: 2019/10/24
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${APP_PATH }/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH }/css/font-awesome.min.css">
    <link rel="stylesheet" href="${APP_PATH }/css/login.css">
    <style>

        .message-box{
            padding: 0.5rem;
            width: 100%;
            height: 100%;
            overflow-y: auto;
        /*//竖直方向有滚动条，如果想要横向的，可以把y改为x*/
        }
    </style>
</head>
<body >
<div style="margin-left: 10px;">
<h1 style="text-align: center"> Java单线程 聊天室2.0</h1>
<div class="" style="opacity:0.8;position: fixed;right: 20px;top: 200px;border: 3px red solid;background-color: mintcream">
    <h3><b>活跃用户</b></h3>
    <div class="onlinePeople" >

    </div>
    <h3><b>阶段性发言排行</b></h3>
    <form class="papapa"></form>
    <%--<tbody>--%>
        <%--<c:forEach items="${halfHour}" var="log" varStatus="status">--%>
            <%--<h3>--%>
                <%--${log}--%>
            <%--</h3>--%>

        <%--</c:forEach>--%>
    <%--</tbody>--%>

</div>
<form  style="border: 2px olivedrab solid ;height: 402px;">
    <div id="message-box" class="ppp"style="height:390px;overflow:auto;background:#EEEEEE;">

    </div>
    <%--<c:forEach items="${qqtext}" var="log" varStatus="status">--%>
    <%--<h3>--%>
    <%--${log}--%>
    <%--</h3>--%>

    <%--</c:forEach>--%>
</form>

<form action="${APP_PATH}/dispatcher/toqq.action?myName=${mapName}" method="post" >

    <h3><b>消息框:</b></h3>
    <input autocomplete="off"class="form-control"id="ifnulltext" style="height: 150px" type="text" name="myText"/>
    <%--<input type="text" value="${user.username}" name="myName"/><br/>--%>

    <input  class="btn btn-lg btn-success btn-block"type="submit" onclick="doflash()"value="发送">
</form>

<%--<button onclick="doflash()">刷新</button>--%>


<%--<form action="${APP_PATH}/dispatcher/qq.action?un=${mapName}" method="post" style="margin-bottom: 1000px">--%>

    <%--text：<input type="text" name="myText"/><br/>--%>
    <%--&lt;%&ndash;<input type="text" value="${user.username}" name="myName"/><br/>&ndash;%&gt;--%>

    <%--<input type="submit" value="发送">--%>
<%--</form>--%>


<script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
<script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/jquery/layer/layer.js"></script>

<script language="JavaScript">
//    function myrefresh(){
////        window.location.doflash();
//        doflash();
//    }
//    window.setTimeout('doflash()',1000); //指定0.1秒刷新一次
    setInterval('doflash2()', 200);
    setInterval('shuaxing()', 201);

</script>
<script type="text/javascript">
    function shuaxing() {
        var div = document.getElementById('message-box');
        if(div.scrollTop==0){
            div.scrollTop = div.scrollHeight;

        }
    }
    function doflash() {
        var ifnulltext = $("#ifnulltext");
//        if ($.trim(ifnulltext.val())==""){
//            layer.msg("请勿刷屏，写点东西吧~",{time:1000,icon:5,shift:6},function () {
//                ifnulltext.val("");
//                ifnulltext.focus();
//            });
//
//            return false;
//        }
        $.ajax({
            type : "POST",
            url : "${APP_PATH}/dispatcher/doqq.action",
            beforeSend : function(){
                if ($.trim(ifnulltext.val())==""){
                    layer.msg("大哥别刷屏",{time:2000,icon:5,shift:6},function () {
                        ifnulltext.val("");
                        ifnulltext.focus();
                    });

                    return false;
                }

//                return true ;
            },
            success : function(result){
                if(result.success){
                    var content='';
                    var select = result.userList;
                    $.each(select,function (i,n) {
                        content+='<h4>'+n+'</h4>';
//                        content+=n;
                    });
                    $(".ppp").html(content);
                    var content1='';
                    var select1 = result.hourList;
                    $.each(select1,function (i,n) {
                        content1+='<h4>'+n+'</h4>';
//                        content+=n;
                    });
                    $(".papapa").html(content1);
                    var content2='';
                    var select2 = result.onlineList;
                    $.each(select2,function (i,n) {
                        content2+='<span>'+n+' </span>';
//                        content+=n;
                    });
                    $(".onlinePeople").html(content2);


                }
                var div = document.getElementById('message-box');
                div.scrollTop = div.scrollHeight;

            },
            error : function(){

            }
        });
        <%--$.ajax({--%>
            <%--url : "${APP_PATH}/dispatcher/doqq.action",--%>
            <%--&lt;%&ndash;url:"${APP_PATH}/user/index.action",&ndash;%&gt;--%>
            <%--type : "post",--%>
            <%--dataType : "json",--%>
            <%--success : function(result) {--%>
                <%--var contentselect='';--%>
                <%--var select = result.userList;--%>
                <%--$.each(select,function (i,n) {--%>
                    <%--contentselect+='n'+'p';--%>
                <%--});--%>
                <%--$(".ppp").html(contentselect);--%>
            <%--}--%>
        <%--});--%>

    }
    <%--$("#btn_login").click(function() {--%>
        <%--$.ajax({--%>
            <%--url : "${APP_PATH}/dispatcher/doqq.action",--%>
            <%--type : "post",--%>
            <%--dataType : "json",--%>
            <%--success : function(result) {--%>
                <%--var contentselect='';--%>
                <%--var select = result.userList;--%>
                <%--$.each(select,function (i,n) {--%>
                    <%--contentselect+='n'+'p';--%>
<%--//                    contentselect+='id="location'+i+'"/><label for="location'+i+'">'+n.name+'</label></div>';--%>

                <%--});--%>
                <%--$(".ppp").html(contentselect);--%>
            <%--}--%>
        <%--});--%>
    <%--});--%>

    function doflash2() {

        $.ajax({
            type : "POST",
            url : "${APP_PATH}/dispatcher/doqq.action",
            beforeSend : function(){
                return true ;
            },
            success : function(result){
                if(result.success){
                    var content='';
                    var select = result.userList;
                    $.each(select,function (i,n) {
                        content+='<h4>'+n+'</h4>';
//                        content+=n;
                    });
                    $(".ppp").html(content);
                    var content1='';
                    var select1 = result.hourList;
                    $.each(select1,function (i,n) {
                        content1+='<h4>'+n+'</h4>';
//                        content+=n;
                    });
                    $(".papapa").html(content1);
                    var content2='';
                    var select2 = result.onlineList;
                    $.each(select2,function (i,n) {
                        content2+='<span>'+n+' </span>';
//                        content+=n;
                    });
                    $(".onlinePeople").html(content2);


                }

            },
            error : function(){

            }
        });
        <%--$.ajax({--%>
        <%--url : "${APP_PATH}/dispatcher/doqq.action",--%>
        <%--&lt;%&ndash;url:"${APP_PATH}/user/index.action",&ndash;%&gt;--%>
        <%--type : "post",--%>
        <%--dataType : "json",--%>
        <%--success : function(result) {--%>
        <%--var contentselect='';--%>
        <%--var select = result.userList;--%>
        <%--$.each(select,function (i,n) {--%>
        <%--contentselect+='n'+'p';--%>
        <%--});--%>
        <%--$(".ppp").html(contentselect);--%>
        <%--}--%>
        <%--});--%>
    }
</script>

</div>
</body>
</html>
