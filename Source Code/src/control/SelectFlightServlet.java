package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Flight;
import entities.User;

/**
 * Servlet implementation class SelectFlightServlet
 */
@WebServlet("/SelectFlightServlet")
public class SelectFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFlightServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<Flight> list_of_flights = (ArrayList<Flight>)request.getSession().getAttribute("list_of_flights");	
		request.getSession().removeAttribute("list_of_flights");
		request.getSession().setAttribute("flight", list_of_flights.get(Integer.parseInt(request.getParameter("flight"))));
		System.out.println(request.getSession().getAttribute("return_ticket"));
		if((Boolean)request.getSession().getAttribute("return_ticket")){
			ArrayList<Flight> list_of_returns = (ArrayList<Flight>)request.getSession().getAttribute("list_of_returns");
			request.getSession().removeAttribute("list_of_returns");
			request.getSession().setAttribute("return", list_of_returns.get(Integer.parseInt(request.getParameter("return"))));
		}
		
		User user = (User) request.getSession().getAttribute("user");
		if(user==null)
			request.getRequestDispatcher("/Login.jsp").forward(request, response);
		else
			request.getRequestDispatcher("/PutInformation.jsp").forward(request, response);
	}

		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
