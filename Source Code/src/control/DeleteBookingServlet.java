package control;

import java.io.IOException;

import javax.ejb.EJB;
import javax.management.RuntimeErrorException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BookingBean;

/**
 * Servlet implementation class DeleteBookingServlet
 */
@WebServlet("/DeleteBookingServlet")
public class DeleteBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	@EJB
	BookingBean bookingbean;

	public DeleteBookingServlet() {
		super();
		// TODO Auto-generated constructor stub
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
		// TODO Auto-generated method stub
		String flight_id = request.getParameter("flight_id");
		String date = request.getParameter("date");
		int passportnr = Integer.parseInt(request.getParameter("passportnr"));

		boolean delete_successful = bookingbean.deleteBooking(flight_id, date, passportnr);
		if (!delete_successful) {
			throw new RuntimeErrorException(null, "KUNDE INTE TA BORT" + flight_id);
		}
		response.sendRedirect("MyPagesServlet");
	}

}
