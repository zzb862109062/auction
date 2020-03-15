package dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class jdbc {
	public static Properties properties = new Properties();
	static{
		InputStream in =jdbc.class.getClassLoader().getResourceAsStream("dao/jdbc.properties");
		try {
			properties.load(in);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
