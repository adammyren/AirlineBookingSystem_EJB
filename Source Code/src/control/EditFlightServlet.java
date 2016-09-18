package control;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Flight;
import model.AdminBean;

/**
 * Servlet implementation class EditFlightServlet
 */
@WebServlet("/EditFlightServlet")
public class EditFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	@EJB
	private AdminBean adminbean;
	
    public EditFlightServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String flight_id = request.getParameter("flight_id");
		String date = request.getParameter("date");
		String departure_time = request.getParameter("departure_time");
		String duration = request.getParameter("duration");
		String origin = request.getParameter("origin");
		String destination = request.getParameter("destination");
		Integer capacity = Integer.parseInt(request.getParameter("capacity"));
		String price = request.getParameter("price");
		Flight new_flight = new Flight(flight_id, date, departure_time, duration, capacity, origin, destination, price);
		
		boolean update_successful = adminbean.updateFlight(flight_id, date, new_flight);
		if(update_successful){
			response.sendRedirect("AdminPage.jsp");
			return;
		}else{
			request.setAttribute("update_error", true);
			request.getRequestDispatcher("FlightInformationServlet").forward(request, response);;
		}
	}

}
