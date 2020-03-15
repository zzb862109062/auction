<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>发布商品</title>
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


<script type="text/javascript" src="../jquery/jquery-3.1.1.min.js"></script></head>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<body>
<jsp:include page="head.jsp"/>
	 	<c:if test="${userid != null}">
<div class="content">
  <div class="content_box">
	<div class="men">
	 <div class="account-in">
							<h2>发布商品</h2>
							<div class="col-md-7 account-top">
							  <form action="<%=path %>/sp.Servlet" method="post"enctype="multipart/form-data" class="demoform">   
							  <input type="hidden" name="cmd" value="addsp" />
								<div> 	
									<span>类别</span>
									 <select name="catalogid"  id="catalogid" style="width:150px;height:30px;">
									 <c:forEach items="${allCatalog }" var="catalog">
                                   	 <option value="${catalog.catalogid }" >${catalog.catalogname }</option>
                                   </c:forEach>
                            	</select>
								</div>
								<div> 
									<span class="pass">名称</span>
									<input type="text" id="spname" name="spname" 
									placeholder="请输入名称"   datatype="*1-30"  nullmsg="名称不能为空！" errormsg="请输入1-30个字符！"/> 
								</div>
								<div> 
									<span class="pass">描述</span>
									<input type="text" id="description" name="description"
									placeholder="请输入描述"   datatype="*1-255"  nullmsg="描述不能为空！" errormsg="请输入1-255个字符！"/> 
								</div>		
								<div> 
									<span class="pass">价格</span>
									<input type="number" id="price" name="price"
									placeholder="请输入价格"   datatype="/^(0|[1-9][0-9]{0,9})(\.[0-9{1,2}])?$/"  nullmsg="价格不能为空！" errormsg="请输入正确价格！"/> 
			                 		<span>元</span>
								</div>	
								<div> 
									<span class="pass">图片</span>
									<input type="file" id="picture" name="picture" 
									 datatype="/^\S*\.(?:png|jpg|bmp|gif)$/i"  nullmsg="图片不能为空！" errormsg="请选择图片！"/>
								</div>				
									<input type="submit" value="发布商品"  class="btn btn-primary"> 
							   </form>
							</div>
					
						<div class="clearfix"> </div>
					</div>
    </div>	
    </div>
    </div>
    </c:if>
    <c:if test="${userid == null}">
    	 <div class="alert alert-success">请先登录</div>
    </c:if>
<script type="text/javascript">
   $(".demoform").Validform({tiptype:function(msg,o,cssctl){
		if(o.type!=2){
			layer.tips(msg,o.obj);
		}
	}

	});
   </script>
</body>
</html>		

