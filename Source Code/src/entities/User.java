package entities;

import java.io.Serializable;

public class User implements Serializable, Entity{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2336L;
	private String username;
	private String password;
	private String email;
	private boolean admin;
	public User(String username, String password, String email, boolean admin) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.admin = admin;
	}
	
	
	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isAdmin() {
		return admin;
	}
	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	
	@Override
	public String toString(){
		return "Username: " + username + " Email:" + email;
	}
}
