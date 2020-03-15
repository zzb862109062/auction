package servlet;

import java.io.IOException;
import java.util.Date;


import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Global;
import bean.User;
import dao.GuestbookDao;
import bean.guestbook;


public class guestbookServlet extends HttpServlet{
		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
		GuestbookDao guestbookDao = new GuestbookDao();
		@Override
		protected void service(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			// TODO Auto-generated method stub
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			String cmd=request.getParameter("cmd");
			if("msg".equals(cmd)){
				addmsg(request,response);
			}else if("guestbook".equals(cmd)){
				guestbook(request,response);
			}else if("delguestbook".equals(cmd)){
				delguestbook(request,response);
			}
		}
		
		private void delguestbook(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			int id = Integer.parseInt(request.getParameter("id"));
			guestbookDao.delguestbook(id);
			request.getRequestDispatcher("guestbook.Servlet?cmd=guestbook").forward(request, response);
		}

		private void guestbook(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			int pageIndex = request.getParameter("pageIndex")==null?1:Integer.parseInt(request.getParameter("pageIndex"));
			List<guestbook> list = guestbookDao.guestbookList(pageIndex);
			int pageCount = (int)guestbookDao.guestbookCount();
			int pageNum = pageCount%5==0?pageCount/5:pageCount/5+1;
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("pageIndex", pageIndex);
			request.setAttribute("list", list);
			request.getRequestDispatcher("background/guestbookList.jsp").forward(request, response);
		}

		/**
		 * 留言
		 * @param request
		 * @param response
		 * @throws IOException 
		 * @throws ServletException 
		 */
		private void addmsg(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			Object userid = request.getSession().getAttribute("userid");
			if(userid!=null){
					String title = request.getParameter("title");
					String content = request.getParameter("content");
					boolean boo = guestbookDao.addmsg((int)request.getSession().getAttribute("userid")
							,(String)request.getSession().getAttribute("username"),title, content, new Date());
					if(boo){
						request.setAttribute("msg", "留言成功~~");
						request.getRequestDispatcher("front/Msg.jsp").forward(request, response);
					}else{
						request.setAttribute("msg", "留言失败..");
						request.getRequestDispatcher("front/Msg.jsp").forward(request, response);
					}
			}else{
				request.setAttribute("msg", "请先登录，再来留言(((;꒪ꈊ꒪;)))");
				request.getRequestDispatcher("front/Msg.jsp").forward(request, response);
			}
		}
}
