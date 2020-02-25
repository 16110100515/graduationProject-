<%--
  Created by IntelliJ IDEA.
  User: forstudy
  Date: 2019/8/28
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="GB18030">
<head>
    <meta charset="GB18030">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${APP_PATH}/css/main.css">
    <link rel="stylesheet" href="${APP_PATH}/css/doc.min.css">
    <style>
        .tree li {
            list-style-type: none;
            cursor:pointer;
        }
        /** 删除按钮 **/
        .removeVar{
            margin:auto;
            padding:5px;
            display:inline-block;
            background-color:#B02109;
            color:#f1f1f1;
            border:1px solid #005;
            border-radius: 4px;
        }
    </style>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <div><a class="navbar-brand" style="font-size:32px;" href="user.html">众筹平台 - 用户维护</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li style="padding-top:8px;">
                    <div class="btn-group">
                        <button type="button" class="btn btn-default btn-success dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-user"></i> ${user.username} <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#"><i class="glyphicon glyphicon-cog"></i> 个人设置</a></li>
                            <li><a href="#"><i class="glyphicon glyphicon-comment"></i> 消息</a></li>
                            <li class="divider"></li>
                            <li><a href="${APP_PATH}/dispatcher/logout.action"><i class="glyphicon glyphicon-off"></i> 退出系统</a></li>
                        </ul>
                    </div>
                </li>
                <li style="margin-left:10px;padding-top:8px;">
                    <button type="button" class="btn btn-default btn-danger">
                        <span class="glyphicon glyphicon-question-sign"></span> 帮助
                    </button>
                </li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid"style="margin-top: 100px">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <div class="tree">
                <ul style="padding-left:0px;" class="list-group">
                    <li class="list-group-item tree-closed" >
                        <a href="main.html"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a>
                    </li>
                    <li class="list-group-item">
                        <span><i class="glyphicon glyphicon glyphicon-tasks"></i> 权限管理 <span class="badge" style="float:right">3</span></span>
                        <ul style="margin-top:10px;">
                            <li style="height:30px;">
                                <a href="${APP_PATH}/user/toIndex.action" style="color:red;"><i class="glyphicon glyphicon-user"></i> 用户维护</a>
                            </li>
                            <li style="height:30px;">
                                <a href="role.html"><i class="glyphicon glyphicon-certificate"></i> 角色维护</a>
                            </li>
                            <li style="height:30px;">
                                <a href="permission.html"><i class="glyphicon glyphicon-lock"></i> 许可维护</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item tree-closed">
                        <span><i class="glyphicon glyphicon-ok"></i> 业务审核 <span class="badge" style="float:right">3</span></span>
                        <ul style="margin-top:10px;display:none;">
                            <li style="height:30px;">
                                <a href="auth_cert.html"><i class="glyphicon glyphicon-check"></i> 实名认证审核</a>
                            </li>
                            <li style="height:30px;">
                                <a href="auth_adv.html"><i class="glyphicon glyphicon-check"></i> 广告审核</a>
                            </li>
                            <li style="height:30px;">
                                <a href="auth_project.html"><i class="glyphicon glyphicon-check"></i> 项目审核</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item tree-closed">
                        <span><i class="glyphicon glyphicon-th-large"></i> 业务管理 <span class="badge" style="float:right">7</span></span>
                        <ul style="margin-top:10px;display:none;">
                            <li style="height:30px;">
                                <a href="cert.html"><i class="glyphicon glyphicon-picture"></i> 资质维护</a>
                            </li>
                            <li style="height:30px;">
                                <a href="type.html"><i class="glyphicon glyphicon-equalizer"></i> 分类管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="process.html"><i class="glyphicon glyphicon-random"></i> 流程管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="advertisement.html"><i class="glyphicon glyphicon-hdd"></i> 广告管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="message.html"><i class="glyphicon glyphicon-comment"></i> 消息模板</a>
                            </li>
                            <li style="height:30px;">
                                <a href="project_type.html"><i class="glyphicon glyphicon-list"></i> 项目分类</a>
                            </li>
                            <li style="height:30px;">
                                <a href="tag.html"><i class="glyphicon glyphicon-tags"></i> 项目标签</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item tree-closed" >
                        <a href="param.html"><i class="glyphicon glyphicon-list-alt"></i> 参数管理</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main"style="width:75%;margin-left: auto">
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li><a href="#">数据列表</a></li>
                <li class="active">新增</li>
            </ol>
            <div class="panel panel-default">
                <div class="panel-heading">表单数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
                <div class="panel-body">
                    <form  id="updateForm">
                        <div class="allClass" id="all0">
                        <label for="user1"><input type="checkbox" name="user1" id="user1"><span>用户1：</span></label>
                        <div class="form-group">
                            <label for="floginacct">登陆账号</label>
                            <input type="text" class="form-control" id="floginacct" placeholder="请输入登陆账号">
                        </div>
                        <div class="form-group">
                            <label for="fusername">用户名称</label>
                            <input type="text" class="form-control" id="fusername" placeholder="请输入用户名称">
                        </div>
                        <div class="form-group">
                            <label for="femail">邮箱地址</label>
                            <input type="email" class="form-control" id="femail" placeholder="请输入邮箱地址">
                            <p class="help-block label label-warning">请输入合法的邮箱地址, 格式为： xxxx@xxxx.com</p>
                        </div><button id="111">获取</button>
                        </div>
                    </form>
                    <div><button><span id="addVar">新增一项</span></button></div>

                </div>
                <button id="addBtn" type="button" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i> 新增</button>
                <button id="resetBtn" type="button" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">帮助</h4>
            </div>
            <div class="modal-body">
                <div class="bs-callout bs-callout-info">
                    <h4>测试标题1</h4>
                    <p>测试内容1，测试内容1，测试内容1，测试内容1，测试内容1，测试内容1</p>
                </div>
                <div class="bs-callout bs-callout-info">
                    <h4>测试标题2</h4>
                    <p>测试内容2，测试内容2，测试内容2，测试内容2，测试内容2，测试内容2</p>
                </div>
            </div>
            <!--
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary">Save changes</button>
            </div>
            -->
        </div>
    </div>
