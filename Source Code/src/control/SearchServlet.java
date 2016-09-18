package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import dao.AirportDAO;
import entities.Flight;
import model.BookingBean;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
	@EJB
	BookingBean booking_bean;
	
    public SearchServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date = request.getParameter("date");
		String[] origin = request.getParameter("origin").split("-");
		String[] destination = request.getParameter("destination").split("-");
		int nr_of_tickets = Integer.parseInt(request.getParameter("nr_of_tickets"));
		String origin_city ="";
		String origin_id="";
		String destination_city="";
		String destination_id="";
		try{
			origin_city = origin[0].replace(" ","");
			origin_id = origin[1].replace(" ","");
			destination_city = destination[0].replace(" ","");
			destination_id = destination[1].replace(" ","");
		}
		catch (Exception e) {
			response.sendRedirect("IndexServlet");
			return;
		}
		
		boolean return_ticket =  Boolean.parseBoolean(request.getParameter("type_of_flight"));
		
		ArrayList<Flight> flight_list = (ArrayList<Flight>) booking_bean.getFlights(origin_id, destination_id, date, nr_of_tickets);
		request.getSession().setAttribute("list_of_flights", flight_list);
		request.getSession().setAttribute("return_ticket", false); //Default
		request.getSession().setAttribute("nr_of_tickets", nr_of_tickets);
		request.getSession().setAttribute("booking_active", true);
		ArrayList<Flight> return_list = new ArrayList<Flight>();
		if(return_ticket){
			String return_date = request.getParameter("return_date");
			return_list = (ArrayList<Flight>) booking_bean.getFlights(destination_id, origin_id, return_date, nr_of_tickets);
			request.getSession().setAttribute("return_ticket", true);
		}		
		request.getSession().setAttribute("list_of_returns", return_list);
		request.getRequestDispatcher("/SelectFlight.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
