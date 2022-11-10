package model;

public class User {
	private int cusId;
	private String cusUserName;
	private String cusEmail;
	private String cusPassword;
	private String cusAddress;
	
	
	public User() {
	
	}


	public User(int cusId, String cusUserName, String cusEmail, String cusPassword,String cusAddress) {
		
		this.cusId = cusId;
		this.cusUserName = cusUserName;
		this.cusEmail = cusEmail;
		this.cusPassword = cusPassword;
		this.cusAddress=cusAddress;
	}

	
	public String getCusAddress() {
		return cusAddress;
	}


	public void setCusAddress(String cusAddress) {
		this.cusAddress = cusAddress;
	}


	public int getCusId() {
		return cusId;
	}


	public void setCusId(int cusId) {
		this.cusId = cusId;
	}


	public String getCusUserName() {
		return cusUserName;
	}


	public void setCusUserName(String cusUserName) {
		this.cusUserName = cusUserName;
	}


	public String getCusEmail() {
		return cusEmail;
	}


	public void setCusEmail(String cusEmail) {
		this.cusEmail = cusEmail;
	}


	public String getCusPassword() {
		return cusPassword;
	}


	public void setCusPassword(String cusPassword) {
		this.cusPassword = cusPassword;
	}


	@Override
	public String toString() {
		return "User [cusId=" + cusId + ", cusUserName=" + cusUserName + ", cusEmail=" + cusEmail + ", cusPassword="
				+ cusPassword + ", cusAddress=" + cusAddress + "]";
	}


	
	
	
	
}
