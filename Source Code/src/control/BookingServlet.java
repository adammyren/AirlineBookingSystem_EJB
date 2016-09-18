package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.ejb.EJB;
import javax.management.RuntimeErrorException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Flight;
import entities.Passenger;
import entities.User;
import model.BookingBean;

/**
 * Servlet implementation class BookingServlet
 */
@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	@EJB
	private BookingBean booking_bean;
	
    public BookingServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Passenger> list_of_passengers = new ArrayList<Passenger>();
		ArrayList<Flight> list_of_flights = new ArrayList<Flight>();
		int nr_of_tickets = (int) request.getSession().getAttribute("nr_of_tickets");
		User user = (User)request.getSession().getAttribute("user");
		boolean return_ticket = (boolean)request.getSession().getAttribute("return_ticket");
		Passenger p;
		for(int i = 1;i<=nr_of_tickets;i++){
			p = new Passenger(request.getParameter("passportnr"+i),
					request.getParameter("firstname"+i),
					request.getParameter("lastname"+i),
					request.getParameter("passportexp"+i),
					request.getParameter("passportish"+i),
					request.getParameter("birth"+i));
			list_of_passengers.add(p);
		}
		list_of_flights.add((Flight)request.getSession().getAttribute("flight"));
		if(return_ticket)
			list_of_flights.add((Flight)request.getSession().getAttribute("return"));

		boolean booking_sucecssful = booking_bean.bookFlights(list_of_passengers, list_of_flights, user);
		
		if(!booking_sucecssful){
			request.setAttribute("book_error", true);
			request.getRequestDispatcher("PutInformation.jsp").forward(request, response);
			return;
		}
		request.getSession().removeAttribute("flight");
		request.getSession().removeAttribute("return");
		request.getSession().removeAttribute("nr_of_tickets");
		request.getSession().removeAttribute("return_ticket");
		response.sendRedirect("MyPagesServlet");
	}

}
