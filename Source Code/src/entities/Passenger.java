package entities;

import java.io.Serializable;

public class Passenger implements Serializable, Entity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 343L;
	
	private String passportnr;
	private String firstname;
	private String lastname;
	private String passportexp;
	private String passportish;
	private String birth;
	
	
	public Passenger(String passportnr, String firstname, String lastname, String passportexp, String passportish, String birth) {
		super();
		this.passportnr = passportnr;
		this.firstname = firstname;
		this.lastname = lastname;
		this.passportexp = passportexp;
		this.passportish = passportish;
		this.birth = birth;
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
	public String getPassportnr() {
		return passportnr;
	}
	public void setPassportnr(String passportnr) {
		this.passportnr = passportnr;
	}
	public String getPassportexp() {
		return passportexp;
	}
	public void setPassportexp(String passportexp) {
		this.passportexp = passportexp;
	}
	public String getPassportish() {
		return passportish;
	}
	public void setPassportish(String passportish) {
		this.passportish = passportish;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	@Override
	public String toString(){
		return firstname + " " + lastname +" Passport Number: " + passportnr;
		
	}
	
}
