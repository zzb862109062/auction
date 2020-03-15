package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;















import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Global;
import bean.User;
import bean.sysuser;
import dao.UserDao;


public class userServlet extends HttpServlet{
		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
		/**
	 * 
	 */

		UserDao userDao = new UserDao();
		User user = new User();
		@Override
		protected void service(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			String cmd=request.getParameter("cmd");
			if("adduser".equals(cmd)){
				adduser(request,response);
			}else if("login".equals(cmd)){
				login(request,response);
			}else if("loginout".equals(cmd)){
				loginout(request,response);
			}else if("findUser".equals(cmd)){
				findUser(request,response);
			}else if ("updUser".equals(cmd)){
				updUser(request,response);
			}else if("syslogin".equals(cmd)){
				syslogin(request,response);
			}else if("sysloginout".equals(cmd)){
				sysloginout(request,response);
			}else if("userList".equals(cmd)){
				userList(request,response);
			}else if("findUserById".equals(cmd)){
				findUserById(request,response);
			}else if("upduser".equals(cmd)){
				upduser(request,response);
			}else if("deluser".equals(cmd)){
				deluser(request,response);
			}
		}
		private void deluser(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			int id = Integer.parseInt(request.getParameter("userid"));
			userDao.deluser(id);
			request.getRequestDispatcher("user.Servlet?cmd=userList").forward(request, response);
		}
		private void upduser(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			int id = Integer.parseInt(request.getParameter("userid"));
			String username  = request.getParameter("username");
			String pwd  = request.getParameter("password");
			String phone  = request.getParameter("phone");
			String adress  = request.getParameter("adress");
			String usersex  = request.getParameter("usersex");
			userDao.updateUser(username, pwd, adress, phone, usersex, id);
			PrintWriter pw = response.getWriter();
			pw.write("<script>window.parent.layer.close(window.parent.index);</script>");
			pw.flush();
			pw.close();
			
		}
		private void findUserById(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			int id = Integer.parseInt(request.getParameter("userid"));
			List findUser = UserDao.findUser(id);
			request.setAttribute("user", findUser.get(0));
			request.setAttribute("userid", id);
			request.getRequestDispatcher("background/updUser.jsp").forward(request, response);
		}
		private void userList(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			int pageIndex = request.getParameter("pageIndex")==null?1:Integer.parseInt(request.getParameter("pageIndex"));
			List<User> list = userDao.UserList(pageIndex);
			int pageCount = (int)userDao.UserCount();
			int pageNum = pageCount%Global.pageSize==0?pageCount/Global.pageSize:pageCount/Global.pageSize+1;
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("pageIndex", pageIndex);
			request.setAttribute("userlist", list);
			request.getRequestDispatcher("background/userList.jsp").forward(request, response);
		}
		/**
		 * 系统用户退出系统
		 * @param request
		 * @param response
		 * @throws IOException 
		 */
		private void sysloginout(HttpServletRequest request,
				HttpServletResponse response) throws IOException {
			// TODO Auto-generated method stub
			request.getSession().invalidate();  
			response.sendRedirect("background/login.jsp");
		}
		/**
		 * 后台登录
		 * @param request
		 * @param response
		 * @throws IOException 
		 * @throws ServletException 
		 */
		private void syslogin(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			String username = request.getParameter("sysusername");
			String pwd = request.getParameter("syspassword");
			List<sysuser> rs  = userDao.syslogin(username);
			if(rs!=null && rs.size()>0){		
				if(pwd.equals(rs.get(0).getSyspassword())){
				
					 request.getSession().setAttribute("sysusername", rs.get(0).getSysusername());
					//request.setAttribute("msg", "登录成功");
					System.out.println("userid:"+ rs.get(0).getId());
					System.out.println("username："+rs.get(0).getSysusername());
					 request.getSession().setAttribute("sysuserid", rs.get(0).getId());
					response.sendRedirect("background/index.jsp");

				}else{
					request.setAttribute("msg", "密码错误");
					request.getRequestDispatcher("background/login.jsp").forward(request, response);
				}
				
			}else{
				request.setAttribute("msg", "用户不存在");
				request.getRequestDispatcher("background/login.jsp").forward(request, response);
				//response.sendRedirect("front/userMsg.jsp");
			}
		}

