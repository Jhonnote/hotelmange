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
    <title>首页</title>
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
        .textp p{
            text-align: left;
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
    


    <div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>
    <div class="sidebar-nav">
        <form class="search form-inline">
            <input type="text" placeholder="Search...">
        </form>
        <c:forEach items="${permissionlist}" var="item">
        <c:if test="${item.par_id==0}">
        <a href="#${item.key}" class="nav-header collapsed" data-toggle="collapse"><i class="icon-briefcase"></i>${item.name}<i class="icon-chevron-up"></i></a>
        <ul id="${item.key}" class="nav nav-list collapse">
        <c:forEach items="${permissionlist}" var="itemchil">
        <c:if test="${item.id==itemchil.par_id }">
            <li ><a href="<c:url value='${itemchil.url}'/>">${itemchil.name}</a></li>
        </c:if>
        </c:forEach>
        </ul>
        </c:if>
        </c:forEach>
    </div>
    

    
    <div class="content">
        <div class="header">
            <h1 class="page-title">首页</h1>
        </div>
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a> <span class="divider">/</span></li>
            <li class="active">首页</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">
                    

<div class="row-fluid textp" style="text-align: center;">
<h1 class="center" style="color:#000;margin: 10px 10px;">欢迎使用酒店管理系统</h1>
<p>酒店管理系统分为前台和后台两个部分，其中后台供管理员管理系统之用，包括客房类型设置模块、客房设置模块以及操作员设置三个子模块，具体的功能模块如下。 </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;1.&nbsp;&nbsp;客房类型设置模块：该模块用来管理酒店的所有客房类型，包括新增客房类型、编辑已有客房类型、删除客房类型等功能。 </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;2.&nbsp;&nbsp;客房设置模块：该模块用来管理酒店的所有客房信息，包括新增客房、编辑已有客房、删除客房等功能。 </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;3.&nbsp;&nbsp;操作员设置模块：该模块用来管理酒店的操作员信息，包括新增操作员、编辑已有操作员信息、删除操作信息等功能。 系统前台供酒店所有工作人</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;4.&nbsp;&nbsp;员使用，包括入住登记模块、结账模块、预定模块、客户管理模块以及业务统计五个模块。具体的功能模块如下。 </p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;5.&nbsp;&nbsp;入住登记模块：该模块用来登记客户的入住信息，其中入住信息包括登记信息、客人信息以及费用信息三部分。 </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;6.&nbsp;&nbsp;结账模块：该模块用来处理客户的退房信息，只需要知道客户所住的房间号码，就能进行退房结账。 </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;7.&nbsp;&nbsp;预定模块：该模块用来处理客户的预定信息，除了可以新增预定信息外，还可以对已有的预定信息进行管理。 </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;8.&nbsp;&nbsp;客户管理模块：该模块用来管理客户的登记信息，包括新增客户信息、编译已有客户信息、删除客户信息等功能。 </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;9.&nbsp;&nbsp;业务统计模块：该模块用来统计酒店的客房出租率，并且已图形报表的形式来显示出租率信息</p>
</div>




                    
                    <footer>
                        
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