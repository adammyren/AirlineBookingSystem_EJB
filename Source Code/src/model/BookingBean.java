package model;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import dao.AirportDAO;
import dao.BookingDAO;
import dao.FlightDAO;
import dao.PassengerDAO;
import entities.Airport;
import entities.Flight;
import entities.Passenger;
import entities.User;

/**
 * Session Bean implementation class BookingBean
 */
@Stateless
@LocalBean
public class BookingBean {

    /**
     * Default constructor. 
     */
	@EJB
	private FlightDAO flightdao;
	@EJB
	private BookingDAO bookingdao;
	@EJB
	private PassengerDAO passengerdao;
	
    public BookingBean() {
        // TODO Auto-generated constructor stub
    }
    
    public List<Flight> getFlights(String origin_city, String destination_city, String date, int nr_of_tickets){
    	return flightdao.getFlights(origin_city, destination_city, date, nr_of_tickets);   	
    }
    
    public boolean bookFlights(List<Passenger> passengers, List<Flight> flights, User user){
    	boolean passenger_successful = false;
		boolean booking_sucessful = false;
		boolean user_exists = false;
    	
    	for(Passenger p:passengers){
    		for(Flight f:flights){
    			booking_sucessful = bookingdao.addBooking(p, f, user);
    			System.out.println(booking_sucessful);
    		}
    	}
    	for(Passenger p:passengers){
    		user_exists = passengerdao.exists(p);
    		if(!user_exists){
    			passenger_successful = passengerdao.addPassenger(p);
    		}
    		passenger_successful = passenger_successful||user_exists;
    	}
    	return passenger_successful&&booking_sucessful;
    }

	public boolean deleteBooking(String flight_id, String date, int passportnr) {
		return bookingdao.deleteBooking(flight_id, date, passportnr);
	}

}
