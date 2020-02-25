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
    <link rel="stylesheet" href="${APP_PATH }/jquery/jquery-2.1.1.min.js">
    <style>
        .tree li {
            list-style-type: none;
            cursor:pointer;
        }
        table tbody tr:nth-child(odd){background:#F4F4F4;}
        table tbody td:nth-child(even){color:#C00;}
    </style>
    <style type="text/css">
        .container {position:absolute; display:none; padding-left:10px;}
        .shadow {float:left;}
        .frame {position:relative; background:#fff; padding:6px; display:block;
            -moz-box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
            -webkit-box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
            box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.6);
            margin-left: -250px;
            margin-top: -100px;
        }
        .clear {clear:left;}
        label,a {font-size:13px;color:#4f6b72;}
        #language {font-size:13px;color:#4f6b72;border:1px solid #4f6b72;height:20px;}
        div.frame div {margin-bottom:5px;}
        div.frame div.foot {margin-top:10px;background: bisque;width: 30px}
        div.frame label {margin: 0 10px 0 5px;}
        div.frame a:link,div.frame span a:visited {
            text-decoration:none;
        }
    </style>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹平台 - 用户维护</a></div>
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
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
                </div>
                <div class="panel-body">
                    <form class="form-inline" role="form" style="float:left;">
                        <div class="form-group has-feedback">
                            <div class="input-group">
                                <div class="input-group-addon">查询条件</div>
                                <input id="queryText" class="form-control has-success" type="text" placeholder="请输入查询条件">
                            </div>
                        </div>
                        <button id="queryBtn" type="button" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询</button>



                        <label for="language">选择字段：</label><input type="text" id="language"/>
                        <div class="container">
                            <div class="shadow">
                                <div class="frame">
                                    <%--<div><input name="select" type="checkbox" id="location0"/><label for="location0">北京</label></div>--%>
                                    <%--<div><input name="select" type="checkbox" id="location1"/><label for="location1">上海</label></div>--%>
                                    <%--<div><input name="select" type="checkbox" id="location2"/><label for="location2">广州</label></div>--%>
                                    <%--<div><input name="select" type="checkbox" id="location3"/><label for="location3">深圳</label></div>--%>
                                    <%--<div><input name="select" type="checkbox" id="location4"/><label for="location4">南京</label></div>--%>
                                    <%--<div><input name="select" type="checkbox" id="location5"/><label for="location5">天津</label></div>--%>
                                    <%--<div class="foot"><a href="${APP_PATH}/user/toIndex.action" id="submit">确定</a></div>--%>
                                </div>

                            </div>
                        </div><a href="#" onclick="selectfun()" id="">确定</a>


                    </form>
                    <button id="deleteBatchBtn" type="button" class="btn btn-danger" style="float:right;margin-left:10px;"><i class=" glyphicon glyphicon-remove"></i> 删除</button>
                    <button type="button" class="btn btn-primary" style="float:right;" onclick="window.location.href='${APP_PATH}/user/toAdd.action'"><i class="glyphicon glyphicon-plus"></i> 新增</button>
                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive">


                        <table class="table  table-bordered">
                            <%--<div style="margin-left: 42px;background: lightgoldenrodyellow" width="30px"><label><input id="selectall" type="checkbox"><strong>&nbsp;&nbsp;&nbsp;&nbsp;全选/全不选</strong></label></div>--%>


                            <thead class="selecttitle">
                            <%--<tr >--%>
                                <%--<th width="30">#</th>--%>
                                <%--<th width="30"><input type="checkbox"></th>--%>
                                <%--<th>账号</th>--%>
                                <%--<th>名称</th>--%>
                                <%--<th>邮箱地址</th>--%>
                                <%--<th width="100">操作</th>--%>
                            <%--</tr>--%>
                            </thead>
                            <tbody>


                            <%--<c:forEach items="${page.datas }" var="user" varStatus="status">--%>
                                <%--<tr>--%>
                                    <%--<td>${status.count }</td>--%>
                                    <%--<td><input type="checkbox"></td>--%>
                                    <%--<td>${user.loginacct }</td>--%>
                                    <%--<td>${user.username }</td>--%>
                                    <%--<td>${user.email }</td>--%>
                                    <%--<td>--%>
                                        <%--<button type="button" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>--%>
                                        <%--<button type="button" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>--%>
                                        <%--<button type="button" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>--%>
                                    <%--</td>--%>
                                <%--</tr>--%>
                            <%--</c:forEach>--%>
                            </tbody>
                            <tfoot>
                            <tr >
                                <td colspan="6" align="center">
                                    <ul class="pagination">
                                        <%--<c:if test="${page.pageno==1 }">--%>
                                            <%--<li class="disabled"><a href="#">上一页</a></li>--%>
                                        <%--</c:if>--%>
                                        <%--<c:if test="${page.pageno!=1 }">--%>
                                            <%--<li><a href="#" onclick="pageChange(${page.pageno-1})">上一页</a></li>--%>
                                        <%--</c:if>--%>

                                        <%--<c:forEach begin="1" end="${page.totalno }" var="num">--%>
                                            <%--<li--%>
                                                    <%--<c:if test="${page.pageno == num}">--%>
                                                        <%--class="active"--%>
                                                    <%--</c:if>--%>
                                            <%-->--%>
                                                <%--<a href="#" onclick="pageChange(${num})">${num }</a>--%>
                                            <%--</li>--%>
                                        <%--</c:forEach>--%>

                                        <%--<c:if test="${page.pageno==page.totalno }">--%>
                                            <%--<li class="disabled"><a href="#">下一页</a></li>--%>
                                        <%--</c:if>--%>
                                        <%--<c:if test="${page.pageno!=page.totalno }">--%>
                                            <%--<li><a href="#" onclick="pageChange(${page.pageno+1})">下一页</a></li>--%>
                                        <%--</c:if>--%>
                                         <%--&lt;%&ndash;<c:forEach begin="1" end="${page.totalno}" var="num">&ndash;%&gt;--%>

                                             <%--&lt;%&ndash;<li href="#" onclick="pagechange(${num})">${num}</li>&ndash;%&gt;--%>
                                         <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>

                                        <%--&lt;%&ndash;<c:if test="${page.pageno!=page.totalno}">&ndash;%&gt;--%>
                                            <%--&lt;%&ndash;<a href="#" onclick="pagechange(${page.pageno+1})">下一页</a>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>

                                    </ul>
                                </td>
                            </tr>

                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
<script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH }/script/docs.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/jquery/layer/layer.js"></script>
<script type="text/javascript" src="${APP_PATH }/script/menu.js"></script>

<script language="javascript">
    $('#language').bind('focus', function() {
        var offset = $(this).offset(), container = $('div.container');
        container.css({top:offset.top+Number($(this).css('height').replace('px', '')), left:offset.left}).show(100);
    });
    $(document).bind('click', function(){
        var targ;
        if (event.target) targ = event.target
        else if (event.srcElement) targ = event.srcElement
        if (targ.nodeType == 3) // defeat Safari bug
            targ = targ.parentNode;
        if (targ.id !='language' && !$(targ).parents('div.container').attr('class'))
            $('div.container').hide(100);
    });
    $('#submit').bind('click', function(){
        var vals = '', length;
        $('div.frame input[type=checkbox]:checked').each(function(){
            vals += ($(this).next().text() + ';');
        });
        if ((length = vals.length) > 0) vals = vals.substr(0, length -1);
        $('#language').val(vals);
        $('div.container').hide(100);
    });
</script>
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
        queryPageUser(1);

        showMenu();
//        selectfun();

    });
