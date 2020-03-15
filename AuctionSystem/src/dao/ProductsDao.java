package dao;

import java.util.List;

import util.comm;
import bean.Sp;
import bean.Catalog;
import bean.bidrecord;
import bean.orders;

public class ProductsDao {
	public List findCatalog(int pageIndex){
		String sql = "select * from catalog limit ?,?";
		List rs=comm.Query(sql,Catalog.class,(pageIndex-1)*5,5);
		return rs;
	}
	public List findSp(int pageIndex){
		String sql = "select * from sp limit ?,?";
		List rs=comm.Query(sql,Sp.class,(pageIndex-1)*5,5);
		return rs;
	}
	public List allCatalog(){
		String sql = "select * from catalog";
		List rs=comm.Query(sql,Catalog.class);
		return rs;
	}
	public long countCatalog(){
		String sql = "select count(1) count from catalog";
		List<Catalog> rs=comm.Query(sql,Catalog.class);
		return rs.get(0).getCount();	
	}
	public void addcatalog(String name){
		String sql = "insert into catalog(catalogname) values(?)";
		comm.update(sql, name);
	}
	public String findcatalog(int id){
		String sql = "select catalogname from catalog where catalogid=?";
		List<Catalog> rs=comm.Query(sql,Catalog.class,id);
		return rs.get(0).getCatalogname();
	}
	public void updcatalog(String name,int id){
		String sql = "update catalog set catalogname=? where catalogid=?";
		comm.update(sql, name,id);
	}
	public void delcatalog(int id){
		String sql = "delete from  catalog  where catalogid=?";
		comm.update(sql,id);
	}
	public long countSp(){
		String sql = "select count(1) count from sp";
		List<Sp> rs=comm.Query(sql,Sp.class);
		return rs.get(0).getCount();
	}
	//查找
	public  static List bidrecordList(int pageIndex){
		String sql = "select * from bidrecord limit ?,?";
		List rs=comm.Query(sql,bidrecord.class,(pageIndex-1)*5,5);
		return rs;
	    }	
	public  static long bidrecordCount(){
		String sql = "select count(1) count from bidrecord";
		List<bidrecord> rs=comm.Query(sql,bidrecord.class);
		return rs.get(0).getCount();
	    }	
	//查找
	public  static List orderList(int pageIndex){
			String sql = "select * from orders limit ?,?";
			List rs=comm.Query(sql,orders.class,(pageIndex-1)*5,5);
			return rs;
		    }	
	public  static long orderCount(){
			String sql = "select count(1) count2 from orders";
			List<orders> rs=comm.Query(sql,orders.class);
			return rs.get(0).getCount2();
		    }
	public void delproduct(int id){
		String sql = "delete from  sp  where id=?";
		comm.update(sql,id);
	}
	public List findproduct(int id){
		String sql = "select * from sp where id=?";
		List rs=comm.Query(sql,Sp.class,id);
		return rs;
	}
	public void updproduct(int id,int catalogid,String name,String desc,String maxprice,String picture){
		String sql = "update sp set catalogid=?,spname=?,description=?,maxprice=?,picture=? where id=?";
		comm.update(sql,catalogid,name,desc,maxprice,picture,id);
	}
}
