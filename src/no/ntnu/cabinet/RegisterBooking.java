package no.ntnu.cabinet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.text.ParseException;
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
		SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy");
	 	Date from_date;
	 	Date to_date;
	 	try {
			from_date = sdf.parse(request.getParameter("from_date"));
			to_date = sdf.parse(request.getParameter("to_date"));
		} catch (ParseException e) {
			e.printStackTrace();
			// TODO: Error page?
			return;
		}
	 	int cabin_id = Integer.parseInt(request.getParameter("cabins"));
		if(!CabinetUtils.BookingCollides(cabin_id, from_date, to_date)) {
			Database db = new Database();
			Booking booking =  new Booking();
			booking.setCabin_id(cabin_id);
			booking.setDate_From(from_date);
			booking.setDate_To(to_date);
			booking.setUser_id(request.getParameter("email"));
			db.addBooking(booking);
			db.close();
		}
		
		// TODO: Redirect to a page depending on whether the booking succeeded or failed
		response.sendRedirect("index.jsp");
	}

}
