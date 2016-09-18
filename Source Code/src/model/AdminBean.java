package model;

import java.util.ArrayList;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import dao.BookingDAO;
import dao.FlightDAO;
import dao.PassengerDAO;
import dao.UserDAO;
import entities.Booking;
import entities.Flight;
import entities.Passenger;
import entities.User;

/**
 * Session Bean implementation class AdminBean
 */
@Stateless
@LocalBean
public class AdminBean {
	
	@EJB
	private FlightDAO flightdao;
	
	@EJB
	private UserDAO userdao;
	
	@EJB
	private PassengerDAO passengerdao;
	
	@EJB
	private BookingDAO bookingdao;
	
    public AdminBean() {
    }
    
    public boolean addNewFlight(String flight_id, String date, String departure_time, String duration, int capacity, String origin, String destination, String price ){
    	System.out.println("AdminBean: " + price);
    	Flight flight = new Flight(flight_id, date, departure_time, duration, capacity, origin, destination, price);
    	if(!flightdao.exists(flight_id, date)){
    		return flightdao.add(flight);
    	}
    	else{
    		return false;
    	}
    }

	public ArrayList<User> getAllUsers() {
		return userdao.getAll();
	}

	public Flight getFlight(String flight_id, String date) {
		return flightdao.getFlight(flight_id, date);
	}

	public boolean updateFlight(String flight_id, String date, Flight new_flight) {
		return flightdao.update(flight_id, date, new_flight);
	}
	
	public ArrayList<Passenger> getPassengers(String flight_id, String date) {
		ArrayList<Passenger> list_of_passengers = new ArrayList<Passenger>();
		ArrayList<Booking> list_of_bookings = bookingdao.getBookings(flight_id, date);
		for(Booking b:list_of_bookings){
			Passenger p = passengerdao.getPassenger(b.getPassenger());
			list_of_passengers.add(p);
		}
		return list_of_passengers;
	}

}
