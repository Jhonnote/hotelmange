<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>酒店管理系统--客户管理</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="<c:url value='/lib/bootstrap/css/bootstrap.css'/>">
    
    <link rel="stylesheet" type="text/css" href="<c:url value='/stylesheets/theme.css'/>">
    <link rel="stylesheet" href="<c:url value='/lib/font-awesome/css/font-awesome.css'/>">

    <script src="<c:url value='/lib/jquery-1.7.2.min.js'/>" type="text/javascript"></script>

    <!-- Demo page code -->

    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
  </head>

  <!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
  <!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
  <!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
  <!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
  <!--[if (gt IE 9)|!(IE)]><!--> 
  <body class=""> 
  <!--<![endif]-->
    
    <div class="navbar">
        <div class="navbar-inner">
                <ul class="nav pull-right">
                    
                    <li><a href="#" class="hidden-phone visible-tablet visible-desktop" role="button">Settings</a></li>
                    <li id="fat-menu" class="dropdown">
                        <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-user"></i> ${account.account}
                            <i class="icon-caret-down"></i>
                        </a>

                        <ul class="dropdown-menu">
                            <li><a tabindex="-1" href="#">我的账号</a></li>
                            <li class="divider"></li>
                            <li class="divider visible-phone"></li>
                            <li><a tabindex="-1" href="<c:url value='/logout'/>">注销</a></li>
                        </ul>
                    </li>
                    
                </ul>
                <a class="brand" href="index.html"><span class="first"></span> <span class="second">酒店管理系统</span></a>
        </div>
    </div>
    


    
    <div class="sidebar-nav">
        <form class="search form-inline">
            <input type="text" placeholder="Search...">
        </form>

        <c:forEach items="${permissionlist}" var="item">
        <c:if test="${item.par_id==0}">
        <a href="#${item.key}" class="nav-header collapsed" data-toggle="collapse"><i class="icon-briefcase"></i>${item.name}<i class="icon-chevron-up"></i></a>
        <ul id="${item.key}" class="nav nav-list collapse<c:if test="${item.name=='酒店管理'}"> in</c:if>">
        <c:forEach items="${permissionlist}" var="itemchil">
        <c:if test="${item.id==itemchil.par_id }">
            <li <c:if test="${itemchil.name=='入住登记'}">class='active'</c:if>>
            <a href="<c:url value='${itemchil.url}'/>">${itemchil.name}</a></li>
        </c:if>
        </c:forEach>
        </ul>
        </c:if>
        </c:forEach>
    </div>
    <div class="content">
        <div class="header">
            <h1 class="page-title">权限管理</h1>
        </div>
        <ul class="breadcrumb">
            <li><a href="index.html">首页</a> <span class="divider">/</span></li>
            <li><a href="users.html">权限管理</a> <span class="divider">/</span></li>
            <li class="active">权限管理</li>
        </ul>
        <div class="container-fluid">
            <div class="row-fluid">
<form action="<c:url value='/reserveadd'/>" method="post">  
${msg}       
<div class="btn-toolbar">
    <button type="submit" class="btn btn-primary"><i class="icon-save"></i> 提交</button>
    <button type="reset"  class="btn">重置</button>
</div>
<div class="row-fluid">
<div class="well">
        <label>客户名字</label>
        <input type="text" name="name" value="" class="input-xlarge">
        <label>手机号</label>
        <input type="text" name="phonenum" value="" class="input-xlarge">
        <label>身份证号</label>
        <input type="text" name="idcar" value="" class="input-xlarge">
        <label>房间类型</label>
        <select class="input-xlarge" id="selecttype">
        <option value="单人间">单人间</option>
        <option value="双人间">双人间</option>
        <option value="豪华间">豪华间</option>
        </select>
        <label>房间描述</label>
        <select class="input-xlarge" name="room_id">
        <c:forEach items="${room}" var="item">
        <option value="${item.id}">房号${item.id} 价格￥${item.price} 人数${item.number}</option>
        </c:forEach>
        </select>
</div>

</div>
</form>
                    <footer>
                        <hr>
                        <p>&copy; 2017 <a href="#" target="_blank">Portnine</a></p>
                    </footer>
                    
            </div>
        </div>
    </div>
    


    <script src="<c:url value='/lib/bootstrap/js/bootstrap.js'/>"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
            $("#selecttype").change(function(){
                $.ajax({
                url:"/hotelmessage/reserve/query",
                type:"post",
                data:{type:$(this).val()},
                dataType:"json",
                success:function(result){
                $("select[name='room_id']").html("");
                   $.each(result.room,function(index,item){
                      $("select[name='room_id']").append("<option value='"+item.id+"'>房号"+item.id+" 价格"+item.price+" 人数"+item.number+"</option>")
                   });
                }
                });
            });
        });
    </script>
    
  </body>
</html>
