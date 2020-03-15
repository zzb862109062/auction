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
	<form action="<%=path %>/product.Servlet" id="addformaddform" method="post" enctype="multipart/form-data">
	<input type="hidden" name="cmd" value="updproduct"/>
	<input type="hidden" name="id" value="${id }"/>
	<input type="hidden" name="picture2" value="${product.picture }"/>
	    <ul class=" page-content">
	      <li><label class="label_name">类别名称：</label><span class="add_name">
	      	<select name="catalogid">
	      		<c:forEach items="${allCatalog}" var="catalog">
	      			<option value="${catalog.catalogid}" name="catalogid">${catalog.catalogname }</option>
	      		</c:forEach>
	      	</select>
	      	</span><div class="prompt r_f"></div></li>
	      <li><label class="label_name">商品名称：</label><span class="add_name"><input value="${product.spname }" name="spname" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
	      <li><label class="label_name">商品描述：</label><span class="add_name"><input value="${product.description }" name="description" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
	      <li><label class="label_name">拍卖价格：</label><span class="add_name"><input value="${product.maxprice }" name="maxprice" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
	      <li><label class="label_name">图片：</label><span class="add_name"><input name="picture" type="file"  class="text_add"/></span><div class="prompt r_f"></div></li>
	 	 </ul>
	 	 <br /><br /><br /><br /><br /><br /><br /><br />
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
	selectcatalog();
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
  

	

	function selectcatalog(){
		
		 var catalogid = ${product.catalogid};
		$("option[value='"+catalogid+"']").attr("selected",true); 
	}
</script>