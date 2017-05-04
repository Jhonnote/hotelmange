<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <ul id="${item.key}" class="nav nav-list collapse<c:if test="${item.name=='客户管理'}"> in</c:if>">
        <c:forEach items="${permissionlist}" var="itemchil">
        <c:if test="${item.id==itemchil.par_id }">
            <li <c:if test="${itemchil.name=='业务统计'}">class='active'</c:if>>
            <a href="<c:url value='${itemchil.url}'/>">${itemchil.name}</a></li>
        </c:if>
        </c:forEach>
        </ul>
        </c:if>
        </c:forEach>
    </div>
    <div class="content">
        <div class="header">
            <h1 class="page-title">客户管理</h1>
        </div>
        <ul class="breadcrumb">
            <li><a href="index.html">首页</a> <span class="divider">/</span></li>
            <li><a href="users.html">客户管理</a> <span class="divider">/</span></li>
            <li class="active">业务统计</li>
        </ul>
        <div class="container-fluid">
            <div class="row-fluid">
<div class="row-fluid">
<div class="well">
    <div>
    状态
    <select id="selectstatus">
    <option value="所有">所有</option>
    <option value="预定">预定</option>
    <option value="入住">入住</option>
    <option value="结账">结账</option>
    </select>
    </div> 
    <form name="roomForm" action="<c:url value='/kefangshezhi'/>" method="post">
	    <table class="table">
	      <thead>
	        <tr>
	          <th>客户名</th>
	          <th>房间号</th>
	          <th>房间类型</th>
	          <th>入住状态</th>
	          <th>价格</th>
	        </tr>
	      </thead>
	      <tbody>
	      <c:forEach items="${checkinlist}" var="item">
	       <tr>
	          <td>${item.name}</td>
	          <td>${item.room_id}</td>
	          <td>${item.type}</td>
	          <td>${item.status}</td>
	          <td>${item.price}</td>
	        </tr>
	      </c:forEach>
	      <tr>
	          <td>统计</td>
	          <td colspan="3"></td>
	          <td>${amountall}</td>
	        </tr>
	      </tbody>
	    </table>
    </form>
</div>
<div class="pagination">
    <ul>
        <li><a href="#">Prev</a></li>
        <li><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">Next</a></li>
    </ul>
</div>

<div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">Delete Confirmation</h3>
    </div>
    <div class="modal-body">
        <p class="error-text"><i class="icon-warning-sign modal-icon"></i>Are you sure you want to delete the user?</p>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
        <button class="btn btn-danger" data-dismiss="modal">Delete</button>
    </div>
</div>
</div>

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
            $("#selectstatus").change(function(){
                $.ajax({
                   url:"/hotelmessage/business/typechange",
                   type:"post",
                   dataType:"json",
                   data:{type:$(this).val()},
                   success:function(result){
                      if(result.success){
                      $("tbody").html("");
                      var dd = "";
                         $.each(result.data,function(index,item){
                             dd=dd+"<tr><td>"+item.name+"</td><td>"+item.room_id+"</td><td>"+item.type+"</td><td>"+item.status+"</td><td>"+item.price+"</td></tr>";
                         })
                         dd=dd+"<tr><td>统计</td><td colspan='3'></td><td>"+result.amountall+"</td></tr>"
                         $("tbody").append(dd);
                      }
                   }
                })
            });
        });
    </script>
  </body>
</html>

