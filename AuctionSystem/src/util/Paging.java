package util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class Paging extends TagSupport{
	private String url;
	private String servlet;
	@Override
	public int doEndTag() throws JspException {
		JspWriter out = pageContext.getOut();
		HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		//当前页码
		int pageIndex = Integer.parseInt(request.getAttribute("pageIndex").toString());
		//总记录数
		int pageCount = Integer.parseInt(request.getAttribute("pageCount").toString());
		//总页数
		int pageNum = Integer.parseInt(request.getAttribute("pageNum").toString());
		String path = request.getContextPath();
		try {
			if(pageCount!=0){
					out.write("<div class=\"row\">");
					out.write("<div class=\"col-sm-6\">");
					out.write("<div class=\"dataTables_info\" id=\"sample-table_info\" role=\"status\" aria-live=\"polite\">");
					out.write("第 "+((pageCount==0?0:(pageIndex-1)*5+1)+" 到"+ (pageIndex*5>pageCount?pageCount:pageIndex*5)+"条记录，共"+pageCount+"条</div>"));
					out.write("</div>");
					out.write("<div class=\"col-sm-6\">");
					out.write("<div class=\"dataTables_paginate paging_bootstrap\" id=\"sample-table_paginate\">");
					out.write("<ul class=\"pagination\">");
					if(pageNum!=0){
					out.write("<li class=\"prev\"><a href=\""+path+"/"+servlet+"?pageIndex=1&cmd="+url+"\">首页</a></li>");
					}else{
						out.write("<li class=\"prev disabled\"><a href=\"javascript:void(0);\">首页</a></li>");
					}
					
					//判断有无上一页
					if(pageIndex==1){
						out.write("<li class=\"prev disabled\"><a href=\"javascript:void(0);\">上一页</a></li>");
					}else{
						out.write("<li class=\"prev\"><a href=\""+path+"/"+servlet+"?pageIndex="+(pageIndex-1)+"&cmd="+url+"\">上一页</a></li>");
					}
					
					
					out.write("<li class=\"active\"><a>"+(pageNum==0?"无数据":pageIndex)+"</a> </li>");
					
					out.write(" <li ><a>共"+pageNum+"页</a></li>");
					
					//判断有无下一页
					if(pageIndex==pageNum||pageNum==0){
						out.write("<li class=\"next disabled\"><a href=\"javascript:void(0);\">下一页</a></li>");
					}else{
						out.write("<li class=\"next\"><a href=\""+path+"/"+servlet+"?pageIndex="+(pageIndex+1)+"&cmd="+url+"\");$('#pageForm').submit();\">下一页</a></li>");
					}
					
					if(pageNum!=0){
					out.write("<li class=\"prev\"><a href=\""+path+"/"+servlet+"?pageIndex="+pageNum+"&cmd="+url+"\">尾页</a></li>");
					}else{
						out.write("<li class=\"prev disabled\"><a href=\"javascript:void(0);\">尾页</a></li>");
					}
					out.write("</ul>");
					out.write("</div>");
					out.write("</div>");
					out.write("</div>");
			}else{
				out.write("<div class=\"dataTables_info\" id=\"sample-table_info\" role=\"status\" aria-live=\"polite\">");
				out.write("无数据 "+"</div>");
				
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
		}
		return EVAL_PAGE;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getServlet() {
		return servlet;
	}

	public void setServlet(String servlet) {
		this.servlet = servlet;
	}


	
}
