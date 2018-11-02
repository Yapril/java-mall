package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBHelper;

public class MallUsersDAO {
	//与用户表信息匹配返回一个boolean类型
	public static boolean checkLogin(String username, String password)
	{
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try
		{
			conn = DBHelper.getConnection();
			String sql = "select * from mall_users where username=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);//给第一个问好赋值
			rs = stmt.executeQuery();
			if(rs.next())
			{
				String pwd = rs.getString("password");
				if(pwd.equals(password))
				{
					return true;//验证成功
				}else {
					return false;//验证失败
				}
			}else {
				return false;
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally {
			if(rs!=null)
			{
				try
				{
					rs.close();
					rs=null;
				}
				catch (Exception ex) 
				{
					ex.printStackTrace();
				}
			}
			if(stmt!=null)
			{
				try
				{
					stmt.close();
					stmt=null;
				}
				catch (Exception ex) 
				{
					ex.printStackTrace();
				}
			}
		}
		return false;
	}
}
