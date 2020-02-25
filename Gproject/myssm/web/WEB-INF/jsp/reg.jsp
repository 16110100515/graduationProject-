<%--
  Created by IntelliJ IDEA.
  User: forstudy
  Date: 2019/8/21
  Time: 23:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keys" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${APP_PATH}/css/login.css">
    <style>

    </style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <div><a class="navbar-brand" href="index.html" style="font-size:32px;">尚筹网-创意产品众筹平台</a></div>
        </div>
    </div>
</nav>

<div class="container">

    <form id="regForm"  action="${APP_PATH }/dispatcher/doReg.action" method="post" class="form-signin" role="form">
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-log-in"></i> 用户注册</h2>
        <div class="form-group has-success has-feedback">
            <input type="text" class="form-control" id="floginacct" name="loginacct" placeholder="请输入登录账号" autofocus>
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
        </div>
        <div class="form-group has-success has-feedback">
            <input type="text" class="form-control" id="fuserpswd" name="userpswd" placeholder="请输入登录密码" style="margin-top:10px;">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <div class="form-group has-success has-feedback">
            <input type="text" class="form-control" id="femail" name="email" placeholder="请输入邮箱地址" style="margin-top:10px;">
            <span class="glyphicon glyphicon glyphicon-envelope form-control-feedback"></span>
        </div>
        <div id="ftype" class="form-group has-success has-feedback">
            <select class="form-control" name="type">
                <option value="manyperson">企业</option>
                <option value="oneperson">个人</option>
            </select>
        </div>
        <div class="checkbox">
            <label>
                忘记密码
            </label>
            <label style="float:right">
                <a href="${APP_PATH}/dispatcher/login.action">我有账号</a>
            </label>
        </div>
        <a class="btn btn-lg btn-success btn-block" onclick="doreg()" > 注册</a>
        <%--<a href="${APP_PATH }/dispatcher/doReg.action" > 注册2</a>--%>

    </form>
</div>
<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
<script>
    function doreg() {
//        $("#regForm").submit();

        var ftype = $("#ftype");
        var floginacct = $("#floginacct");
        var fuserpswd = $("#fuserpswd");
        var femail = $("#femail");

        if (floginacct.val().trim()==""){
            alert("账户不能为空，请重新输入");
            fuserpswd.focus();
            return false;
        }if ($.trim(fuserpswd.val())==""){
            alert("密码不能为空，请重新输入");
            floginacct.val("");
            floginacct.focus();
            return false;
        }if ($.trim(femail.val())==""){
            alert("邮箱不能为空，请重新输入");
            floginacct.val("");
            floginacct.focus();
            return false;
        }

        $.ajax({
           type:"post",
           url:"${APP_PATH}/dispatcher/doReg.action",
           data:{
               "loginacct":floginacct.val(),
               "userpswd":fuserpswd.val(),
               "email":femail.val(),
               "type":ftype.val()
           } ,
           success:function (result1) {
               if(result1.success){
                   alert("注册成功");
                   window.location.href="${APP_PATH}/dispatcher/login.action";
               }
               else{
                   alert(result1);
                   alert("注册不成功");
               }
           }
        });

    }

</script>

</body>
</html>