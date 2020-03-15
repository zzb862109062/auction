<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Home</title>
<script type="text/javascript" src="<%=path %>/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=path %>/front/js/slider.js"></script>
<script type="text/javascript" src="<%=path %>/front/js/owl.carousel.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Lookz Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<link rel="stylesheet" href="<%=path %>/bootstrap/css/bootstrap-theme.min.css" type="text/css"></link>
<script type="text/javascript" src="<%=path %>/bootstrap/js/bootstrap.min.js"></script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<link href="<%=path %>/front/css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<!--webfont-->

<!-- start menu -->
<link href="<%=path %>/front/css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="<%=path %>/front/js/megamenu.js"></script>
<link rel="stylesheet" href="<%=path %>/bootstrap/css/bootstrap.min.css" type="text/css"></link>
<script type="text/javascript" src="<%=path %>/bootstrap/js/bootstrap.min.js"></script>
 <script defer src="<%=path %>/front/js/jquery.flexslider.js"></script>
<script type="text/javascript" src="<%=path %>/layer/layer.js"></script>
<script type="text/javascript" src="<%=path %>/Validform/Validform_v5.3.2_min.js"></script>
<link href="<%=path %>/front/css/flexslider.css" rel='stylesheet' type='text/css' />
  </head>
  <body>
   	        <div class="header_top">
		  <div class="col-sm-9 h_menu4">
				<ul class="megamenu skyblue">
					  <li class="active grid"><a class="color8" href="<%=path %>/front/index.jsp">首页</a></li>
					    <c:if test="${username==null }">
						<li><a class="color3" href="<%=path %>/front/register.jsp">注册</a></li>
            				 </c:if>
            			 <c:if test="${username!=null }">
                 			<li><a class="color3" href="<%=path %>/user.Servlet?cmd=findUser&id=${userid}">用户修改</a></li>
            			 </c:if>	
					      <c:if test="${username==null }">
           				 <li><a class="color5" href="<%=path %>/front/login.jsp">登录</a></li>
           				 </c:if>
            			     <c:if test="${username!=null }">
            			 <li><a class="color5" href="<%=path %>/user.Servlet?cmd=loginout">注销</a></li>
          				  </c:if>
				   	 <li><a class="color4" href="<%=path %>/sp.Servlet?cmd=findCatalog">发布商品</a></li>
				   	 <li><a class="color3" href="<%=path %>/sp.Servlet?cmd=cart">购物车</a></li>
				   	 <li><a class="color1" href="<%=path %>/sp.Servlet?cmd=addOrder">我的订单</a></li>
				   	 <li><a class="color2" href="<%=path %>/front/guestbook.jsp">反馈留言</a></li>				
				   
				    <li><form action="<%=path %>/sp.Servlet" method="post"class="navbar-form navbar-left" role="search">
            			<input type="hidden" name="cmd" value="search"/>
            		 <div class="form-group">
					<input type="text" class="form-control" name="spname"  style="width:200px">
					</div>
					<button type="submit" class="btn btn-default">搜索</button>
					</form>
					</li>
			  		</ul> 
			</div>

   			 <div class="clearfix"> </div>
	</div>
  </body>
</html>
