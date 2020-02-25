<%--
  Created by IntelliJ IDEA.
  User: forstudy
  Date: 2019/8/21
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${APP_PATH}/css/main.css">
    <style>
        .tree li {
            list-style-type: none;
            cursor:pointer;
        }
        .tree-closed {
            height : 40px;
        }
        .tree-expanded {
            height : auto;
        }
    </style>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid" >
        <div class="navbar-header">
            <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹平台 - 控制面板</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li style="padding-top:8px;">
                    <div class="btn-group">
                        <button type="button" class="btn btn-default btn-success dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-user"></i> <strong>${user.username}</strong> <span class="caret"></span>
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
                <input type="text" class="form-control" placeholder="查询">
            </form>
        </div>
    </div>
</nav>
<div class="container-fluid"style="margin-top: 100px">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <div class="tree">
                <jsp:include page="/WEB-INF/jsp/common/menu.jsp"></jsp:include>
                <a href="${APP_PATH}/dispatcher/qq.action?un=${user.username}"><h3>聊个天吧</h3></a>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main"style="width:75%;margin-left: auto">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 日志列表</h3>
                </div>
            <div class="panel-body">
                <form class="form-inline" role="form" style="float:left;">
                    <div class="form-group has-feedback">
                        <div class="input-group">
                            <div class="input-group-addon">查询条件</div>
                            <input class="form-control has-success" type="text" placeholder="请输入查询条件">
                        </div>
                    </div>
                    <button type="button" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询</button>
                </form>
                <button type="button" class="btn btn-danger" style="float:right;margin-left:10px;"><i class=" glyphicon glyphicon-remove"></i> 删除</button>
                <button type="button" class="btn btn-primary" style="float:right;" onclick="window.location.href='form.html'"><i class="glyphicon glyphicon-plus"></i> 新增</button>
                <br>
                <hr style="clear:both;">
                <div class="table-responsive">
                    <table class="table  table-bordered">
                        <thead>
                        <tr >
                            <th width="30">#</th>
                            <th width="30"><input type="checkbox"></th>
                            <th>日期</th>
                            <th>用户</th>
                            <th>记录</th>
                            <th width="100">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${allLog}" var="log" varStatus="status">
                            <tr>
                                <td>${status.count }</td>
                                <td><input type="checkbox"></td>
                                <td>${log.date}</td>
                                <td>${log.username}</td>
                                <td>${log.record}</td>
                                <td>
                                    <button type="button" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>
                                    <button type="button" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>
                                    <button type="button" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>
                                </td>
                            </tr>
                        </c:forEach>


                        </tbody>
                        <tfoot>
                        <tr >
                            <td colspan="6" align="center">
                                <ul class="pagination">
                                    <li class="disabled"><a href="#">上一页</a></li>
                                    <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#">下一页</a></li>
                                </ul>
                            </td>
                        </tr>

                        </tfoot>
                    </table>
                </div>
            </div>
            </div>
            <%--<div class="row placeholders">--%>
                <%--<div class="col-xs-6 col-sm-3 placeholder"style="border-radius: 30px;">--%>
                    <%--<img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail"style="border-radius: 100px;">--%>
                    <%--<h4>Label</h4>--%>
                    <%--<span class="text-muted">Something else</span>--%>
                <%--</div>--%>
                <%--<div class="col-xs-6 col-sm-3 placeholder">--%>
                    <%--<img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail"style="border-radius: 100px;">--%>
                    <%--<h4>Label</h4>--%>
                    <%--<span class="text-muted">Something else</span>--%>
                <%--</div>--%>
                <%--<div class="col-xs-6 col-sm-3 placeholder">--%>
                    <%--<img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail"style="border-radius: 100px;">--%>
                    <%--<h4>Label</h4>--%>
                    <%--<span class="text-muted">Something else</span>--%>
                <%--</div>--%>
                <%--<div class="col-xs-6 col-sm-3 placeholder">--%>
                    <%--<img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail"style="border-radius: 100px;">--%>
                    <%--<h4>Label</h4>--%>
                    <%--<span class="text-muted">Something else</span>--%>
                <%--</div>--%>
            <%--</div>--%>

        </div>
    </div>
</div>
<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/script/docs.min.js"></script>
<script type="text/javascript" src="${APP_PATH }/script/menu.js"></script>

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
//        showMenu();
    });

</script>
</body>
</html>
