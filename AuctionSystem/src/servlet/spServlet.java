package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.catalina.core.ApplicationPart;

import bean.Cart;
import bean.Catalog;
import bean.Sp;
import bean.User;
import bean.orders;
import dao.ProductsDao;
import dao.SpDao;
import util.Global;
import bean.bidrecord;
import bean.orders;
@MultipartConfig(location = "d://")
public class spServlet extends HttpServlet{
		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
		SpDao spDao = new SpDao();
		ProductsDao productsDao = new ProductsDao();
		@Override
		protected void service(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			// TODO Auto-generated method stub
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			String cmd=request.getParameter("cmd");
			if("findSpByID".equals(cmd)){
				findSpByID(request,response);
			}else if("addsp".equals(cmd)){
				addsp(request,response);
			}else if("spdescribe".equals(cmd)){
				spdescribe(request,response);
			}else if("bid".equals(cmd)){
				bid(request,response);
			}else if("addcart".equals(cmd)){
				addcart(request,response);
			}else if("cart".equals(cmd)){
				cart(request,response);
			}else if("addOrder".equals(cmd)){
				addOrder(request,response);
			}else if("delcart".equals(cmd)){
				delcart(request,response);
			}else if("search".equals(cmd)){
				search(request,response);
			}else if("findCatalog".equals(cmd)){
				findCatalog(request,response);
			}else if("bidrecord".equals(cmd)){
				bidrecord(request,response);
			}else if("orderList".equals(cmd)){
				orderList(request,response);
			}
		}
	
		private void orderList(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			int pageIndex = request.getParameter("pageIndex")==null?1:Integer.parseInt(request.getParameter("pageIndex"));
			List<orders> list = productsDao.orderList(pageIndex);
			int pageCount = (int)productsDao.orderCount();
			int pageNum = pageCount%5==0?pageCount/5:pageCount/5+1;
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("pageIndex", pageIndex);
			request.setAttribute("orderlist", list);
			request.getRequestDispatcher("background/orderList.jsp").forward(request, response);
		}

		private void bidrecord(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			int pageIndex = request.getParameter("pageIndex")==null?1:Integer.parseInt(request.getParameter("pageIndex"));
			List<bidrecord> list = productsDao.bidrecordList(pageIndex);
			int pageCount = (int)productsDao.bidrecordCount();
			int pageNum = pageCount%5==0?pageCount/5:pageCount/5+1;
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("pageIndex", pageIndex);
			request.setAttribute("list", list);
			request.getRequestDispatcher("background/bidrecordList.jsp").forward(request, response);
		}

		private void findCatalog(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			List<Catalog> allCatalog = productsDao.allCatalog();
			request.setAttribute("allCatalog", allCatalog);
			request.getRequestDispatcher("front/Addsp.jsp").forward(request, response);
		}

		/**
		 * 搜索
		 * @param request
		 * @param response
		 * @throws IOException 
		 * @throws ServletException 
		 */
		private void search(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			String spname = request.getParameter("spname");
			System.out.println("spname`````"+spname);
			int pageIndex = request.getParameter("pageIndex")==null?1:Integer.parseInt(request.getParameter("pageIndex"));
			List<Sp> list = spDao.search(spname, pageIndex);
			int pageCount = (int) spDao.countSearch(spname);
			if(pageCount!=0){
				int pageNum = pageCount%Global.pageSize==0?pageCount/Global.pageSize:pageCount/Global.pageSize+1;
				request.setAttribute("spname", spname);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("pageIndex", pageIndex);
				request.setAttribute("sp", list);
				request.getRequestDispatcher("front/searchResult.jsp").forward(request, response);
		
			}else{
				request.setAttribute("msg", "无结果");
				request.getRequestDispatcher("front/Empty.jsp").forward(request, response);
			}
		}
		/**
		 * 购物车删除商品
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 */
		private void delcart(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			int spid = Integer.parseInt(request.getParameter("spid"));
			spDao.delCart(spid);
			cart(request,response);
		}

		/**
		 * 购物车-->订单
		 * @param request
		 * @param response
		 * @throws IOException 
		 * @throws ServletException 
		 */
		private void addOrder(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			Object userid = request.getSession().getAttribute("userid");
			if(userid!=null){
				spDao.addOrder((int)userid);
				spDao.delcartByID((int)userid);
				List<orders> order=spDao.findOrderByID((int)userid);
				if(null == order || order.size() ==0 ){
					request.setAttribute("msg", "订单为空，你可以去清空购物车或竞拍喜欢的物品~~~");
					request.getRequestDispatcher("front/Empty.jsp").forward(request, response);
					return;
				}
				List<orders> count=spDao.ordercount((int)userid);
				request.setAttribute("order", order);
				request.setAttribute("count", (double)count.get(0).getCount());
				request.getRequestDispatcher("front/order.jsp").forward(request, response);
			}else if(userid==null){
				request.setAttribute("msg", "请先登录");
				request.getRequestDispatcher("front/Msg.jsp").forward(request, response);
			
			}
	}

