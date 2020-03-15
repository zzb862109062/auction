<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>购物车</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Lookz Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<!--webfont-->

<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
</head>
<body>
<jsp:include page="head.jsp"/>
<c:if test="${userid!=null }">
<table class="table">
 <h2>购物车</h2>
  <thead>
    <tr>
      <th>商品名称</th>
       <th>价格</th>
      <th>添加日期</th>
      <th>操作</th>
  </thead>
  <tbody>
    <c:forEach items="${cart }" var="cart">
    <tr class="success">
      <td><a href="<%=path %>/sp.Servlet?cmd=spdescribe&id=${cart.spid}">${cart.spname }</a></td>
      <td>${cart.price }</td>
      <td>${cart.createtime }</td>
       <td><a href="<%=path %>/sp.Servlet?cmd=delcart&spid=${cart.spid}">删除</a></td>
      </tr>
   </c:forEach>
  </tbody>
</table>
<h2>总金额 ：${sum }元                      </h2>
   <a href="<%=path %>/sp.Servlet?cmd=addOrder" style="font-size:30px">支付并提交订单</a> 
</c:if>
</body>
</html>		