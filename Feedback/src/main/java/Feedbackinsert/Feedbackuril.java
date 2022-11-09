package Feedbackinsert;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Feedbackuril {
	
	
	public static List<Feedback> getFeedback(){
		  
		ArrayList<Feedback> feed = new ArrayList<>(); 
		
			
		   String Url = "jdbc:mysql://localhost:3306/hotel";
		   String user = "root";
		   String pass="2244";
		   
		   
		   try {
			    Class.forName("com.mysql.jdbc.Driver");
			    Connection con = DriverManager.getConnection(Url,user,pass);		    
			    Statement stmt  = con.createStatement();
             String sql = "select * from feedback  ";
             
             
             ResultSet  rs = stmt.executeQuery(sql);
             System.out.print("Feedbackurl ek wda  krnwaa bn ");
             
			 while(rs.next()){
			    	int FeedbackID=rs.getInt(1);
			    	String coustomerID=rs.getString(2);
			    	String feedback=rs.getString(3);
			    	String feedbackrate=rs.getString(4);
			    	
			    	
			    	
			    	Feedback f = new Feedback(FeedbackID,coustomerID,feedback,feedbackrate);
			    	feed.add(f);
			 }  
			    
			    
		   }catch(Exception e){
			   e.printStackTrace();
			   
		   }
		   
		   return feed;
			   
    }
 
	
	public static boolean insertFeedback (String coustomerID,String feedback,String feedbackrate) {
		//create daabase connection 
		
		   boolean isSuccess= false;
		
		   String Url = "jdbc:mysql://localhost:3306/hotel";
		   String user = "root";
		   String pass="2244";
		   
		  
		   
		   
		   
		   
		   try {
			    Class.forName("com.mysql.jdbc.Driver");
			    Connection con = DriverManager.getConnection(Url,user,pass);		    
			    Statement stmt  = con.createStatement();
                String sql = "insert into feedback values (0,'"+coustomerID+"','"+feedback+"','"+feedbackrate+"')";
                int rs = stmt.executeUpdate(sql);
                
			    if(rs>0)
			    	isSuccess=true;
			    else
			    	isSuccess=false;
			    
			    
		   }catch(Exception e){
			   e.printStackTrace();
			   
		   }
		   
		   return isSuccess;
			   
 }
	
	
	
public static boolean updateFeedback(String feedbackid,String coustomerID,String feedback,String feedbackrate) {
	   
	    String Url = "jdbc:mysql://localhost:3306/hotel";
	    String user = "root";
	    String pass="2244";
	    
	    boolean isSuccess= false;
	    
	    System.out.println("heloo wdaaa");
	    
    	try {
    		
    		
    		Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection(Url,user,pass);		    
		    Statement stmt  = con.createStatement();
		    
    		String sql = "update feedback set feedback = '"+feedback+"',feedbackrate='"+feedbackrate+ " ' where feedbackid ='"+feedbackid+"' and coustomer ='"+coustomerID+"'";
    		int rs = stmt.executeUpdate(sql);
    		
    		System.out.println("wda bng");
    		
    		if(rs > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return isSuccess;
    }
		  






public static boolean deletefeedback(String feedbackid,String coustomerID,String feedback,String feedbackrate) {
	   
    String Url = "jdbc:mysql://localhost:3306/hotel";
    String user = "root";
    String pass="2244";
    
    boolean isSuccess= false;
    
    System.out.println("heloo wdaaa");
    
	try {
		
		
		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection(Url,user,pass);		    
	    Statement stmt  = con.createStatement();
	    
		String sql = "delete from feedback  where feedbackid ='"+feedbackid+"' and coustomer ='"+coustomerID+"'";
		int rs = stmt.executeUpdate(sql);
		
		System.out.println("wda bng");
		
		if(rs > 0) {
			isSuccess = true;
		}
		else {
			isSuccess = false;
		}
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	
	return isSuccess;
}
	 //validate 

}
