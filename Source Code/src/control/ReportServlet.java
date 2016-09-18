package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Entity;
import entities.Passenger;
import entities.User;
import model.AdminBean;

/**
 * Servlet implementation class ReportServlet
 */
@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	
	@EJB
	private AdminBean adminbean;
	
    public ReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String type_of_entity = request.getParameter("type_of_entity");
		switch(type_of_entity){
		case "passenger":
			ArrayList<Passenger> list_of_passengers = adminbean.getPassengers(request.getParameter("flight_id"), request.getParameter("date"));
			request.setAttribute("entities", list_of_passengers);
			request.getRequestDispatcher("/DisplayReport.jsp").forward(request, response);
			return;
		case "user":
			ArrayList<User> list_of_users = adminbean.getAllUsers();
			request.setAttribute("entities", list_of_users);
			request.getRequestDispatcher("/DisplayReport.jsp").forward(request, response);
			return;
		
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
