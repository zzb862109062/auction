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
      	
  		
   
     <!---->
 
     <!---->
    
     <div class="table_menu_list">
       <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
		 		<th >ID</th>
				<th >用户ID</th>
				<th >用户名</th>
				<th >标题</th>
				<th >内容</th>
				<th >创建时间</th>
				<th >操作</th>
			</tr>
		</thead>
	   <tbody>
	   <c:forEach items="${list }" var="guestbook">
			<tr>
				<td>${guestbook.id}</td>
				<td>${guestbook.userid}</td>
				<td>${guestbook.username}</td>
				<td>${guestbook.title}</td>
				<td>${guestbook.content}</td>
				<td>${guestbook.createtime}</td>
				<td class="td-manage"><!-- href="user.Servlet?cmd=getSysuser&id=${sysuser.id}" -->
			
        			<a title="删除" href="<%=path %>/guestbook.Servlet?cmd=delguestbook&id=${guestbook.id}" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120"></i></a>
          		</td>
			</tr>
			</c:forEach>
      </tbody>
	</table>
   </div>
  </div>
 </div>
</div>
			<d:page url="guestbook" servlet="guestbook.Servlet"/>

<!--添加用户图层-->
<div class="add_menber" id="add_menber_style" style="display:none">
	<form action="<%=path %>/product.Servlet" id="addformaddform" method="post" enctype="multipart/form-data">
	<input type="hidden" name="cmd" value="addproduct"/>
	    <ul class=" page-content">
	      <li><label class="label_name">类别名称：</label><span class="add_name">
	      	<select name="catalogid">
	      		<c:forEach items="${allCatalog}" var="catalog">
	      			<option value="${catalog.catalogid }">${catalog.catalogname }</option>
	      		</c:forEach>
	      	</select>
	      	</span><div class="prompt r_f"></div></li>
	      <li><label class="label_name">商品名称：</label><span class="add_name"><input  name="spname" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
	      <li><label class="label_name">商品描述：</label><span class="add_name"><input  name="description" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
	      <li><label class="label_name">价格：</label><span class="add_name"><input  name="price" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
	      <li><label class="label_name">图片：</label><span class="add_name"><input  name="picture" type="file"  class="text_add"/></span><div class="prompt r_f"></div></li>
	 	 </ul>
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

 function picture(logo){
	 layer.open({
        type: 2,
        title: false,
		maxmin: true, 
		area: ['430px', '400px'],
        shade: 0.8,
        shadeClose: true,
        content:'<%=basePath%>upload/'+logo
   		 }); 

}


  function updcatalog(id){
	  upduser = layer.open({
	        type: 2,
	        title: '修改类别',
			maxmin: true, 
			shadeClose: true, //点击遮罩关闭层、
			 area : ['500px' , '400px'],
	        content:'<%=path%>/product.Servlet?cmd=findcatalog&catalogid='+id,
	        end: function () {
                location.reload();
            }
	  }); 
  }



</script>