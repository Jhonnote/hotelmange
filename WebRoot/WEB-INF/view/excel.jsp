<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'excel.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<c:url value='/js/jquery-1.9.1.min.js'/>"></script>
<!-- 	<script src="http://www.jq22.com/jquery/jquery-migrate-1.2.1.min.js"></script> -->
<!-- 	<script type="text/javascript" src="<c:url value='/js/jquery.jqprint-0.3.js'/>"></script> -->
    <script type="text/javascript" src="<c:url value='/js/jquery.printFinal.js'/>"></script>
<script language="javascript">
$(function(){ 
	  function print(preview){
	  $("#content").printFinal({
							preview: preview,//打印预览
							impcss: true//引入css文件						 
                           });
	  
	  }
      $("#printbtn").click(function(){//打印按钮
          $.ajax({
             url:'/hotelmessage/exceldata',
             type:'get',
             dataType:'json',
             success:function(data){
                if(data.data!=null&&data.data!=""){
                   $.each(data.data,function(index,item){
//                        for(var i=0;i<item.length;i++){
//                           switch (i) {
// 							case 0:
// 								$(".riqi").text(it);
// 								break;
// 							case 1:
// 								$(".chandi").text(it);
// 								break;
// 							case 2:
// 								$(".maijianname").text(it);
// 								break;
// 							case 3:
// 								$(".maizhuname").text(it);
// 								break;
// 							case 4:
// 								$(".jinzhong").text(it);
// 								break;
// 							case 5:
// 								$(".shougoujia").text(it);
// 								break;
// 							case 6:
// 								$(".jine").text(it);
// 								$(".jinedaxie").text(DX(it));
// 								$(".jinexiaoxie").text(it);
// 								break;			
// 							default:
// 							    print(false);
// 								break;
// 							}
//                        }
                   
                   
                       $.each(item,function(idex,it){
                           switch (idex) {
							case 0:
								$(".riqi").text(it);
								break;
							case 1:
								$(".chandi").text(it);
								break;
							case 2:
								$(".maijianname").text(it);
								break;
							case 3:
								$(".maizhuname").text(it);
								break;
							case 4:
								$(".jinzhong").text(it);
								break;
							case 5:
								$(".shougoujia").text(it);
								break;
							case 6:
								$(".jine").text(it);
								$(".jinedaxie").text(DX(it));
								$(".jinexiaoxie").text(it);
								break;			
							default:
							    print(false);
								break;
							}
                           
// 	                       $(".pinming").text();
// 	                       $(".guobang").text();
// 	                       $(".kaipiao").text();
// 	                       $(".fukuanyuan").text();
// 	                       $(".danhao").text();
// 	                       $(".beizhu").text();
                       })
                       alert("dd")
                   })
                }
             
             }
          })
	       
	  });
	  $("#previewbtn").click(function(){//预览按钮
	            print(true);   
	  });
});


// function  a(){
//         $("#ddd").jqprint({
//      debug: false, //如果是true则可以显示iframe查看效果（iframe默认高和宽都很小，可以再源码中调大），默认是false
//      importCSS: true, //true表示引进原来的页面的css，默认是true。（如果是true，先会找$("link[media=print]")，若没有会去找$("link")中的css文件）
//      printContainer: true, //表示如果原来选择的对象必须被纳入打印（注意：设置为false可能会打破你的CSS规则）。
//      operaSupport: true//表示如果插件也必须支持歌opera浏览器，在这种情况下，它提供了建立一个临时的打印选项卡。默认是true
// });
//     }
    
function DX(num) {  
  var strOutput = "";  
  var strUnit = '仟佰拾亿仟佰拾万仟佰拾元角分';  
  num += "00";  
  var intPos = num.indexOf('.');  
  if (intPos >= 0)  
    num = num.substring(0, intPos) + num.substr(intPos + 1, 2);
    num = num.replace(/,/g,'');
  strUnit = strUnit.substr(strUnit.length - num.length);  
  for (var i=0; i < num.length; i++)  
    strOutput += '零壹贰叁肆伍陆柒捌玖'.substr(num.substr(i,1),1) + strUnit.substr(i,1);  
    return strOutput.replace(/零角零分$/, '整').replace(/零[仟佰拾]/g, '零').replace(/零{2,}/g, '零').replace(/零([亿|万])/g, '$1').replace(/零+元/, '元').replace(/亿零{0,3}万/, '亿').replace(/^元/, "零元");  
};

</script>
<link href="<c:url value='/css/printShou.css'/>" rel="stylesheet" type="text/css" media="print"/>  
<style type="text/css">
*{margin: 0;padding: 0;}
td{border:1px #000 solid;}
table{border-collapse:collapse;text-align: center;}
.left{text-align: left;}
.right{text-align: right;}
tr{height: 32px;}
.broderclean td{border:none;}
.tnt{word-break:break-all;overflow:auto;border:none;font-size:13px;}
</style>
  </head>
  
  <body>
    <div>
    <input type="button" id="printbtn" value="打印">
    <input type="button" onclick="DX($('.jine').text())" value="大写金额">
    </div>
    <div id="content">
    <table widht="585px">
     <tr style="height: 23px;">
       <th colspan=6><h3>武汉白沙洲农副产品大市场有限公司</h3></th>
     </tr>
     <tr class="broderclean">
       <td colspan=6>冬储（自营）进货单</td>
     </tr>
     <tr class="broderclean" style="height:20px;">
       <td width="190px" colspan=2 class="riqi"></td>
       <td width="90px"></td>
       <td width="80px"></td>
       <td colspan=2 width="120px">NO：<span class="danhao">J170001</span></td>
       <td rowspan=7 width="24px" class="tnt">第一联：存根</td>
       <td rowspan=7 width="24px" class="tnt">第二联：收款</td>
       <td rowspan=7 width="24px" class="tnt">第三联：付款</td>
     </tr>
     <tr>
       <td>产地</td>
       <td class="chandi"></td>
       <td>卖方姓名</td>
       <td class="maijianname"></td>
       <td>买主姓名</td>
       <td width="60px" class="maizhuname"></td>
     </tr>
     <tr>
       <td>品名</td>
       <td>净重（KG）</td>
       <td colspan=2>收购价</td>
       <td colspan=2>金额</td>
     </tr>
     <tr>
       <td class="pinming">大白菜</td>
       <td class="jinzhong">3008.35</td>
       <td colspan=2 class="right shougoujia">0.30</td>
       <td colspan=2 class="right jine">9,153.57</td>
     </tr>
     <tr>
       <td>合计大写</td>
       <td colspan=2 class="jinedaxie"></td>
       <td>小写合计</td>
       <td colspan=2 class="right jinexiaoxie">9,153.57</td>
     </tr>
     <tr>
       <td class="left">备注</td>
       <td colspan=5 class="beizhu"></td>
     </tr>
     <tr class="broderclean" style="height: 20px">
       <td colspan=6></td>
     </tr>
     <tr class="broderclean">
       <td class="left">过磅：</td>
       <td class="guobang"></td>
       <td class="left">开票：</td>
       <td class="kaipiao"></td>
       <td class="left">付款员：</td>
       <td class="fukuanyuan"></td>
     </tr>
    </table>
    </div>
  </body>
</html>
