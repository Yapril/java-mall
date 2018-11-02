package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entity.MallItems;
import util.DBHelper;

//商品的业务逻辑
public class MallItemsDAO {
	//获得所有的商品信息
	public ArrayList<MallItems> getAllMallItems() {
		Connection conn = null;
		PreparedStatement stmt = null;//语句对象
		ResultSet rs = null;//数据集
		
		ArrayList<MallItems> list = new ArrayList<MallItems>();
		try
		{
			conn = DBHelper.getConnection();
			String sql = "select * from mall_items";//SQL语句
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next())
			{
				MallItems item = new MallItems();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setCity(rs.getString("city"));
				item.setPrice(rs.getInt("price"));
				item.setNumber(rs.getInt("number"));
				item.setPicture(rs.getString("picture"));
				list.add(item);//每次遍历把一个商品加入集合
			}
			return list;//返回集合
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return null;
		}
		//释放资源（从小到大释放）
		finally
		{
			//释放数据集对象
			if(rs!=null)
			{
				try
				{
					rs.close();
					rs=null;
				}
				catch(Exception ex) 
				{
					ex.printStackTrace();
				}
			}
			//释放语句对象
			if(stmt!=null)
			{
				try
				{
					stmt.close();
					stmt=null;
				}
				catch(Exception ex) 
				{
					ex.printStackTrace();
				}
			}
		}
	}
}