//    function showMenu() {
//        var href = window.location.href;
//
//    }
    $("tbody .btn-success").click(function(){
        window.location.href = "assignRole.html";
    });
    $("tbody .btn-primary").click(function(){
        window.location.href = "edit.html";
    });


    function pageChange(pageno){
       // window.location.href="${APP_PATH}/user/index.action?pageno="+pageno ;
        queryPageUser(pageno);
    }
    <%--function pagechange(a) {--%>
        <%--window.location.href="${APP_PATH}/user/index.action?pageno="+a;--%>
    <%--}--%>

    var jsonObj ={
        "pageno":1,
        "pagesize":10,
        "queryText":'',
        "check_val":'',
        "check_val1":''
//        "check_val1":'0 1 2 3 '

    };
    var loadingIndex = -1
    function queryPageUser(pageno){
        jsonObj.pageno = pageno;
        $.ajax({
           type:"POST",
           data:jsonObj,
           url:"${APP_PATH}/user/index.action",
           beforeSend:function () {
               loadingIndex = layer.load(2,{time:1000*10});
                return true;
            },
           success:function (result) {
               layer.close(loadingIndex);
               if(result.success){
                   var check_val = result.check_val;
//                   alert(check_val);

                   var contenttitle='';
//                    if(jsonObj.check_val!=''&&check_val1!='')
                   {


                       contenttitle+='<tr >';
                       contenttitle+='<th width="30">#</th>';
                       contenttitle+='<th width="30"><input id="allCheckbox" type="checkbox"></th>';
//                       contenttitle+='<th width="30"><input onclick="allCheckbox()" type="checkbox"></th>';
                       contenttitle+='for(j = 0,len=check_val.length; j < len; j++) {';

                   for(j = 0,len=check_val.length; j < len; j++) {
                       if(check_val[j]==0&&check_val!=''){
                           contenttitle+='<th>账号</th>';
                       }
                       if(check_val[j]==1){
                           contenttitle+='<th>名称</th>';
                       }
                       if(check_val[j]==2){
                           contenttitle+='<th>邮箱地址</th>';
                       }
                   }
               contenttitle+='<th width="100">操作</th>';
               contenttitle+='</tr>';
                   }
                   $(".selecttitle").html(contenttitle);


                   var contentselect='';
                   var select = result.userList;
                   $.each(select,function (i,n) {
                       contentselect+='<div><input name="select" value="'+i+' " type="checkbox" ';
                       //-----------
//                       if(jsonObj.check_val!=''&&check_val1!='')
                       {
                       for(j = 0,len=check_val.length; j < len; j++) {

                           if (check_val[j] == i&&check_val!='') {
                               contentselect += 'checked ';
                           }
                       }}
                       contentselect+='id="location'+i+'"/><label for="location'+i+'">'+n.name+'</label></div>';

                   });
//                   contentselect+='<div class="foot"><a href="#" id="selectBtn">确定</a></div>\n'
                   $(".frame").html(contentselect);


                   var page = result.page ;
                   var data = page.datas ;
                   var content = "";
                   $.each(data,function (i,n) {

                       content+='<tr>';
                       content+='   <td>'+(i+1)+'</td>';
                       content+='   <td><input type="checkbox" id="'+n.id+'" name="'+n.loginacct+'"></td>';

                       //------------------
//                       if(jsonObj.check_val!=''&&check_val1!='')
                       {
                           for (j = 0, len = check_val.length; j < len; j++) {
                               if (check_val[j] == 0 && check_val != '') {
                                   content += '   <td>' + n.loginacct + '</td>';
                               }
                               if (check_val[j] == 1) {
                                   content += '   <td>' + n.username + '</td>';
                               }
                               if (check_val[j] == 2) {
                                   content += '   <td>' + n.email + '</td>';
                               }
                           }
                       }


                       content+='   <td>';
                       content+='       <button type="button" onclick="window.location.href=\'${APP_PATH}/user/assignRole.action?id='+n.id+'\'" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>';
                       content+='       <button type="button" onclick="window.location.href=\'${APP_PATH}/user/toUpdate.action?id='+n.id+'\'" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>';
                       content+='       <button type="button" onclick="deleteUser('+n.id+',\''+n.loginacct+'\')" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>';
                       content+='   </td>';
                       content+='</tr>';
                   });
                   $("tbody").html(content);

//                   var contentBar = '';
//                       if(page.pageno==page.totalno){
//                            contentBar+='<li class="disabled"><a href="#">下一页</a></li>'
//                       }
//                       else{
//                           contentBar+='<li><a href="#" onclick="pageChange('+(page.pageno+1)+')">下一页</a></li>'
//                       }
//
//
//
//                   $(".pagination").html(contentBar);
                   var contentBar = '';

                   if(page.pageno==1 ){
                       contentBar+='<li class="disabled"><a href="#">上一页</a></li>';
                   }else{
                       contentBar+='<li><a href="#" onclick="pageChange('+(page.pageno-1)+')">上一页</a></li>';
                   }

                   for(var i = 1 ; i<= page.totalno ; i++ ){
                       contentBar+='<li';
                       if(page.pageno==i){
                           contentBar+=' class="active"';
                       }
                       contentBar+='><a href="#" onclick="pageChange('+i+')">'+i+'</a></li>';
                   }

                   if(page.pageno==page.totalno ){
                       contentBar+='<li class="disabled"><a href="#">下一页</a></li>';
                   }else{
                       contentBar+='<li><a href="#" onclick="pageChange('+(page.pageno+1)+')">下一页</a></li>';
                   }

                   $(".pagination").html(contentBar);

               }
               else{
                   layer.msg(result.message,{time:1000,icon:5,shift:6});
               }
           }
        });

    }
    $("#queryBtn").click(function () {
        var queryText = $("#queryText").val();
        jsonObj.queryText = queryText;
        queryPageUser(1);
    });

    function selectfun() {
        check_val = [];
        check_val1 = '';
        $.each($('input:checkbox'),function(){
            if(this.checked){
//                    window.alert("你选了："+
//                        $('input[type=checkbox]:checked').length+"个，其中有："+$(this).val());
                check_val.push($(this).val());
//                    jsonObj.check_val = $(this).val();
                check_val1+=$(this).val();
            }
        });
        jsonObj.check_val = check_val;
        jsonObj.check_val1 = check_val1;
        queryPageUser(1);
    }
    $("#selectBtn").click(function () {

//        $("#selectBtn").click(function(){
        check_val = [];
        check_val1 = '';
            $.each($('input:checkbox'),function(){
                if(this.checked){
//                    window.alert("你选了："+
//                        $('input[type=checkbox]:checked').length+"个，其中有："+$(this).val());
                    check_val.push($(this).val());
//                    jsonObj.check_val = $(this).val();
                    check_val1+=$(this).val();
                }
            });
//        alert(check_val)
//        alert(check_val1)
        jsonObj.check_val = check_val;
        jsonObj.check_val1 = check_val1;
        queryPageUser(1);
//        });
//        var selectText = $("#language :checked ").id;
//        alert(selectText);
//        var obj = document.getElementsByName("select");
////        alert(obj);
//        check_val = [];
//        for(k in obj){
//            if(obj[k].checked)
//            check_val.push(obj[k].id);
//            alert(obj[k].id)
//        }
////        alert(check_val);

    });
    function deleteUser(id,loginacct) {
        layer.confirm("是否删除["+loginacct+"]?",  {icon: 3, title:'提示'}, function(cindex){
            layer.close(cindex);
            $.ajax({
                type : "Post",
                data : {
                    "id" : id
                },
                url : "${APP_PATH}/user/doDelete.action",
                beforeSend : function () {
                    return true;
                },
                success : function (result) {

                    if(result.success){
                        layer.msg(result.message,{time:1000,icon:16});
//                    layer.msg("保存用户成功", {time:1000, icon:6, shift:6});
                        window.location.href = "${APP_PATH}/user/toIndex.action";
                    }
                    else{
                        layer.msg("删除用户失败", {time:1000, icon:5, shift:6});
                    }
                },
                error : function () {
                    layer.msg("删除失败", {time:1000, icon:5, shift:6});
                }
            });
        }, function(cindex){
            layer.close(cindex);
        });
    }

    <%--function allCheckbox() {--%>
        <%--alert(this.checked);--%>
        <%--&lt;%&ndash;${"tbody tr td input[type='checkbox']"}.attr("checked",this.checked);&ndash;%&gt;--%>

    <%--}--%>
    var i =0;
    $(document).on("click",'#allCheckbox',function () {
        var checkedStatus = this.checked ;
////        alert(checkedStatus);
//
//        $("tbody tr td input[type='checkbox']").attr("checked",checkedStatus);
        if(checkedStatus){
            //把所有复选框选中
            $("tbody td :checkbox").prop("checked", true);
        }else{
            $("tbody tr td :checkbox").prop("checked", false);
        }
    });