		//查看当前用户的购物车
		private void cart(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			Object userid = request.getSession().getAttribute("userid");
			System.out.println("userid"+userid);
			if(userid!=null){
				List<Cart> list = spDao.cart((int)userid);
				List<Cart> sum = spDao.coun((int)userid);
				if(null == list || list.size() ==0 ){
					request.setAttribute("msg", "购物车为空，你可以去竞拍喜欢的物品~~~");
					request.getRequestDispatcher("front/Empty.jsp").forward(request, response);
					return;
				}
				request.setAttribute("sum", sum.get(0).getCount());
				System.out.println("sum.."+sum.get(0).getCount());
				request.setAttribute("cart", list);
				request.getRequestDispatcher("front/cart.jsp").forward(request, response);
			}else if(userid==null){
				request.setAttribute("msg", "请先登录");
				request.getRequestDispatcher("front/Msg.jsp").forward(request, response);
			
			}
		}

		/**
		 * 添加商品进购物车
		 * @param request
		 * @param response
		 * @throws IOException 
		 * @throws ServletException 
		 */
		private void addcart(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			System.out.println("进入addcart");
				spDao.savebid();
				spDao.addcart();
				spDao.delAllBid();
				request.setAttribute("msg", "竞拍已结束");
				request.getRequestDispatcher("front/Msg.jsp").forward(request, response);
			
		}

		/**
		 * 竞拍
		 * @param request
		 * @param response
		 * @throws IOException 
		 * @throws ServletException 
		 */
		private void bid(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			Object userid = request.getSession().getAttribute("userid");
			if(userid==null){
				request.setAttribute("msg", "请先登录");
				request.getRequestDispatcher("front/Msg.jsp").forward(request, response);
				return;
			}
			int spid = Integer.parseInt(request.getParameter("spid"));
			String price = request.getParameter("maxprice");
			String spname = request.getParameter("spname");
			boolean boo = spDao.bid((Integer)userid, spid, price, new Date(),spname);
			if(boo){
				spDao.updMaxprice(spid, price);
				request.setAttribute("msg", "竞拍成功,请等待竞拍结束");
				request.getRequestDispatcher("front/Msg.jsp").forward(request, response);
			}else{
				request.setAttribute("msg", "竞拍失败，请重新竞拍");
				request.getRequestDispatcher("front/Msg.jsp").forward(request, response);
			}
		}

		/**
		 * 商品详细描述页面
		 * @param request
		 * @param response
		 * @throws IOException 
		 * @throws ServletException 
		 */
		private void spdescribe(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println(id);
			List<Sp> list = spDao.findSpByID(id);
			request.setAttribute("sp", list.get(0));
			request.getRequestDispatcher("front/single.jsp").forward(request, response);
		}
		/**
		 * 发布商品
		 * @param request
		 * @param response
		 * @throws IOException 
		 * @throws ServletException 
		 * @throws IllegalStateException 
		 */
		private void addsp(HttpServletRequest request,
				HttpServletResponse response) throws IOException, IllegalStateException, ServletException {
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
				
				boolean  boo = spDao.addsp(catalogid, spname, description,price,maxprice, fileName);
				if(boo){
					request.setAttribute("msg", "发布成功！！");
					request.getRequestDispatcher("front/Msg.jsp").forward(request, response);
				}else{
					request.setAttribute("msg", "发布失败，请重新发布");
					request.getRequestDispatcher("front/Msg.jsp").forward(request, response);
				}
			}
		}
		/**
		 * 根据类别ID查找商品
		 * @param request
		 * @param response
		 * @throws IOException 
		 * @throws ServletException 
		 */
		private void findSpByID(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			int id = Integer.parseInt(request.getParameter("cid"));
			int pageIndex = request.getParameter("pageIndex")==null?1:Integer.parseInt(request.getParameter("pageIndex"));
			List<Sp> list = spDao.findSpByID(id, pageIndex);
			int pageCount = (int) spDao.count(id);
			int pageNum = pageCount%Global.pageSize==0?pageCount/Global.pageSize:pageCount/Global.pageSize+1;
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("pageIndex", pageIndex);
			request.setAttribute("splist", list);
			HttpSession session = request.getSession();
			session.setAttribute("catalogid", id);
			List<Catalog> allCatalog = productsDao.allCatalog();
			request.setAttribute("allCatalog", allCatalog);
			request.getRequestDispatcher("front/browseSpPaging.jsp").forward(request, response);		
		}
		
		
}