		/**
		 * 修改
		 * @param request
		 * @param response
		 * @throws IOException 
		 * @throws ServletException 
		 */
		private void updUser(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			int id = Integer.parseInt(request.getParameter("userid"));
			System.out.println("id : "+id);
			String username  = request.getParameter("username");
			String pwd  = request.getParameter("password");
			String phone  = request.getParameter("phone");
			String adress  = request.getParameter("adress");
			String usersex  = request.getParameter("usersex");
			boolean bool = userDao.updateUser(username, pwd, adress, phone, usersex, id);
			if(bool){
			request.setAttribute("msg", "修改成功");
			request.getRequestDispatcher("front/Msg.jsp").forward(request, response);
			}else{
				request.setAttribute("msg", "修改失败");
				request.getRequestDispatcher("front/Msg.jsp").forward(request, response);
			}
		}
		/**
		 * 查找
		 * @param request
		 * @param response
		 * @throws IOException 
		 * @throws ServletException 
		 */
		private void findUser(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			int id = Integer.parseInt(request.getParameter("id"));
			List<User> list = userDao.findUser(id);
			System.out.println(list.get(0).getUsername());
			request.setAttribute("user", list.get(0));
			request.getRequestDispatcher("front/updateUser.jsp").forward(request, response);
		}

		/**
		 * 注销
		 * @param request
		 * @param response
		 * @throws IOException 
		 */
		private void loginout(HttpServletRequest request,
				HttpServletResponse response) throws IOException {
			// TODO Auto-generated method stub
			request.getSession().invalidate();  
			response.sendRedirect("front/index.jsp");
		}

		/**
		 * 登录
		 * @param request
		 * @param response
		 * @throws IOException 
		 * @throws ServletException 
		 */
		private void login(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			String username = request.getParameter("username");
			String pwd = request.getParameter("password");
			List<User> rs  = userDao.loginUser(username);
			if(rs!=null && rs.size()>0){		
				if(pwd.equals(rs.get(0).getPassword())){
				
					 request.getSession().setAttribute("username", rs.get(0).getUsername());
					request.setAttribute("msg", "登录成功");
					System.out.println("userid:"+ rs.get(0).getUserid());
					System.out.println("username："+rs.get(0).getUsername());
					 request.getSession().setAttribute("userid", rs.get(0).getUserid());
					request.getRequestDispatcher("front/Msg.jsp").forward(request, response);

				}else{
					request.setAttribute("msg", "密码错误");
					request.getRequestDispatcher("front/Msg.jsp").forward(request, response);
				}
				
			}else{
				request.setAttribute("msg", "用户不存在");
				request.getRequestDispatcher("front/Msg.jsp").forward(request, response);
				//response.sendRedirect("front/userMsg.jsp");
			}
			
		}
			
		/**
		 * 注册
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 */
		private void adduser(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			String username  = request.getParameter("username");
			List list = userDao.findid(username);
			if(null == list || list.size() ==0 ){
				user.setUsername(username);
				user.setPassword(request.getParameter("password"));
				user.setAdress(request.getParameter("adress"));
				user.setPhone(request.getParameter("phone"));
				user.setUsersex(request.getParameter("usersex"));
				userDao.addUser(user);
				request.setAttribute("msg", "注册成功");
				request.getRequestDispatcher("front/Msg.jsp").forward(request, response);
				
			}else{
				request.setAttribute("msg", "用户名已存在");
				request.getRequestDispatcher("front/Msg.jsp").forward(request, response);
			}
		}
}
