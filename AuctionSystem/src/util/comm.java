package util;

import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mysql.jdbc.ResultSetMetaData;

import dao.jdbc;

/**
 * 公共方法
 * 
 */
public class comm {
	
	//修改
	public static boolean update(String sql,Object...parm){
		 Connection conn=null;
		 PreparedStatement ps=null;
		try {
			Class.forName(jdbc.properties.getProperty("driver"));
		    conn =DriverManager.getConnection(jdbc.properties.getProperty("url"),jdbc.properties.getProperty("user"),jdbc.properties.getProperty("pwd"));
		    ps = conn.prepareStatement(sql);
		    for(int i=0;i<parm.length;i++){
		    	ps.setObject(i+1, parm[i]);
		    }
            int rs =  ps.executeUpdate();
            if(rs==1){
            return true;
            }
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				try {
				if(conn!=null){
					conn.close();
						} 
				if(ps!=null){
					ps.close();
				} 
				}catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					} 	
		return false;
	}
	
	//查询
	public static List Query(String sql,Class cla,Object...parm){
		
		List list = new ArrayList();
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
				Class.forName(jdbc.properties.getProperty("driver"));
				conn = DriverManager.getConnection(jdbc.properties.getProperty("url"),jdbc.properties.getProperty("user"),jdbc.properties.getProperty("pwd"));
				ps = conn.prepareStatement(sql);
				for(int i=0;i<parm.length;i++){
					ps.setObject(i+1, parm[i]);
				}
				
				rs=ps.executeQuery();
				while(rs.next()){
					Object ins = cla.newInstance();
					Method[] methods = cla.getMethods();//得到类中的所有方法
					for (Method method : methods) {
						String methodName = method.getName();
						if(methodName.startsWith("set")){
							try{
							String prop = methodName.substring(3);
							Object objVal = rs.getObject(prop);
							method.invoke(ins, objVal);
							}catch(Exception e){
								
							}
						}
					}
					list.add(ins);
				}
				return list;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e){
				
			}
		return list;
	}
}

	
}
