<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>商品展示</title>
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

<script type="text/javascript" src="../jquery/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" type="text/css"></link>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
</head>
<body>
<jsp:include page="head.jsp"/>
  <h2>搜索结果：</h2>
<div class="content">
  <div class="content_box">
	<div class="men">
	
<div class="col-md-9">
  <div class="row">
 <c:forEach items="${sp }" var="sp">
			<%-- <div class="col-xs-4" href="javascript:;" onclick="javascript:product(${sp.id});">
                     <div class="col_1_of_single1 span_1_of_single1" style="Float:left">
	    			<a >
				     <img src="<%=path %>/upload/${sp.picture }"style="width:228px;heigth:400px;" />
				     <h3>商品名：${sp.spname}</h3>
				   	 <!-- <p>Duis autem vel eum iriure</p> -->
				   	 <h4>当前价格：￥${sp.maxprice}</h4>
					</a>
			
				</div>
			</div> --%>
			<a href="javascript:;" onclick="javascript:product(${sp.id});">
			  <div class="col-sm-6 col-md-4" >
			    <div class="thumbnail" >
				    <img src="<%=path %>/upload/${sp.picture }" style="width:228px;heigth:400px;">
			      <div class="caption">
			        <h3>商品名：${sp.spname}</h3>
			        <p>当前价格：￥${sp.maxprice}</p>
			      </div>
			    </div>
			  </div>
			</a>
	</c:forEach>

	</div><br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<ul class="pager">
				<c:if test="${pageNum!=0}">
					<li><a href="<%=path %>/sp.Servlet?pageIndex=1&cmd=search&spname=${spname}">首页</a></li>
				</c:if>
				<c:if test="${pageIndex==1}">
					<li><a href="javascript:void(0);">
						上一页
					</a></li>
				</c:if>
				<c:if test="${pageIndex>1}">
					<li><a href="<%=path %>/sp.Servlet?pageIndex=${pageIndex-1 }&cmd=search&spname=${spname} ">
						上一页
					</a></li>
				</c:if>
				<c:if test="${pageIndex==pageNum||pageNum==0}">
						<li><a href="javascript:void(0);">
						下一页
					</a></li>
				</c:if>
				<c:if test="${pageIndex<pageNum}">
						<li><a href="<%=path %>/sp.Servlet?pageIndex=${pageIndex+1 }&cmd=search&spname=${spname}">
						下一页
					</a></li>
				</c:if>
				<c:if test="${pageNum!=0}">
					<li><a href="<%=path %>/sp.Servlet?pageIndex=${pageNum}&cmd=search&spname=${spname}">
						尾页
					</a></li>
				</c:if>
				<c:if test="${pageNum==0}">
					<li><a href="javascript:void(0);">
						尾页
					</a></li>
				</c:if>
				<br>
				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<li>当前第${pageIndex}页，总共${pageNum}页</li>
		
				</ul>
	
<%-- 	  <div class="span_2">
	   <c:forEach items="${sps }" var="sp">
	          	 <div class="col_1_of_single1 span_1_of_single1" style="Float:left">

	    		<a>
				     <img src="/auction/front/picture/${sp.picture }" style="width:228px;heigth:400px;"/>
				     <h3>${sp.spname}</h3>
				   	 <!-- <p>Duis autem vel eum iriure</p> -->
				   	 <h4>${sp.price}</h4>
				</a>
			
				</div>
		
		</c:forEach>
		</div> --%>
		
			</div>
			  </div>
            </div>
        
   

</div>	
</body>
</html>
<script type="text/javascript">
	function product(id){
		
		window.location.href="<%=path %>/sp.Servlet?cmd=spdescribe&id="+id;
	}
</script>