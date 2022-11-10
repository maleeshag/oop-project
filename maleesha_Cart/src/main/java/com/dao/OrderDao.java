package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Order;
import model.Product;

public class OrderDao {
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
    

	public OrderDao(Connection con) {
		super();
		this.con = con;
	}
	
	//insert data into order table
	public boolean insertOrder(Order model) {
        boolean result = false;
        try {
            query = "insert into onlinecomputersparepartssystem.order (userId,quantity,orderDate,productId,userName,deliveryAddress)values(?,?,?,?,?,?) ";
            
            pst = this.con.prepareStatement(query);
            
            pst.setInt(4, model.getId());
            pst.setInt(1, model.getUid());
            pst.setInt(2, model.getQunatity()); 
            pst.setString(3, model.getDate());
            pst.setString(5,model.getuName());
            pst.setString(6, model.getCusAddress());
            
            pst.executeUpdate();
            
            result = true;
            
        } catch (SQLException e) {
        	
            System.out.println(e.getMessage());
            
        }
        return result;
    }
	
	
	//display(read) order table
	 public List<Order> userOrders(int id) {
	        List<Order> list = new ArrayList<>();
	        try {
	            query = "select * from onlinecomputersparepartssystem.order where userId=? order by orderId desc";
	            pst = con.prepareStatement(query);
	            pst.setInt(1, id);
	            rs = pst.executeQuery();
	            while (rs.next()) {
	                Order order = new Order();
	                
	                ProductDao productDao = new ProductDao(this.con);
	                int pId = rs.getInt("productId");
	                
	                Product product = productDao.getSingleProduct(pId);
	                
	                order.setOrderId(rs.getInt("orderId"));
	                order.setId(pId);
	                
	                order.setName(product.getName());
	                
	                order.setCategory(product.getCategory());
	                
	                order.setPrice(product.getPrice()*rs.getInt("quantity"));
	                order.setQunatity(rs.getInt("quantity"));
	                order.setDate(rs.getString("orderDate"));
	                
	                order.setCusAddress(rs.getString("deliveryAddress"));
	                
	                list.add(order);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }
	        return list;
	    }
	 
	 
	 //delete a order from the table
	 public void cancelOrder(int id) {
	        
	        try {
	            query = "delete from onlinecomputersparepartssystem.order where orderId=?;";
	            pst = this.con.prepareStatement(query);
	            pst.setInt(1, id);
	            pst.execute();
	            
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	            System.out.print(e.getMessage());
	        }
	        
	    }
	 
	 //update a order
	 public void updateOrder(int id,String address) {
	        
	        try {
	            query = "update onlinecomputersparepartssystem.order set deliveryAddress=? where orderId=?;";
	            pst = this.con.prepareStatement(query);
	            pst.setInt(2, id);
	            pst.setString(1, address);
	            pst.execute();
	            
	            System.out.println(address);
	            System.out.println(id);
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	            System.out.print(e.getMessage());
	        }
	        
	    }

    
}
