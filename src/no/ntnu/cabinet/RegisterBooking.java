package no.ntnu.cabinet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import java.text.SimpleDateFormat;
import java.util.Date;

import no.ntnu.cabinet.CabinetUtils;
import no.ntnu.cabinet.database.Database;
import no.ntnu.cabinet.database.Booking;

/**
 * Servlet implementation class RegisterBooking
 */
@WebServlet("/RegisterBooking")
public class RegisterBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterBooking() {
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
	 	request.setCharacterEncoding("UTF-8");
	 	RequestDispatcher erd = request.getRequestDispatcher("WEB-INF/register_error.jsp");
	 	
	 	SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy");
	 	Date from_date;
	 	Date to_date;
	 	try {
			from_date = sdf.parse(request.getParameter("from_date"));
			to_date = sdf.parse(request.getParameter("to_date"));
		} catch (Exception e) {
			request.setAttribute("error", "Invalid date values.");
			erd.forward(request, response);
			return;
		}
	 	
	 	String date_error = CabinetUtils.ValidateBookingDates(from_date, to_date);
	 	if(date_error != null) {
	 		request.setAttribute("error", date_error);
	 		erd.forward(request, response);
	 	}
	 	
	 	int cabin_id;
	 	try {
	 		cabin_id = Integer.parseInt(request.getParameter("cabins"));
	 	} catch (NumberFormatException e) {
			request.setAttribute("error", "No cabin selection.");
			erd.forward(request, response);
			return;
	 	}
	 	
	 	if((cabin_id < 1) || (cabin_id > 23)) {
			request.setAttribute("error", "Invalid cabin selection.");
			erd.forward(request, response);
			return;
	 	}
	 	
	 	String email = request.getParameter("email");
	 	if(email == null || email.isEmpty()) {
			request.setAttribute("error", "Invalid e-mail.");
			erd.forward(request, response);
			return;
	 	}
	 	
	 	int booking_id = -1;
		if(CabinetUtils.BookingCollides(cabin_id, from_date, to_date)) {
			request.setAttribute("error", "Booking period collides with an existing booking.");
			erd.forward(request, response);
			return;
		} else {
			Database db = new Database();
			Booking booking =  new Booking();
			booking.setCabin_id(cabin_id);
			booking.setDate_From(from_date);
			booking.setDate_To(to_date);
			booking.setUser_id(email);
			booking_id = db.addBooking(booking);
			db.close();
		}
		
		if(cabin_id < 0) {
			request.setAttribute("error", "Unknown error booking.");
			erd.forward(request, response);
			return;
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/register_confirmation.jsp");
		request.setAttribute("booking_id", booking_id);
		rd.forward(request, response);
	}

}
