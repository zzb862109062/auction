package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import javax.servlet.http.Part;

import org.apache.catalina.core.ApplicationPart;

import bean.Catalog;
import dao.ProductsDao;
import dao.SpDao;

@MultipartConfig(location = "d://")
public class productServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ProductsDao productsDao = new ProductsDao();
	SpDao spDao = new SpDao();

	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String cmd = request.getParameter("cmd");
		if("catalogList".equals(cmd)){
			catalogList(request,response);
		}else if("homepage".equals(cmd)){
			homepage(request,response);
		}else if("addcatalog".equals(cmd)){
			addcatalog(request,response);
		}else if("findcatalog".equals(cmd)){
			findcatalog(request,response);
		}else if("updcatalog".equals(cmd)){
			updcatalog(request,response);
		}else if("delcatalog".equals(cmd)){
			delcatalog(request,response);
		}else if("productList".equals(cmd)){
			productList(request,response);
		}else if("addproduct".equals(cmd)){
			addproduct(request,response);
		}else if("findproduct".equals(cmd)){
			findproduct(request,response);
		}else if("delproduct".equals(cmd)){
			delproduct(request,response);
		}else if("updproduct".equals(cmd)){
			updproduct(request,response);
		}
	}
	
	private void updproduct(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		String path = this.getServletContext().getRealPath("/");
		Part p = request.getPart("picture");
		if(p.getSize()>0){
			if (p.getContentType().contains("image")) {
				ApplicationPart ap = (ApplicationPart) p;
				//字符串处理得到文件名
				String fname1 = ap.getSubmittedFileName();
				int path_idx = fname1.lastIndexOf("\\") + 1;
				String fname2 = fname1.substring(path_idx, fname1.length());
				//后缀名
				String attr = fname2.substring(fname2.lastIndexOf("."));
				//uuid
				String fileName = UUID.randomUUID().toString().replace("-", "")+attr ;
				System.out.println(fileName);
				File file = new File(path + "/upload/");
				//判断文件夹是否存在
				if(!file.exists() && !file.isDirectory()){
					file.mkdir();
				}
				p.write(path + "/upload/" + fileName);
				System.out.println(path + "/upload/" + fileName);
				
				int id = Integer.parseInt(request.getParameter("id"));
				int catalogid = Integer.parseInt(request.getParameter("catalogid"));
				String spname = request.getParameter("spname");
				String price = request.getParameter("price");
				String maxprice = request.getParameter("maxprice")==null?price:request.getParameter("maxprice");
				System.out.println("max:"+maxprice);
				String description = request.getParameter("description");
				productsDao.updproduct(id, catalogid, spname, description, maxprice, fileName);
				PrintWriter pw = response.getWriter();
				pw.write("<script>window.parent.layer.close(window.parent.index);</script>");
				pw.flush();
				pw.close();
			}
	}else{
		int id = Integer.parseInt(request.getParameter("id"));
		int catalogid = Integer.parseInt(request.getParameter("catalogid"));
		String spname = request.getParameter("spname");
		String maxprice = request.getParameter("maxprice");
		String description = request.getParameter("description");
		String picture=request.getParameter("picture2");
		productsDao.updproduct(id, catalogid, spname, description, maxprice, picture);
		PrintWriter pw = response.getWriter();
		pw.write("<script>window.parent.layer.close(window.parent.index);</script>");
		pw.flush();
		pw.close();
}
}

	private void delproduct(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		productsDao.delproduct(id);
		request.getRequestDispatcher("product.Servlet?cmd=productList").forward(request, response);
	}

	private void findproduct(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		List findproduct = productsDao.findproduct(id);
		request.setAttribute("product", findproduct.get(0));
		request.setAttribute("id", id);
		  List<Catalog> allCatalog = productsDao.allCatalog();
		 request.setAttribute("allCatalog", allCatalog);
		request.getRequestDispatcher("background/updProduct.jsp").forward(request, response);
		
	}
	private void addproduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String path = this.getServletContext().getRealPath("/");
		Part p = request.getPart("picture");
		if (p.getContentType().contains("image")) {
			ApplicationPart ap = (ApplicationPart) p;
			//字符串处理得到文件名
			String fname1 = ap.getSubmittedFileName();
			int path_idx = fname1.lastIndexOf("\\") + 1;
			String fname2 = fname1.substring(path_idx, fname1.length());
			//后缀名
			String attr = fname2.substring(fname2.lastIndexOf("."));
			//uuid
			String fileName = UUID.randomUUID().toString().replace("-", "")+attr ;
			System.out.println(fileName);
			File file = new File(path + "/upload/");
			//判断文件夹是否存在
			if(!file.exists() && !file.isDirectory()){
				file.mkdir();
			}
			p.write(path + "/upload/" + fileName);
			System.out.println(path + "/upload/" + fileName);
			
			
			int catalogid = Integer.parseInt(request.getParameter("catalogid"));
			String spname = request.getParameter("spname");
			String price = request.getParameter("price");
			String maxprice = request.getParameter("maxprice")==null?price:request.getParameter("maxprice");
			System.out.println("max:"+maxprice);
			String description = request.getParameter("description");
			spDao.addsp(catalogid, spname, description,price,maxprice, fileName);
			
			request.getRequestDispatcher("product.Servlet?cmd=productList").forward(request, response);
		}
	}
	/**
	 * 商品列表
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void productList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 int pageIndex = request.getParameter("pageIndex")==null?1:Integer.parseInt(request.getParameter("pageIndex"));
		 int pageCount = (int)productsDao.countSp();
		  int pageNum = pageCount%5==0?pageCount/5:pageCount/5+1;
		  List sp = productsDao.findSp(pageIndex);
		  List<Catalog> allCatalog = productsDao.allCatalog();
		 request.setAttribute("allCatalog", allCatalog);
		  request.setAttribute("spList", sp);
		  request.setAttribute("pageIndex", pageIndex);
		  request.setAttribute("pageCount", pageCount);
		  request.setAttribute("pageNum", pageNum);
		  request.getRequestDispatcher("background/productList.jsp").forward(request, response);
	}
		/**
		 * 删除类别
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 */
	private void delcatalog(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("catalogid"));
		productsDao.delcatalog(id);
		request.getRequestDispatcher("product.Servlet?cmd=catalogList").forward(request, response);
	}
	/**
	 * 修改类别
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void updcatalog(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("catalogname");
		int id = Integer.parseInt(request.getParameter("catalogid"));
		productsDao.updcatalog(name, id);
		PrintWriter pw = response.getWriter();
		pw.write("<script>window.parent.layer.close(window.parent.index);</script>");
		pw.flush();
		pw.close();
	}
	/**
	 * 查找类别
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void findcatalog(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("catalogid"));
		String catalogname = productsDao.findcatalog(id);
		request.setAttribute("catalogname", catalogname);
		request.setAttribute("catalogid", id);
		request.getRequestDispatcher("background/updCatalog.jsp").forward(request, response);
	}
	/**
	 * 添加类别
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void addcatalog(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		productsDao.addcatalog(request.getParameter("catalogname"));
		request.getRequestDispatcher("product.Servlet?cmd=catalogList").forward(request, response);
	}


	private void homepage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Catalog> allCatalog = productsDao.allCatalog();
		request.setAttribute("allCatalog", allCatalog);
		request.getRequestDispatcher("front/homePage.jsp").forward(request, response);
	}

	private void catalogList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	  int pageIndex = request.getParameter("pageIndex")==null?1:Integer.parseInt(request.getParameter("pageIndex"));
	  int pageCount = (int)productsDao.countCatalog();
	  int pageNum = pageCount%5==0?pageCount/5:pageCount/5+1;
	  List<Catalog> list = productsDao.findCatalog(pageIndex);
	  request.setAttribute("catalogList", list);
	  request.setAttribute("pageIndex", pageIndex);
	  request.setAttribute("pageCount", pageCount);
	  request.setAttribute("pageNum", pageNum);
	  request.getRequestDispatcher("background/catalogList.jsp").forward(request, response);
	}
	
}
