<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String path = request.getContextPath();
    %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>反馈留言</title>
<style type="text/css">
.Validform_checktip{ font:bold 16px 宋体  red;background:#FFFFFF; }
</style>
</head>
<body>
<jsp:include page="head.jsp"/>
<c:if test="${userid!=null }">
<div class="content">
  <div class="content_box">
	<div class="men">
	 <div class="account-in">
							<h2>反馈留言</h2>
							<div class="col-md-7 account-top">
							  <form action="<%=path %>/guestbook.Servlet" method="post" class="demoform">
								<input type="hidden" name="cmd" value="msg"/>
								<div> 	
									<span>标题*</span>
									<input type="text" name="title" placeholder="请输入标题"   
										datatype="*1-50"  nullmsg="标题不能为空！" errormsg="请输入1-50个字符！"> 
								</div>
								<div> 
									<span class="pass">内容*</span>
									<textarea rows="10" cols="88" name="content" placeholder="请输入内容"  type="text"   nullmsg="内容不能为空！"datatype="*1-500" errormsg="请输入1-500个字符！"></textarea>
								</div>				
									<input type="submit" value="提交"> 
							   </form>
							</div>
							
						<div class="clearfix"> </div>
					</div>
    </div>	
</c:if>
<c:if test="${userid==null }">
<div class="alert alert-success">请先登录</div>
</c:if>
<script type="text/javascript">
$(".demoform").Validform({tiptype:function(msg,o,cssctl){
	if(o.type!=2){
		layer.tips(msg,o.obj);
	}
}


});
/* $(".demoform").Validform({
	tiptype: function (msg, o, cssctl) {
        if (o.type == 3) {//失败
        	//o.obj.after("<span style='color:red'>"+msg+"</span>");
             layer.tips(msg, o.obj, {
                tips: [1, 'red'],
                time: 3000
            }); 
            $(window).scrollTop(o.obj.offset().top - 40);
        }
    },
    datatype: {//自定义验证类型
        "select": function (gets, obj, curform, regxp) {
            if (gets == "") {
                return false;
            } else {
                return true;
            }
        }
    },
    ignoreHidden: true,
    tipSweep: true, //若为true，则只在表单提交时验证
    ajaxPost: true, //异步提交
    beforeCheck: function (curform) {
    },
    beforeSubmit: function (curform) {
        
    },
    callback: function (data) {//异步回调函数
        if (data) {
            var index = layer.alert(data.Message, function () {
                if (data.Success) {
                    location.href = "Index";
                } else {
                    layer.close(index);
                }
            });

        }
    }
	}); */
	
		/* {tiptype:function(msg,o,cssctl){
	if(o.type!=2){
		layer.tips(msg,o.obj,{
			  tips: 1
		});
	} */ 


</script>
</body>
</html>