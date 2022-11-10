package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;

public class UserDao {
	private Connection con;
	private String query;
    private PreparedStatement pst;
    private ResultSet rs;

	public UserDao(Connection con) {
		this.con = con;
	}
	
	public User userLogin(String email, String password) {
		User user = null;
        try {
        	
            query = "select * from customer where cusEmail=? and cusPassword=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();
            
            
            if(rs.next()){
            	user = new User();
            	user.setCusId(rs.getInt("cusId"));
            	user.setCusUserName(rs.getString("cusUserName"));
            	user.setCusEmail(rs.getString("cusEmail"));
            	user.setCusAddress(rs.getString("cusAddress"));
            	
            	
            }
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
        return user;
    }
}
