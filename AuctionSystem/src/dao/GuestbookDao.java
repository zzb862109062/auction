package dao;

import java.util.Date;
import java.util.List;

import bean.guestbook;
import util.Global;
import util.comm;

public class GuestbookDao {
	//留言
	public boolean addmsg(int userid,String username,String title,String content,Date createtime){
		String sql = "insert into guestbook(userid,username,title,content,createtime) values(?,?,?,?,?)";
		boolean boo = comm.update(sql,userid,username,title,content,createtime);
		return boo;
	}
	
	//查找
	public  static List guestbookList(int pageIndex){
		String sql = "select * from guestbook limit ?,?";
		List rs=comm.Query(sql,guestbook.class,(pageIndex-1)*5,5);
		return rs;
	    }	
	public  static long guestbookCount(){
		String sql = "select count(1) count from guestbook";
		List<guestbook> rs=comm.Query(sql,guestbook.class);
		return rs.get(0).getCount();
	    }
	public void delguestbook(int id){
		String sql = "delete from guestbook where id=?";
		comm.update(sql, id);
	}
}
