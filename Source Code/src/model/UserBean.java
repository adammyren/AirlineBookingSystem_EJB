package model;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import dao.BookingDAO;
import dao.FlightDAO;
import dao.PassengerDAO;
import dao.UserDAO;
import entities.User;
import entities.Booking;
import entities.Flight;
import entities.MyPagesBookingElement;
import entities.Passenger;

/**
 * Session Bean implementation class UserBean
 */
@Stateless
@LocalBean
public class UserBean {
	
	@EJB
	private UserDAO userdao;
	
	@EJB
	private FlightDAO flightdao;
	
	@EJB
	private BookingDAO bookingdao;
	
	@EJB
	private PassengerDAO passengerdao;

    /**
     * Default constructor. 
     */
    public UserBean() {
        // TODO Auto-generated constructor stub
    }
    
    public boolean addNewUser(User user){
    	return userdao.add(user);
    }

	public boolean exists(String username, String password) {
		return userdao.exists(username, password);
	}

	public List<MyPagesBookingElement> getBookingElements(User user) {
		ArrayList<Booking> list_of_bookings = (ArrayList<Booking>) bookingdao.getBookings(user);
		ArrayList<MyPagesBookingElement> booking_elements = new ArrayList<MyPagesBookingElement>();
		MyPagesBookingElement booking_element;
		for(Booking b:list_of_bookings){
			Flight f = flightdao.getFlight(b.getFlight_id(), b.getDate());
			Passenger p = passengerdao.getPassenger(b.getPassenger());
			if(f!=null&&b!=null){
			booking_element = new MyPagesBookingElement(f.getId(), f.getDate(), f.getDeparture_time(), f.getDuration(),
														f.getOrigin(), f.getDestination(),
														p.getFirstname(), p.getLastname(),
														p.getPassportnr());
			booking_elements.add(booking_element);
			}
		}
		return booking_elements;
	}

	public User getUser(String username) {
		return userdao.getUser(username);
	}

}
