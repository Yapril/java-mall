package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBHelper {
	//不怎么修改的量就设成"私有静态常量"
	private static final String driver = "com.mysql.jdbc.Driver";//数据库驱动
	private static final String url ="jdbc:mysql://localhost:3306/jspdata?useUnicode=true&characterEncoding=utf-8";//数据库的URL地址
	private static final String username = "root";//数据库用户名
	private static final String password = "yyf209myn@";//数据库密码
	
	private static Connection conn = null;
	
	//静态代码块负责加载驱动
	static
	{
		try
		{
			Class.forName(driver);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	//单例模式返回数据库连接对象
	public static Connection getConnection() throws Exception
	{
		if(conn == null) {
			conn = DriverManager.getConnection(url, username, password);
			return conn;
		}
		return conn;
	}
	
	//测试
	public static void main(String[] args) {
		try
		{
			Connection conn = DBHelper.getConnection();
			if(conn != null) {
				System.out.println("数据库连接成功！");
			} else {
				System.out.println("数据库连接失败！");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
}
