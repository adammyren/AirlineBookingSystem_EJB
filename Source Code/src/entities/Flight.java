package entities;

import java.io.Serializable;

public class Flight implements Serializable, Entity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 223L;
	/**
	 * 
	 */
	private String id;
	private String date;
	private String departure_time;
	private String duration;
	private int capacity;
	private int free_seats;
	private String origin;
	private String destination;
	private String price;

	public Flight(String id, String date, String departure_time, String duration, int capacity, String origin,
			String destination, String price) {
		super();
		this.id = id;
		this.date = date;
		this.departure_time = departure_time;
		this.duration = duration;
		this.capacity = capacity;
		this.origin = origin;
		this.destination = destination;
		this.price = price;
		this.free_seats = 0;
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

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public int getFree_seats() {
		return free_seats;
	}

	public void setFree_seats(int free_seats) {
		this.free_seats = free_seats;
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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return id + " | " + origin + " -> " + destination + " | Departure: " + date + " - " + departure_time
				+ " | " + duration + " | " + price +" SGD";
	}

}
