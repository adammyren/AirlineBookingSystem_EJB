package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.management.RuntimeErrorException;

import entities.Flight;
import entities.Passenger;
import entities.User;

/**
 * Session Bean implementation class PassengerDAO
 */
@Stateless
@LocalBean
public class PassengerDAO {

	private final String DBusername = "AirlineConnect";
	private final String DBpassword = "hej123";
	private final String DBurl = "jdbc:mysql://localhost/AirlineBookingSystem";

	public PassengerDAO() {
	}

	public Passenger getPassenger(String passportnr) {

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(DBurl, DBusername, DBpassword);
			Statement stmt = (Statement) con.createStatement();
			String query = "SELECT * FROM Passenger WHERE passportnr='" + passportnr + "'";
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			Passenger passenger = new Passenger(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
					rs.getString(5), rs.getString(6));
			return passenger;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Sorry failed to connect to the Database. " + e.getMessage());
		}
		return null;
	}

	public boolean addPassenger(Passenger p) {

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(DBurl, DBusername, DBpassword);
			Statement stmt = (Statement) con.createStatement();
			String query = "INSERT INTO Passenger VALUES ('" + p.getPassportnr() + "','" + p.getFirstname() + "','"
					+ p.getLastname() + "','" + p.getPassportexp() + "','" + p.getPassportish() + "','" + p.getBirth()
					+ "')";
			stmt.executeUpdate(query);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Sorry failed to connect to the Database. " + e.getMessage());
			return false;
		}
	}

	public boolean exists(Passenger passenger) {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(DBurl, DBusername, DBpassword);
			Statement stmt = (Statement) con.createStatement();
			String query = "SELECT * FROM Passenger WHERE passportnr='" + passenger.getPassportnr() + "'";
			ResultSet rs = stmt.executeQuery(query);
			return rs.next();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Sorry failed to connect to the Database. " + e.getMessage());
			throw new RuntimeErrorException(null, "NOT ABLE TO CONNECT");
		}
	}

}
