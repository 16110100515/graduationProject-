<%--
  Created by IntelliJ IDEA.
  User: forstudy
  Date: 2019/9/2
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="${APP_PATH }/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH }/css/font-awesome.min.css">
    <link rel="stylesheet" href="${APP_PATH }/css/main.css">
    <link rel="stylesheet" href="${APP_PATH }/css/doc.min.css">
    <style>
        .tree li {
            list-style-type: none;
            cursor:pointer;
        }
    </style>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <div><a class="navbar-brand" style="font-size:32px;" href="user.html">众筹平台 - 许可维护</a></div>
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
                    </div>                </li>
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
                <jsp:include page="/WEB-INF/jsp/common/menu.jsp"></jsp:include>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main"style="width:75%;margin-left: auto">
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li><a href="#">数据列表</a></li>
                <li class="active">修改</li>
            </ol>
            <div class="panel panel-default">
                <div class="panel-heading">表单数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
                <div class="panel-body">
                    <form id="addForm">
                        <div class="form-group">
                            <label for="fname">许可名称</label>
                            <input type="text" class="form-control" id="fname"  value="${permission.name}" placeholder="请输入许可名称">
                        </div>
                        <div class="form-group">
                            <label for="furl">许可URL</label>
                            <input type="email" class="form-control" id="furl" value="${permission.url}" placeholder="请输入许可URL">
                            <p class="help-block label label-warning">请输入许可URL</p>
                        </div>
                        <div>
                            <%--<body>--%>
                                <input type="radio" name="icon" value="glyphicon glyphicon-th-list" <c:if test="${permission.icon==\"glyphicon glyphicon-th-list\"}">checked</c:if> >
                                    <span class="glyphicon glyphicon-th-list">&nbsp</span>
                                </input>
                                <input type="radio" name="icon" value="glyphicon glyphicon-dashboard" <c:if test="${permission.icon==\"glyphicon glyphicon-dashboard\"}">checked</c:if>>
                                    <span class="glyphicon glyphicon-dashboard">&nbsp</span>
                                </input>
                                <input type="radio" name="icon" value="glyphicon glyphicon glyphicon-tasks" <c:if test="${permission.icon==\"glyphicon glyphicon glyphicon-tasks\"}">checked</c:if>>
                                    <span class="glyphicon glyphicon glyphicon-tasks">&nbsp</span>
                                </input>
                                <input type="radio" name="icon" value="glyphicon glyphicon-user" <c:if test="${permission.icon==\"glyphicon glyphicon-user\"}">checked</c:if>>
                                    <span class="glyphicon glyphicon-user">&nbsp</span>
                                </input>
                                <input type="radio" name="icon" value="glyphicon glyphicon-king" <c:if test="${permission.icon==\"glyphicon glyphicon-king\"}">checked</c:if>>
                                    <span class="glyphicon glyphicon-king">&nbsp</span>
                                </input>
                                <input type="radio" name="icon" value="glyphicon glyphicon-lock" <c:if test="${permission.icon==\"glyphicon glyphicon-lock\"}">checked</c:if>>
                                    <span class="glyphicon glyphicon-lock">&nbsp</span>
                                </input>
                                <input type="radio" name="icon" value="glyphicon glyphicon-ok" <c:if test="${permission.icon==\"glyphicon glyphicon-ok\"}">checked</c:if>>
                                    <span class="glyphicon glyphicon-ok">&nbsp</span>
                                </input>
                                <input type="radio" name="icon" value="glyphicon glyphicon-check" <c:if test="${permission.icon==\"glyphicon glyphicon-check\"}">checked</c:if>>
                                    <span class="glyphicon glyphicon-check">&nbsp</span>
                                </input>
                                <input type="radio" name="icon" value="glyphicon glyphicon-th-large"<c:if test="${permission.icon==\"glyphicon glyphicon-th-large\"}">checked</c:if> >
                                    <span class="glyphicon glyphicon-th-large">&nbsp</span>
                                </input>
                                <input type="radio" name="icon" value="glyphicon glyphicon-picture" <c:if test="${permission.icon==\"glyphicon glyphicon-picture\"}">checked</c:if>>
                                    <span class="glyphicon glyphicon-picture">&nbsp</span>
                                </input>
                                <input type="radio" name="icon" value="glyphicon glyphicon-equalizer" <c:if test="${permission.icon==\"glyphicon glyphicon-equalizer\"}">checked</c:if>>
                                    <span class="glyphicon glyphicon-equalizer">&nbsp</span>
                                </input>
                                <input type="radio" name="icon" value="glyphicon glyphicon-random"<c:if test="${permission.icon==\"glyphicon glyphicon-random\"}">checked</c:if> >
                                    <span class="glyphicon glyphicon-random">&nbsp</span>
                                </input>
                                <input type="radio" name="icon" value="glyphicon glyphicon-hdd" <c:if test="${permission.icon==\"glyphicon glyphicon-hdd\"}">checked</c:if>>
                                    <span class="glyphicon glyphicon-hdd">&nbsp</span>
                                </input>
                                <input type="radio" name="icon" value="glyphicon glyphicon-comment" <c:if test="${permission.icon==\"glyphicon glyphicon-comment\"}">checked</c:if>>
                                    <span class="glyphicon glyphicon-comment">&nbsp</span>
                                </input>
                                <input type="radio" name="icon" value="glyphicon glyphicon-list" <c:if test="${permission.icon==\"glyphicon glyphicon-list\"}">checked</c:if>>
                                    <span class="glyphicon glyphicon-list">&nbsp</span>
                                </input>
                                <input type="radio" name="icon" value="glyphicon glyphicon-tags" <c:if test="${permission.icon==\"glyphicon glyphicon-tags\"}">checked</c:if>>
                                    <span class="glyphicon glyphicon-tags">&nbsp</span>
                                </input>
                                <input type="radio" name="icon" value="glyphicon glyphicon-list-alt" <c:if test="${permission.icon==\"glyphicon glyphicon-list-alt\"}">checked</c:if>>
                                    <span class="glyphicon glyphicon-list-alt">&nbsp</span>
                                </input>

                            <%--</body>--%>
                        </div>
                        <button id="updateBtn" type="button" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i> 修改</button>
                        <button id="resetBtn" type="button" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
                    </form>
                </div>
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
<script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
<script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH }/script/docs.min.js"></script>
<script type="text/javascript" src="${APP_PATH }/jquery/layer/layer.js"></script>
<%--<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>--%>
<script src="${APP_PATH}/script/js/select2.js"></script>

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


    $("#updateBtn").click(function(){

        var fname = $("#fname");
        var furl = $("#furl");
        var icon = $("input[name='icon']:checked").val();

        $.ajax({
            type : "POST",
            data : {
                "name" : fname.val(),
                "url" : furl.val(),
                "id" : "${param.id}",
                "icon" : icon
            },
            url : "${APP_PATH}/permission/doUpdate.action",
            beforeSend : function() {

                return true ;
            },
            success : function(result){
                if(result.success){
                    window.location.href="${APP_PATH}/permission/index.action";
                }else{
                    layer.msg("保存许可失败", {time:1000, icon:5, shift:6});
                }
            },
            error : function(){
                layer.msg("保存失败", {time:1000, icon:5, shift:6});
            }
        });

    });


    $("#resetBtn").click(function(){
        $("#addForm")[0].reset();
    });


</script>
</body>
</html>