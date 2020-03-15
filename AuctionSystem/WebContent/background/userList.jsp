<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%String path = request.getContextPath(); 
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
 %>
 <%@ taglib prefix="d" uri="/WEB-INF/page.tld" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<jsp:include page="include.jsp" />
        
<title>商品列表</title>
</head>

<body>
 
<div class="page-content clearfix">
    <div id="Member_Ratings">
      <div class="d_Confirm_Order_style">
      	
  		
   
     <!---->

     <!---->
    
     <div class="table_menu_list">
       <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
		 		<th >ID</th>
				<th >用户名</th>
				<th >地址</th>
				<th >电话</th>
				<th >性别</th>
				<th >操作</th>
			</tr>
		</thead>
	   <tbody>
	   <c:forEach items="${userlist }" var="user">
			<tr>
				<td>${user.userid}</td>
				<td>${user.username}</td>
				<td>${user.adress}</td>
				<td>${user.phone}</td>
				<td>${user.usersex}</td>
				<td class="td-manage"><!-- href="user.Servlet?cmd=getSysuser&id=${sysuser.id}" -->
			
          			<a title="修改" href="javascript:;" onclick="upduser('${user.userid}')"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></a> 
        			<a title="删除" href="<%=path %>/user.Servlet?cmd=deluser&userid=${user.userid}" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120"></i></a>
          		</td>
			</tr>
			</c:forEach>
      </tbody>
	</table>
   </div>
  </div>
 </div>
</div>
			<d:page url="userList" servlet="user.Servlet"/>

<!--添加用户图层-->

</body>
</html>
<script>
jQuery(function($) {
/*用户-添加*/
 $('#member_add').on('click', function(){
    layer.open({
        type: 1,
        title: '添加商品',
		maxmin: true, 
		shadeClose: true, //点击遮罩关闭层
        area : ['800px' , ''],
        content:$('#add_menber_style'),
		btn:['提交','取消'],
		yes:function(index,layero){	
		    $("#addformaddform").submit();
			}
   		 });
 	});
});
/*  user.Servlet?cmd=chekStatus&id=${sysuser.id}&status=${sysuser.status} */




  function upduser(id){
	  index = layer.open({
	        type: 2,
	        title: '修改用户',
			maxmin: true, 
			shadeClose: true, //点击遮罩关闭层、
			 area : ['500px' , '400px'],
	        content:'<%=path%>/user.Servlet?cmd=findUserById&userid='+id,
	        end: function () {
                location.reload();
            }
	  }); 
  }



</script>