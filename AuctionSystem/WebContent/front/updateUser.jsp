<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改</title>

<script type="text/javascript" src="../jquery/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" type="text/css"></link>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script></head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="content">
  <div class="content_box">
	<div class="men">
	 <div class="register">
	 	
		  	  <form action="user.Servlet" method="post" > 
		  	  <input type="hidden" name="cmd" value="updUser"/>
		  	   <input type="hidden" name="userid" value="${user.userid }"/>
				 <div class="register-top-grid">
					
					 <div>
						<span>账号<label>*</label></span>
						<input type="text"name="username"id="username"
						 value="${user.username }" readonly/> 
					 </div>
					 <div>
						<span>密码<label>*</label></span>
						<input type="password"name="password"id="password" 
						value="${user.password }"/> 
					 </div>
					 <div>
						 <span>住址<label>*</label></span>
						 <input type="text"name="adress"id="adress" 
						  value="${user.adress }" /> 
					 </div>
					  <div>
						<span>电话<label>*</label></span>
						<input type="text"name="phone"id="phone"
						 value="${user.phone }" /> 
					 </div>
					  <div>
						 <span>性别<label>*</label></span>
						 
							<input name="usersex" type="radio" ${user.usersex=="男"?"checked=\"checked\"":""}   value="男">男
                             &nbsp;&nbsp;&nbsp; <input name="usersex" type="radio" ${user.usersex=="女"?"checked=\"checked\"":""}   value="女">女
                         
					 </div>
					 <div class="clearfix"> </div>
					 </div>
			
				<div class="clearfix"> </div>
				<div class="register-but">
				 
					   <input type="submit" value="修改"class="btn btn-info"style="width:84px;heigth:35px;">
					   <div class="clearfix"> </div>
					</div>
				   </form>
				  
		   </div>
    </div>
    </div>
    </div>

</body>
</html>		