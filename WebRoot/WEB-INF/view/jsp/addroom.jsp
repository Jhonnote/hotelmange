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
                            <i class="icon-user"></i> Jack Smith
                            <i class="icon-caret-down"></i>
                        </a>

                        <ul class="dropdown-menu">
                            <li><a tabindex="-1" href="#">My Account</a></li>
                            <li class="divider"></li>
                            <li><a tabindex="-1" class="visible-phone" href="#">Settings</a></li>
                            <li class="divider visible-phone"></li>
                            <li><a tabindex="-1" href="sign-in.html">Logout</a></li>
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

        <a href="#accounts-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-briefcase"></i>客户管理<i class="icon-chevron-up"></i></a>
        <ul id="accounts-menu" class="nav nav-list collapse">
            <li ><a href="<c:url value='/customer/addcustomer'/>">客户录入</a></li>
            <li ><a href="sign-up.html">客户入住</a></li>
            <li ><a href="sign-up.html">客户消费</a></li>
        </ul>

        <a href="#room-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-exclamation-sign"></i>客房管理<i class="icon-chevron-up"></i></a>
        <ul id="room-menu" class="nav nav-list collapse">
            <li ><a href="<c:url value='/room/index'/>">客房管理</a></li>
            <li ><a href="404.html">客房清理</a></li>
        </ul>

        <a href="#legal-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-legal"></i>入住管理<i class="icon-chevron-up"></i></a>
        <ul id="legal-menu" class="nav nav-list collapse">
            <li ><a href="privacy-policy.html">入住查询</a></li>
            <li ><a href="terms-and-conditions.html">退房管理</a></li>
        </ul>
    </div>
    <div class="content">
        <div class="header">
            <h1 class="page-title">客户录入</h1>
        </div>
        <ul class="breadcrumb">
            <li><a href="index.html">首页</a> <span class="divider">/</span></li>
            <li><a href="users.html">客户管理</a> <span class="divider">/</span></li>
            <li class="active">客户录入</li>
        </ul>
        <div class="container-fluid">
            <div class="row-fluid">
<form active="<c:url value='/addcoustomer'/>">         
<div class="btn-toolbar">
    <button type="submit" class="btn btn-primary"><i class="icon-save"></i> 保存</button>
    <button type="reset"  class="btn">重置</a>
</div>
<div class="row-fluid">
<div class="well">
        <label>姓名</label>
        <input type="text" name="name" value="" class="input-xlarge">
        <label>手机号</label>
        <input type="text" name="phonenum" value="" class="input-xlarge">
        <label>身份证号</label>
        <input type="text" name="idnum" value="" class="input-xlarge">
        <label>状态</label>
        <input type="text" name="status" value="" class="input-xlarge">
</div>
</div>
</form>

<!-- <div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> -->
<!--   <div class="modal-header"> -->
<!--     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button> -->
<!--     <h3 id="myModalLabel">Delete Confirmation</h3> -->
<!--   </div> -->
<!--   <div class="modal-body"> -->
    
<!--     <p class="error-text"><i class="icon-warning-sign modal-icon"></i>Are you sure you want to delete the user?</p> -->
<!--   </div> -->
<!--   <div class="modal-footer"> -->
<!--     <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button> -->
<!--     <button class="btn btn-danger" data-dismiss="modal">Delete</button> -->
<!--   </div> -->
<!-- </div> -->


                    
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
        });
    </script>
    
  </body>
</html>
