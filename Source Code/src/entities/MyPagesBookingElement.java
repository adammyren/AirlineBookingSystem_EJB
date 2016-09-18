package entities;

import java.io.Serializable;

public class MyPagesBookingElement implements Serializable, Entity {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1111L;
	private String id;
	private String date;
	private String departure_time;
	private String duration;
	private String origin;
	private String destination;
	private String firstname;
	private String lastname;
	private String passportnr;


	public MyPagesBookingElement(String id, String date, String departure_time, String duration, String origin,
			String destination, String firstname, String lastname, String passportnr) {
		super();
		this.id = id;
		this.date = date;
		this.departure_time = departure_time;
		this.duration = duration;
		this.origin = origin;
		this.destination = destination;
		this.firstname = firstname;
		this.lastname = lastname;
		this.passportnr = passportnr;
	}
	
	

	public String getPassportnr() {
		return passportnr;
	}



	public void setPassportnr(String passportnr) {
		this.passportnr = passportnr;
	}



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getDeparture_time() {
		return departure_time;
	}

	public void setDeparture_time(String departure_time) {
		this.departure_time = departure_time;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	
	
	@Override
	public String toString(){
		return "Flight id: " + id + " Date: " + date + " Origin: " + origin + " Destination: " + destination
				+" Departure Time: " + departure_time + " Duration: " + duration + " Passenger: " + firstname + " " +lastname;
	}	

}