//    var i = 0;
//    $("#selectall").click(function () {
//        if(i==0){
//            //把所有复选框选中
//            $("tbody td :checkbox").prop("checked", true);
//            i=1;
//        }else{
//            $("tbody tr td :checkbox").prop("checked", false);
//            i=0;
//        }
//
//    });

    $("#deleteBatchBtn").click(function(){

        var selectCheckbox = $("tbody tr td input:checked");

        if(selectCheckbox.length==0){
            layer.msg("至少选择一个用户进行删除!请选择用户!", {time:1000, icon:5, shift:6});
            return false ;
        }

        var idStr = "";

        $.each(selectCheckbox,function(i,n){
            //  url?id=5&id=6&id=7
//            if(i!=0){
//                idStr += "&";
//            }
            idStr += ""+n.id+",";

        });
//        var jsonObj2 ={};
//        $.each(selectCheckbox,function (i,n) {
//            jsonObj2["datas["+i+"].id"] = n.id;
//            jsonObj2["datas["+i+"].loginacct"] = n.name;
//        });
        var jsonObj = {};

        $.each(selectCheckbox,function(i,n){
            jsonObj["datas["+i+"].id"] = n.id;
            jsonObj["datas["+i+"].loginacct"] = n.name;
        });

        layer.confirm("确认要删除这些用户吗?",  {icon: 3, title:'提示'}, function(cindex){
            layer.close(cindex);
//            alert(idStr);
//            alert(jsonObj2);
            $.ajax({
                type : "POST",
                data : jsonObj,
//                data : {
//                    "idStr" : idStr
//                },
                url : "${APP_PATH}/user/doDeleteBatch.action",
                beforeSend : function() {
                    return true ;
                },
                success : function(result){
                    if(result.success){
                        window.location.href="${APP_PATH}/user/toIndex.action";
                    }else{
                        layer.msg("删除用户失败", {time:1000, icon:5, shift:6});
                    }
                },
                error : function(){
                    layer.msg("删除失败", {time:1000, icon:5, shift:6});
                }
            });
        }, function(cindex){
            layer.close(cindex);
        });

    });




</script>
</body>
</html>
