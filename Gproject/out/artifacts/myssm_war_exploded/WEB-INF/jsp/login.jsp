<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keys" content="">
    <meta name="author" content="">
	<link rel="stylesheet" href="${APP_PATH }/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/login.css">
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
		
      <form id="loginForm" action="${APP_PATH }/dispatcher/doLogin.action" method="POST" class="form-signin" role="form">
      	${exception.message }
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-log-in"></i> 用户登录</h2>
		  <div class="form-group has-success has-feedback">
			<input type="text" class="form-control" id="floginacct" name="loginacct" value="" placeholder="请输入登录账号" autofocus>
			<span class="glyphicon glyphicon-user form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="password" class="form-control" id="fuserpswd" name="userpswd" value="" placeholder="请输入登录密码" style="margin-top:10px;">
			<span class="glyphicon glyphicon-lock form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<select id="ftype" class="form-control" name="type">
                <option value="member">会员</option>
                <option value="user" selected>管理</option>
            </select>
		  </div>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 记住我
          </label>
          <br>
          <label>
            忘记密码
          </label>
          <label style="float:right">
            <a href="${APP_PATH }/dispatcher/reg.action">我要注册</a>
          </label>
        </div>
        <a class="btn btn-lg btn-success btn-block" onclick="dologin()" > 登录</a>
            <%--<a href="${APP_PATH }/user/mtry.action" > mtry</a>--%>
      </form>
        ${one.loginacct }
    </div>
    <script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${APP_PATH}/jquery/layer/layer.js"></script>
    <script>
    function dologin() {
        var floginacct = $("#floginacct");
        var fuserpswd = $("#fuserpswd");
        var ftype = $("#ftype");
        if ($.trim(floginacct.val())==""){
            layer.msg("用户账户不能为空，请重新输入",{time:1000,icon:5,shift:6},function () {
                floginacct.val("");
                floginacct.focus();
            });

            return false;
        }
        if (fuserpswd.val().trim()==""){
            layer.msg("密码不能为空，请重新输入",{time:1000,icon:5,shift:6},function () {
                fuserpswd.val("");
                fuserpswd.focus();
            });
        }
        var loadingIndex = -1;
    	$.ajax({
            type:"post",
            data:{
                "loginacct":floginacct.val(),
                "userpswd":fuserpswd.val(),
                "type":ftype.val()
            },
            url:"${APP_PATH}/dispatcher/doLogin.action",
            beforeSend:function () {
//                layer.msg("正在登陆请稍等",{time:1000,icon:6,shift:6});
            var loadingIndex = layer.msg("处理中",{icon:16});
              return true;
            },
            success:function(result){
                layer.close(loadingIndex);
                if(result.success){
                    window.location.href="${APP_PATH}/dispatcher/main.action";
                }
                else{
                    layer.msg(result.message,{time:1000,icon:5,shift:6});
                }

            },
            error:function () {
                alert("error");
            }

        });

    }
    </script>
  </body>
</html>