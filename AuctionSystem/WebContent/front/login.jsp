<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Login</title>
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


<script type="text/javascript" src="jquery/jquery-3.1.1.min.js"></script></head>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<body>
<jsp:include page="head.jsp"/>
<div class="content">
  <div class="content_box">
	<div class="men">
	 <div class="account-in">
							<h2>登录</h2>
							<div class="col-md-7 account-top">
							  <form action="<%=path %>/user.Servlet" method="post">
								<input type="hidden" name="cmd" value="login"/>
								<div> 	
									<span>账号*</span>
									<input type="text"name="username" id="username" > 
								</div>
								<div> 
									<span class="pass">密码*</span>
									<input type="password"name="password" id="password" >
								</div>				
									<input type="submit" value="Login"> 
							   </form>
							</div>
							<div class="col-md-5 left-account ">
								<a href="javascript:void(0);"><img class="img-responsive " src="images/login.jpg" alt=""></a>
								<div class="five-in">
								<h1>25% </h1><span>discount</span>
								</div>
								<a href="register.jsp" class="create">Create an account</a>
								<div class="clearfix"> </div>
							</div>
						<div class="clearfix"> </div>
					</div>
    </div>	
</body>
</html>		

<script type="text/javascript">
	 //sumbit验证
	 function checksubmit(){
		 return (checkname() && checkpassword());
		 }
	//验证账号
	 function checkname(){
		var length = document.getElementById("username").value.length;
		if(length>=3 && length<=15){
			document.getElementById("span").innerHTML = "";
			return true;
		}else{
			document.getElementById("span").innerHTML = "请输入3-15位的账号"
			return false;
		}
		}
		//验证密码
	 function checkpassword(){
		 var length = document.getElementById("password").value.length;
		if(length>=3 && length<=15){
			document.getElementById("span2").innerHTML = "";
			return true;
		}else{
			document.getElementById("span2").innerHTML = "请输入3-15位的密码"
			return false;
		}
		
		
	}
</script>