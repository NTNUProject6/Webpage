package no.ntnu.cabinet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import no.ntnu.cabinet.database.Database;

/**
 * Servlet implementation class CancelBooking
 */
@WebServlet("/CancelBooking")
public class CancelBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelBooking() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!CabinetUtils.IsAdmin(request.getSession()))
			request.getRequestDispatcher("WEB-INF/notadmin.jsp").forward(request, response);

		int id;
		try {
	 		id = Integer.parseInt(request.getParameter("id"));
	 	} catch (NumberFormatException e) {
			RequestDispatcher erd = request.getRequestDispatcher("WEB-INF/cancel_error.jsp");
	 		request.setAttribute("error", "Invalid booking ID.");
			erd.forward(request, response);
			return;
	 	}
		
		Database db = new Database();
		db.deleteBooking(id);
		db.close();
		
		String filter_string = request.getParameter("filter");
		if(filter_string != null) {
			try {
				int filter = Integer.parseInt(filter_string);
				response.sendRedirect("booking_log.jsp?filter=" + filter);
				return;
			} catch(Exception e) {
				response.sendRedirect("booking_log.jsp");
				return;
			}
			
		}
		response.sendRedirect("booking_log.jsp");
		return;
	}

}