</div>
<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/script/docs.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/jquery/layer/layer.js"></script>

<script type="text/javascript">
    $(function () {
        $(".list-group-item").click(function(){
            if ( $(this).find("ul") ) {
                $(this).toggleClass("tree-closed");
                if ( $(this).hasClass("tree-closed") ) {
                    $("ul", this).hide("fast");
                } else {
                    $("ul", this).show("fast");
                }
            }
        });
    });
//    --------------------------------------
    var varCount = 1;
    $('#addVar').on('click', function(){
        varCount++;
        $node = '<p><label for="var'+varCount+'">项目 '+varCount+': </label>'
            + '<input type="text" name="var'+varCount+'" id="var'+varCount+'">'
            + '<span class="removeVar">删除</span></p>';

    content='<div class="allClass"id="all'+varCount+'"><label for="user'+varCount+'"><input type="checkbox" name="user'+varCount+'" id="user'+varCount+'"><span>用户'+varCount+'：</span>'
        +'<div class="form-group">'
        +'  <label for="floginacct">登陆账号</label>'
        +'  <input type="text" class="form-control" id="floginacct" placeholder="请输入登陆账号">'
        +'  </div>'
        +'  <div class="form-group">'
        +'  <label for="fusername">用户名称</label>'
        +'  <input type="text" class="form-control" id="fusername" placeholder="请输入用户名称">'
        +'  </div>'
        +'  <div class="form-group">'
        +'  <label for="femail">邮箱地址</label>'
        +'  <input type="email" class="form-control" id="femail" placeholder="请输入邮箱地址">'
        +'  <p class="help-block label label-warning">请输入合法的邮箱地址, 格式为： xxxx@xxxx.com</p>'
        +'</div>'
        + '<span class="removeVar">删除</span></p><button id="111">获取</button></label></div>';

        //新表单项添加到“新增”按钮前面
        $(this).parent().before(content);
    });
    $("#111").click(function () {
        var abc=$("#floginacct").val();
        alert(abc);
    });
    
    $(document).on('click', '.removeVar', function(){
        $(this).parent().remove();
//        varCount--;
    });

    jsonObj={};
    $("#addBtn").click(function () {
//        var selectCheckbox = $(" input:checked");
        var allClass = $(".allClass");

        $.each(allClass,function (i,n) {
            var a = n.id;

            var b = $("#"+a+" input[id='floginacct']").val();
//            alert(b);
//            if (b!=''&&b!=null){
                jsonObj["datas["+i+"].loginacct"] = b;
//            }
            var c = $("#"+a+" input[id='fusername']").val();
//            alert(c);
//            if (c!=''&&c!=null) {
                jsonObj["datas[" + i + "].username"] = c;
//            }
            var d = $("#"+a+" input[id='femail']").val();
//            alert(d);
//            if (d!=''&&d!=null) {
                jsonObj["datas[" + i + "].email"] = d;
//            }
        });

//        $.each(allClass,function (i,n) {
//            var a = n.id;
//            $("#"+a+" input").each(function () {
//                alert($(this).val())
//            });
//        });



        var floginacct = $("#floginacct");
        var fusername = $("#fusername");
        var femail = $("#femail");
        $.ajax({
            type : "Post",
            data : jsonObj,
            url : "${APP_PATH}/user/doAdd.action",
            beforeSend : function () {
                return true;
            },
            success : function (result) {

                if(result.success){
                    layer.msg(result.message,{time:1000,icon:5,shift:6});
//                    layer.msg("保存用户成功", {time:1000, icon:6, shift:6});
                    window.location.href = "${APP_PATH}/user/toIndex.action";
                }
                else{
                    layer.msg("保存用户失败", {time:1000, icon:5, shift:6});
                }
            },
            error : function () {
                layer.msg("保存失败", {time:1000, icon:5, shift:6});
            }
        });



    });
    $("#resetBtn").click(function () {

        $("#updateForm")[0].reset();
//        $("#floginacct").val('123');
    });

</script>
</body>
</html>
