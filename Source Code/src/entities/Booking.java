package entities;

import java.io.Serializable;

public class Booking implements Serializable, Entity{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 127L;
	private String flight_id;
	private String passenger;
	private String user;
	private String status;
	private String date;
	
	public Booking(String flight_id, String passenger, String user, String status, String date) {
		super();
		this.flight_id = flight_id;
		this.passenger = passenger;
		this.user = user;
		this.status = status;
		this.date = date;
	}
	
	public String getFlight_id() {
		return flight_id;
	}
	public void setFlight_id(String flight_id) {
		this.flight_id = flight_id;
	}
	public String getPassenger() {
		return passenger;
	}
	public void setPassenger(String passenger) {
		this.passenger = passenger;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	@Override
	public String toString(){
		return "Flight id: " + flight_id + " Date: " + date + " Passenger: " + passenger + " User: " + user + " Status: " + status;
		
	}

}
