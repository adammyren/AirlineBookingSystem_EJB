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

import entities.Booking;
import entities.Flight;
import entities.Passenger;
import entities.User;

/**
 * Session Bean implementation class UserDAO
 */
@Stateless
@LocalBean
public class UserDAO {
	
	private final String DBusername = "AirlineConnect";
	private final String DBpassword = "hej123";
	private final String DBurl = "jdbc:mysql://localhost/AirlineBookingSystem";


    public UserDAO() {
    }

	public boolean add(User user) {
    	try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(DBurl,DBusername,DBpassword);
			Statement stmt = (Statement) con.createStatement();
			String query = "INSERT INTO Users VALUES ('" + user.getUsername()+"','"+user.getPassword()+"','"+user.getEmail()
			+ "','" + user.isAdmin() + "')";
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

	public boolean exists(String username, String password) {
    	try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(DBurl,DBusername,DBpassword);
			Statement stmt = (Statement) con.createStatement();
			String query = "SELECT * FROM Users WHERE username='"+username+"'AND password ='"+password+"'";
			ResultSet rs = stmt.executeQuery(query);
			return rs.next();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Sorry failed to connect to the Database. " + e.getMessage());
			throw new RuntimeErrorException(null,"NOT ABLE TO CONNECT");
		}
	}
	
	public User getUser(String username) {
    	try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(DBurl,DBusername,DBpassword);
			Statement stmt = (Statement) con.createStatement();
			String query = "SELECT * FROM Users WHERE username='"+username+"'";
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			return new User(rs.getString(1), rs.getString(2),rs.getString(3), rs.getBoolean(4));
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Sorry failed to connect to the Database. " + e.getMessage());
			throw new RuntimeErrorException(null,"NOT ABLE TO CONNECT");
		}
	}

	public ArrayList<User> getAll() {
	   	List<User> theList = new ArrayList<User>();
    	try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(DBurl,DBusername,DBpassword);
			Statement stmt = (Statement) con.createStatement();
			String query = "SELECT * FROM Users";
			ResultSet rs = stmt.executeQuery(query);
			User user;
			while(rs.next()){
				user = new User(rs.getString(1), rs.getString(2),rs.getString(3), false);
				theList.add(user);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Sorry failed to connect to the Database. " + e.getMessage());
		}
		return (ArrayList<User>) theList;
	}

}
