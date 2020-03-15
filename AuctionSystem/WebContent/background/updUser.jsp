<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%String path = request.getContextPath(); %>
 <%@ taglib prefix="d" uri="/WEB-INF/page.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<jsp:include page="include.jsp" />
        
<title>类别列表</title>
</head>

<body>

<!--添加用户图层-->
<div class="add_menber" id="add_menber_style" >
	<form action="<%=path %>/user.Servlet" id="addform" method="post">
	<input type="hidden" name="cmd" value="upduser"/>
	<input type="hidden" name="userid" value="${userid }"/>
	    <ul class=" page-content">
	      <li><label class="label_name">用户名：</label><span class="add_name"><input value="${user.username}" name="username" type="text"  class="text_add" readonly/></span><div class="prompt r_f"></div></li>
	      <li><label class="label_name">密码：</label><span class="add_name"><input value="${user.password}" name="password" type="password"  class="text_add"/></span><div class="prompt r_f"></div></li>
	       <li><label class="label_name">地址：</label><span class="add_name"><input value="${user.adress}" name="adress" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
	        <li><label class="label_name">电话：</label><span class="add_name"><input value="${user.phone}" name="phone" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
	         <li><label class="label_name">性别：</label></span>
	         <input name="usersex" type="radio" ${user.usersex=="男"?"checked=\"checked\"":""}   value="男">男
                             &nbsp;&nbsp;&nbsp; <input name="usersex" type="radio" ${user.usersex=="女"?"checked=\"checked\"":""}   value="女">女</li>
	 	 </ul>
	 	 <br /><br /><br /><br /><br /> <br /><br /><br /><br /><br />
	 	  <div class="clearfix cl">
			<div class="Button_operation">
				<button  class="btn btn-primary radius" type="submit"><i class="icon-save "></i>修改</button>
				<button  class="btn btn-default radius" type="button"onclick="javascript:closeWindow();">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
      </form>
 </div>
</body>
</html>
<script>
jQuery(function($) {
/*用户-添加*/
 $('#member_add').on('click', function(){
    layer.open({
        type: 1,
        title: '添加类别',
		maxmin: true, 
		shadeClose: true, //点击遮罩关闭层
        area : ['800px' , ''],
        content:$('#add_menber_style'),
		btn:['提交','取消'],
		yes:function(index,layero){	
		    $("#addform").submit();
			}
   		 });
 	});
/*  user.Servlet?cmd=chekStatus&id=${sysuser.id}&status=${sysuser.status} */

	
});

  function updSysuser(id){
	  upduser = layer.open({
	        type: 2,
	        title: '修改系统用户',
			maxmin: true, 
			shadeClose: true, //点击遮罩关闭层
			 area : ['800px' , '400px'],
	        content:'<%=path%>/user/getSysuserByid.do?id='+id,
	        end: function () {
                location.reload();
            }
	  }); 
  }

  laydate({
	    elem: '#date',
	    event: 'focus' 
	});

  function closeWindow(){
  	window.parent.layer.close(window.parent.index);
  }

</script>