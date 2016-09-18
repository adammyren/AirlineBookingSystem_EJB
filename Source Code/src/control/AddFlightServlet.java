package control;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AdminBean;

/**
 * Servlet implementation class AddFlightServlet
 */
@WebServlet("/AddFlightServlet")
public class AddFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	@EJB
	AdminBean adminbean;

	public AddFlightServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String flight_id = request.getParameter("flight_id");
		String date = request.getParameter("date");
		String departure_time = request.getParameter("departure_time");
		String duration = request.getParameter("duration");
		String origin = request.getParameter("origin");
		String destination = request.getParameter("destination");
		String price = request.getParameter("price");
		Integer capacity = 0;
		try {
			capacity = Integer.parseInt(request.getParameter("capacity"));
		} catch (Exception e) {
			request.setAttribute("add_flight_error", true);
			request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
			return;
		}

		boolean add_successful = adminbean.addNewFlight(flight_id, date, departure_time, duration, capacity, origin,
				destination,price);

		if (add_successful)
			response.sendRedirect("AdminPage.jsp");
		else {
			request.setAttribute("add_flight_error", true);
			request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
		}
	}

}
