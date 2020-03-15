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
</head>
<body>
<jsp:include page="head.jsp"/>
<div class="content">
  <div class="content_box">
	<div class="men">
	  <div class="col-md-3 sidebar">
	  	<div class="block block-layered-nav">
		    <div class="block-title" style="width:80px">
		        <strong><span>商品分类</span></strong>
		    </div>
    <div class="block-content">
                                    
      <dl id="narrow-by-list">
      <c:forEach items="${allCatalog }" var="catalog">
 		<a class="odd" href="<%=path %>/sp.Servlet?cmd=findSpByID&cid=${catalog.catalogid}">${catalog.catalogname}</a>
                    <dd class="odd">
                    </dd>
	</c:forEach>
    </dl>
           
       </div>
</div>

</div>

             <div class="col-md-9 banner_right" style="width:900px;height:500px;">
			 <!-- FlexSlider -->
			 		<%-- <a href="<%=path %>/sp.Servlet?cmd=spdescribe&id=36">
					 <img id="showpic"  src="<%=path%>/front/images/banner5.jpg" alt="banner5" height="400" width="900"> 
 					</a> --%>
 					 <section class="slider">
				  <div class="flexslider" >
					<ul class="slides">
						<li><a href="<%=path%>/sp.Servlet?cmd=spdescribe&id=64"><img style="width:900px;height:400px;" src="<%=path %>/front/images/banner7.jpg" alt=""/></a></li>
						<li><a href="<%=path%>/sp.Servlet?cmd=spdescribe&id=65"><img style="width:900px;height:400px;" src="<%=path %>/front/images/banner8.jpg" alt=""/></a></li>
						<li><a href="<%=path%>/sp.Servlet?cmd=spdescribe&id=63"><img style="width:900px;height:400px;" src="<%=path %>/front/images/banner6.jpg" alt=""/></a></li> 
						<li><a href="<%=path%>/sp.Servlet?cmd=spdescribe&id=55"><img style="width:900px;height:400px;" src="<%=path %>/front/images/banner5.jpg" alt=""/></a></li> 
					</ul>
				  </div>
	         	 </section>
              <!-- FlexSlider -->
              
				</div> 
			  </div>
            </div>
 
</div>			


<script type="text/javascript">
$(function(){
	  SyntaxHighlighter.all();
	});
	$(window).load(function(){
	  $('.flexslider').flexslider({
		animation: "slide",
		start: function(slider){
		  $('body').removeClass('loading');
		}
	  });
	});
	
<%-- 		var curIndex=0;
		//时间间隔 单位毫秒
		var timeInterval=1000;
		var arr=new Array();
		arr[0]="banner2.jpg";
		arr[1]="banner3.jpg";
		arr[2]="banner4.jpg";
		setInterval(changeImg,timeInterval);
		function changeImg()
		{
			var obj=document.getElementById("showpic");
			if (curIndex==arr.length-1)
			{
				curIndex=0;
			}
			else
			{
				curIndex+=1;
			}
			obj.src="<%=path%>/front/images/"+arr[curIndex];
		}  --%>
 </script>
</body>
</html>	
