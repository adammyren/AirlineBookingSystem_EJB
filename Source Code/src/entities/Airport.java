package entities;

import java.io.Serializable;

public class Airport implements Serializable, Entity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 115L;
	private String id;
	private String city;

	public Airport(String id, String city) {
		super();
		this.id = id;
		this.city = city;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Override
	public String toString() {
		return city + "(" + id + ")";

	}

}
