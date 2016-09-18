package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.Local;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import entities.Airport;

/**
 * Session Bean implementation class AirportDAO
 */
@LocalBean
@Stateless
public class AirportDAO {


	private final String DBusername = "AirlineConnect";
	private final String DBpassword = "hej123";
	private final String DBurl = "jdbc:mysql://localhost/AirlineBookingSystem";
	
    public AirportDAO() {
    }
    

	public List<Airport> getAirportID(String city) {
		ArrayList<Airport> the_list = new ArrayList<Airport>();
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = (Connection) DriverManager.getConnection(DBurl,DBusername,DBpassword);
			Statement stmt = (Statement) con.createStatement();
			String query = "SELECT * FROM Airports WHERE city='"+city+"'";
			ResultSet rs = stmt.executeQuery(query);
			
			Airport airport;
			while(rs.next()){
				airport = new Airport(rs.getString(1), city);
				the_list.add(airport);	
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Sorry failed to connect to the Database. " + e.getMessage());
		}
		return the_list;
	}
    


}
