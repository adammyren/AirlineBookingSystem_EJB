package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateful;

import entities.Booking;
import entities.Flight;
import entities.Passenger;
import entities.User;

/**
 * Session Bean implementation class BookingDAO
 */
@Stateful
@LocalBean
public class BookingDAO {
	
	private final String DBusername = "AirlineConnect";
	private final String DBpassword = "hej123";
	private final String DBurl = "jdbc:mysql://localhost/AirlineBookingSystem";


    public BookingDAO() {
    }
    
    public boolean addBooking(Passenger passenger, Flight flight, User user){
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(DBurl,DBusername,DBpassword);
			Statement stmt = (Statement) con.createStatement();
			String query = "INSERT INTO Bookings VALUES ('" + flight.getId()+"','"+passenger.getPassportnr()
			+ "','" + user.getUsername() +
			"','confirmed','"+flight.getDate() + "')";
			stmt.executeUpdate(query);
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Sorry failed to connect to the Database. " + e.getMessage());
			return false;
		}	
		
    }
	

	public List<Booking> getBookings(User user) {
   	List<Booking> theList = new ArrayList<Booking>();
    	try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(DBurl,DBusername,DBpassword);
			Statement stmt = (Statement) con.createStatement();
			String query = "SELECT * FROM Bookings WHERE user='"+user.getUsername()+"'";
			ResultSet rs = stmt.executeQuery(query);
			Booking booking;
			while(rs.next()){
				booking = new Booking(rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5));
				theList.add(booking);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Sorry failed to connect to the Database. " + e.getMessage());
		}
		return theList;
	}

	public boolean deleteBooking(String flight_id, String date, int passportnr) {
    	try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(DBurl,DBusername,DBpassword);
			Statement stmt = (Statement) con.createStatement();
			String query = "DELETE FROM Bookings WHERE flight='"+flight_id+
					"' AND date ='" + date +
					"' AND passenger ='" + passportnr +"'";
			stmt.executeUpdate(query);
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Sorry failed to connect to the Database. " + e.getMessage());
			return false;
		}
	}

	public ArrayList<Booking> getBookings(String flight_id, String date) {
	   	ArrayList<Booking> theList = new ArrayList<Booking>();
    	try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(DBurl,DBusername,DBpassword);
			Statement stmt = (Statement) con.createStatement();
			String query = "SELECT * FROM Bookings WHERE flight='"+flight_id+"' AND date ='" + date + "'";
			ResultSet rs = stmt.executeQuery(query);
			Booking booking;
			while(rs.next()){
				booking = new Booking(rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5));
				theList.add(booking);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Sorry failed to connect to the Database. " + e.getMessage());
		}
		return theList;
	}
}
