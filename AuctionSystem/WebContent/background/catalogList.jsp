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
 
<div class="page-content clearfix">
    <div id="Member_Ratings">
      <div class="d_Confirm_Order_style">
      	
  		
   
     <!---->
     <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:ovid()" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>添加类别</a>
       </span>
       
     </div>
     <!---->
    
     <div class="table_menu_list">
       <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
				<th >类别ID</th>
				<th >类别名称</th>
				<th >操作</th>
			</tr>
		</thead>
	   <tbody>
	   <c:forEach items="${catalogList }" var="catalogList">
			<tr>
				<td>${catalogList.catalogid}</td>
				<td>${catalogList.catalogname}</td>

				<td class="td-manage"><!-- href="user.Servlet?cmd=getSysuser&id=${sysuser.id}" -->
			
          			<a title="修改" href="javascript:;" onclick="updcatalog(${catalogList.catalogid})"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></a> 
        			<a title="删除" href="<%=path %>/product.Servlet?cmd=delcatalog&catalogid=${catalogList.catalogid}" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120"></i></a>
          		</td>
			</tr>
			</c:forEach>
      </tbody>
	</table>
   </div>
  </div>
 </div>
</div>
		<d:page url="catalogList" servlet="product.Servlet"/>

<!--添加用户图层-->
<div class="add_menber" id="add_menber_style" style="display:none">
	<form action="<%=path %>/product.Servlet" id="addform" method="post">
	<input type="hidden" name="cmd" value="addcatalog"/>
	 	 <div class="form-group col-sm-9">
			<label class="col-sm-3 control-label no-padding-right"
				for="form-field-1"> <span class="red">*</span>类别名称： </label>
			<div class="col-sm-9">
				<input   class="formItem col-xs-5"  name="catalogname"	 type="text"  ></input>
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

  function updcatalog(id){
	  index = layer.open({
	        type: 2,
	        title: '修改类别',
			maxmin: true, 
			shadeClose: true, //点击遮罩关闭层、
			 area : ['300px' , '200px'],
	        content:'<%=path%>/product.Servlet?cmd=findcatalog&catalogid='+id,
	        end: function () {
                location.reload();
            }
	  }); 
  }

  laydate({
	    elem: '#date',
	    event: 'focus' 
	});

</script>