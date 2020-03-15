package dao;

import java.util.List;

import bean.User;
import bean.sysuser;
import util.Global;
import util.comm;


public class UserDao {
		//注册
		public  static boolean addUser(User user){
				String sql = "insert into user(username,password,adress,phone,usersex) values(?,?,?,?,?)";
	            boolean add =  comm.update(sql,user.getUsername(),user.getPassword(),user.getAdress(),user.getPhone(),user.getUsersex());
				return add;
	        }
		
		
		//登录
		public  static List loginUser(String username){
			String sql = "select userid,username,password,adress,phone,usersex from user where username=?";
			List rs=comm.Query(sql,User.class,username);
			return rs;
		    }
		//后台系统登录
		public  static List syslogin(String sysusername){
				String sql = "select * from sysuser where sysusername=?";
				List rs=comm.Query(sql,sysuser.class,sysusername);
				return rs;
		 }
		//通过ID查找
		public  static List findUser(int id){
			String sql = "select userid,username,password,adress,phone,usersex from user where userid=?";
			List rs=comm.Query(sql,User.class,id);
			return rs;
		    }	
		//修改
		public boolean updateUser(String name,String pwd,String adress,String phone,String sex,int id){
			String sql = "update user set username=?,password=?,adress=?,phone=?,usersex=? where userid=?";
			boolean  bool= comm.update(sql,name,pwd,adress,phone,sex,id);
			return bool;
		}
		
		//查找
		public  static List UserList(int pageIndex){
			String sql = "select * from user limit ?,?";
			List rs=comm.Query(sql,User.class,(pageIndex-1)*5,5);
			return rs;
		    }	
		public  static long UserCount(){
			String sql = "select count(1) count from user";
			List<User> rs=comm.Query(sql,User.class);
			return rs.get(0).getCount();
		    }	
		public  static List findid(String username){
			String sql = "select userid from user where username=?";
			List rs=comm.Query(sql,User.class,username);
			return rs;
		    }
		public void deluser(int id){
			String sql = "delete from user where userid=?";
			comm.update(sql, id);
		}
}
