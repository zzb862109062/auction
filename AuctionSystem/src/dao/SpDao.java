package dao;

import java.util.Date;
import java.util.List;

import bean.Cart;
import bean.Sp;
import bean.orders;
import util.Global;
import util.comm;


public class SpDao {
	//根据ID查找并分页
	public List findSpByID(int id,int pageIndex){
		String sql = "select * from sp where catalogid=? limit ?,?";
		List rs=comm.Query(sql,Sp.class,id,(pageIndex-1)*Global.pageSize,Global.pageSize);
		return rs;
	}
	//根据ID查找并分页
	public List findSpByID(int id){
		String sql = "select * from sp where id=?";
		List rs=comm.Query(sql,Sp.class,id);
		return rs;
	}	
	//统计
	public long count(int id){
			String sql = "select count(1) count  from sp where catalogid=?";
			List<Sp> rs=comm.Query(sql,Sp.class,id);
			return rs.get(0).getCount();
		}
	//添加商品
	public boolean addsp(int catalogid,String name,String desc,String price,String maxprice,String picture){
		String sql = "insert into sp(catalogid,spname,description,price,maxprice,picture) values(?,?,?,?,?,?)";
		boolean  boo =comm.update(sql, catalogid,name,desc,price,maxprice,picture);
		return boo;
	}
	//竞拍
	public boolean bid(int userid,int spid,String price,Date createtime,String spname){
		String sql = "insert into bid(userid,spid,price,createtime,spname) values(?,?,?,?,?)";
		boolean  boo= comm.update(sql,userid,spid,price,createtime,spname);
		return boo;
	}
	//添加进购物车
	public boolean addcart(){
		String sql = "insert into cart(price,spid,userid,createtime,spname) select price,spid,userid,createtime,spname from "+
					"(select price,spid,userid,now() createtime,spname from bid group by spid ORDER BY price desc )bid";
		boolean  boo= comm.update(sql);
		return boo;
	}
	//天假进订单
	public void addOrder(int userid){
		String sql = " insert into orders(price,spid,userid,createtime,spname) select price,spid,userid,createtime,spname from"+
						"(select price,spid,userid,now() createtime,spname from cart where userid=? )cart";
		comm.update(sql,userid);
	}
	//保存竞拍记录
	public void savebid(){
		String sql = "insert into BidRecord(price,spid,userid,createtime,spname) select price,spid,userid,createtime,spname from "+
					"(select price,spid,userid,createtime,spname from bid group by spid ORDER BY price desc )bid";
		 comm.update(sql);
	}
	//清空竞拍表
	public void delAllBid(){
		String sql = "TRUNCATE  TABLE  bid";
		comm.update(sql);
	}
	//修改竞拍价格
	public void updMaxprice(int spid,String maxprice){
		String sql = "update sp set maxprice=? where id=?";
		 comm.update(sql,maxprice,spid);
	}
	//查看当前用户购物车
	public List cart(int userid){
		String sql = "select * from cart  where userid=? GROUP BY spid";
		List<Cart> rs=comm.Query(sql,Cart.class,userid);
		return rs;
	}
	//统计
	
	public List coun(int userid){
	String sql = "select sum(price) count from cart  where userid=?";
	List<Cart> rs=comm.Query(sql,Cart.class,userid);
	System.out.println("rs:"+rs.get(0).getCount());
	return rs;
	}
	
	//购物车删除商品
	public void delCart(int spid){
		String sql="delete from cart where spid=?";
		comm.update(sql,spid);
	}
	
	//清空当前用户购物车
	public void delcartByID(int userid){
		String sql="delete from cart where userid=?";
		comm.update(sql, userid);
	}
	//查找当前用户的订单
	public List findOrderByID(int userid){
		String sql = "select * from orders where userid=?";
		List list = comm.Query(sql, orders.class, userid);
		return list;
	}
	public List ordercount(int userid){
		String sql = "select sum(price) count from orders  where userid=?";
		List rs=comm.Query(sql,orders.class,userid);
		return rs;
		}
	//搜索
	public List search(String spname,int pageIndex){
		if(spname!=null){
			String sql = "select * from sp where spname like '%"+spname+"%' limit ?,? ";
			List list = comm.Query(sql, Sp.class,(pageIndex-1)*Global.pageSize,Global.pageSize);
			return list;
		}else{
			String sql = "select * from sp where spname limit ?,? ";
			List list = comm.Query(sql, Sp.class,(pageIndex-1)*Global.pageSize,Global.pageSize);
			return list;
		}
		
	}
	//搜索统计
	public long countSearch(String spname){
		if(spname!=null){
			String sql = "select count(1) count from sp where spname like '%"+spname+"%'";
			List<Sp> list = comm.Query(sql, Sp.class);
			return list.get(0).getCount();
		}else{
			String sql = "select count(1) count from sp";
			List<Sp> list = comm.Query(sql, Sp.class);
			return list.get(0).getCount();
		}
	}
	//图片
	public List picture(){
		String sql = "select picture from sp where spname";
		List<Sp> list = comm.Query(sql, Sp.class);
		return list;
	}
}
