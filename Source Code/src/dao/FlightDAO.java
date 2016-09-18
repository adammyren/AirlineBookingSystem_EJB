package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.management.RuntimeErrorException;

import entities.Flight;
import entities.Passenger;
import entities.User;

/**
 * Session Bean implementation class FlightDAO
 */
@Stateless
@LocalBean
public class FlightDAO {


	private final String DBusername = "AirlineConnect";
	private final String DBpassword = "hej123";
	private final String DBurl = "jdbc:mysql://localhost/AirlineBookingSystem";

	public FlightDAO() {
	}

	public List<Flight> getFlights(String origin, String destination, String date, int nr_of_tickets) {
		List<Flight> theList = new ArrayList<Flight>();
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(DBurl, DBusername, DBpassword);
			Statement stmt = (Statement) con.createStatement();
			String query = "SELECT * FROM Flights WHERE origin='" + origin + "' AND destination ='" + destination
					+ "' AND freeseats >=" + nr_of_tickets + " AND date='" + date + "'";
			System.out.println(query);
			ResultSet rs = stmt.executeQuery(query);
			Flight flight;
			while (rs.next()) {
				flight = new Flight(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
						rs.getString(7), rs.getString(8), rs.getString(9));
				theList.add(flight);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Sorry failed to connect to the Database. " + e.getMessage());
		}
		return theList;
	}

	public Flight getFlight(String flight_id, String date) {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(DBurl, DBusername, DBpassword);
			Statement stmt = (Statement) con.createStatement();
			String query = "SELECT * FROM Flights WHERE id='" + flight_id + "'AND date ='" + date + "'";
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			Flight flight = new Flight(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
					rs.getString(7), rs.getString(8), rs.getString(9));
			return flight;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Sorry failed to connect to the Database. " + e.getMessage());
		}
		return null;
	}

	public boolean exists(String flight_id, String date) {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(DBurl, DBusername, DBpassword);
			Statement stmt = (Statement) con.createStatement();
			String query = "SELECT * FROM Flights WHERE id='" + flight_id + "'AND date ='" + date + "'";
			ResultSet rs = stmt.executeQuery(query);
			return rs.next();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Sorry failed to connect to the Database. " + e.getMessage());
			return false;
		}
	}

	public boolean add(Flight flight) {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(DBurl, DBusername, DBpassword);
			Statement stmt = (Statement) con.createStatement();
			String query = "INSERT INTO Flights VALUES ('" + flight.getId() + "','" + flight.getDate() + "','"
					+ flight.getDeparture_time() + "','" + flight.getDuration() + "','" + flight.getCapacity() + "','"
					+ flight.getFree_seats() + "','" + flight.getOrigin() + "','" + flight.getDestination() + "','" + flight.getPrice()+"')";
			System.out.println(query);
			stmt.executeUpdate(query);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Sorry failed to connect to the Database. " + e.getMessage());
			return false;
		}
	}

	public boolean update(String flight_id, String date, Flight new_flight) {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(DBurl, DBusername, DBpassword);
			Statement stmt = (Statement) con.createStatement();
			String query = "UPDATE Flights SET departuretime='" + new_flight.getDeparture_time() + "', duration ='"
					+ new_flight.getDuration() + "',capacity ='" + new_flight.getCapacity() + "', origin='"
					+ new_flight.getOrigin() + "',destination='" + new_flight.getDestination() + "',price='" + new_flight.getPrice()+ "' WHERE id='"
					+ flight_id + "' AND date ='" + date + "'";
			System.out.println(query);
			stmt.executeUpdate(query);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Sorry failed to connect to the Database. " + e.getMessage());
			return false;
		}
	}

}
