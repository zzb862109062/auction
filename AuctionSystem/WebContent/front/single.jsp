<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Single</title>
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
<link rel="stylesheet" href="css/etalage.css">
<script src="js/jquery.etalage.min.js"></script>
<script>
			
		</script>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
</head>
<body>
<jsp:include page="head.jsp"/>
<div class="content">
  <div class="content_box">
	<div class="men">
	  <div class="single_top">
	       <div class="col-md-9 single_right">
	   	       <div class="grid images_3_of_2">
						<ul id="etalage">
							<li>
								<a >
									<img class="etalage_thumb_image" src="<%=path %>/upload/${sp.picture }"style="width:303px;heigth:400px;" class="img-responsive" />

								</a>
							</li>
						</ul>
						 <div class="clearfix"></div>	
				  </div> 
				  <div class="desc1 span_3_of_2">
				    <p class="m_5"> 商品名：${sp.spname }</p>
				     <p class="m_5"> 商品描述：${sp.description }</p>
				    <h1>原价：￥ ${sp.price}</h1>
					<h1>当前竞拍价格：￥ ${sp.maxprice}</h1>
					<br><br>
					<div style="color:red;"> <span id="t_d"  style="font-size:15px">00天</span>
    					     <span id="t_h" style="font-size:15px">00时</span>
   							<span id="t_m" style="font-size:15px">00分</span>
    						<span id="t_s" style="font-size:20px">00秒</span>
    						<div id="show" style="display:none ;font-size:25px;">已结束竞拍</div>
						</div>
						<form action="sp.Servlet" id="jpfrom" onsubmit="javascript:return checksubmit()">
						<input type="hidden"  name="cmd" value="bid"/>
						<input type="hidden" name="spid" value="${sp.id }"/>
						<input type="hidden" name="spname" value="${sp.spname }"/>
						<h1>请输入竞拍价格 ￥</h1>
							<input id="pricetext" type="text" 
			                  	name="maxprice" onblur="javascript:checkprice();"/> 
					 <p id="msg" class="m_text2" style="color:red;"></p>
				
				   <div class="btn_form">
						
							<input style="width:100px;heigth:30px;" type="submit" value="竞拍" title="" id = "jingpai"class="btn btn-danger">
					 </div>
						</form>
				  </div>
				  <div class="clearfix"></div>	
       </div>
      <div class="clearfix"> </div>
     </div>
       </div>
     </div>
   </div>
</div>	
<link href="css/flexslider.css" rel='stylesheet' type='text/css' />
 <script defer src="js/jquery.flexslider.js"></script>
<script type="text/javascript">
		//submit
		function checksubmit(){
			return checkprice();
		}
		//验证价格
		function checkprice(){
			var price =  ${sp.maxprice};
			if($("#pricetext").val()> price){
				document.getElementById("msg").innerHTML = "";
				return true;
			}else{
				document.getElementById("msg").innerHTML = "价格要大于当前竞拍价格(*＾-＾*)";
				return false;
			}
		}
							  
	  
	  //倒计时
	  function GetRTime(){
		    var EndTime= new Date('2018/01/05 10:33:00');
		    var NowTime = new Date();
		    var t =EndTime.getTime() - NowTime.getTime();
		    var d=0;
		    var h=0;
		    var m=0;
		    var s=0;
		    
		    if(t>0){
		      d=Math.floor(t/1000/60/60/24);
		      h=Math.floor(t/1000/60/60%24);
		      m=Math.floor(t/1000/60%60);
		      s=Math.floor(t/1000%60);
		    $("#t_d").text("倒计时："+d + "天");
		    $("#t_h").text(h + "时");
		    $("#t_m").text(m + "分");
		  	 $("#t_s").text(s + "秒");
		    }
		   
		     if(t<0){
		 	document.getElementById("t_d").style.display = "none"; 
		 	document.getElementById("t_h").style.display = "none"; 
		 	document.getElementById("t_m").style.display = "none"; 
		 	document.getElementById("t_s").style.display = "none"; 
		 	document.getElementById("show").style.display = ""; 
		 	document.getElementById("pricetext").readOnly = true; 
		 	document.getElementById("pricetext").disabled = true;
		 	document.getElementById("jpfrom").style.display = "none";
		 	}
		   if(-1000<t&&t<-1){
		 		window.location.href="<%=path%>/sp.Servlet?cmd=addcart" ;
		 	}
		  }
		  var interval = setInterval(GetRTime,1000);
</script>
</body>
</html>		