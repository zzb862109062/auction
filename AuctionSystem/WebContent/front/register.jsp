<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Register</title>

<script type="text/javascript" src="../jquery/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" type="text/css"></link>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script></head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="content">
  <div class="content_box">
	<div class="men">
	 <div class="register">
		  	  <form action="<%=path %>/user.Servlet" method="post"> 
		  	  <input type="hidden" name="cmd" value="adduser"/>
				 <div class="register-top-grid">
					<h1>注册</h1>
					 <div>
						<span>账号<label>*</label></span>
						<input type="text"name="username"id="username"> 
					 </div>
					 <div>
						<span>密码<label>*</label></span>
						<input type="password"name="password"id="password" > 
					 </div>
					 <div>
						 <span>住址<label>*</label></span>
						 <input type="text"name="adress"id="adress" > 
					 </div>
					  <div>
						<span>电话<label>*</label></span>
						<input type="text"name="phone"id="phone"> 
					 </div>
					  <div>
						 <span>性别<label>*</label></span>
						 <select name="usersex"  id="usersex" style="width:150px;heigth:30px">
                                   <option value="男" >男</option>
                                   <option value="女" >女</option>
                            </select>
					 </div>
					 <div class="clearfix"> </div>
					 </div>
			
				<div class="clearfix"> </div>
				<div class="register-but">
				 
					   <input type="submit" value="注册"class="btn btn-danger"style="width:84px;heigth:35px;">
					   <div class="clearfix"> </div>
				</div>
				   </form>
		   </div>
    </div>
    </div>
    </div>
</body>
</html>		