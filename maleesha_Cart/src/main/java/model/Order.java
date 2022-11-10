package model;

public class Order extends Product{
	private int orderId;
	private int uid;
	private String uName;
	private int qunatity;
	private String date;
	
	public Order() {
	}
	
	

	public Order(int uid, int qunatity, String date,String uName) {
		super();
		this.uid = uid;
		this.qunatity = qunatity;
		this.date = date;
		this.uName=uName;
	}
	
	
	
	
	
	public String getuName() {
		return uName;
	}



	public void setuName(String uName) {
		this.uName = uName;
	}

	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	
	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getQunatity() {
		return qunatity;
	}
	public void setQunatity(int qunatity) {
		this.qunatity = qunatity;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}



	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", uid=" + uid + ", uName=" + uName + ", qunatity=" + qunatity + ", date="
				+ date + "]";
	}






	
	
}
