package no.ntnu.cabinet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import no.ntnu.cabinet.database.Database;
import no.ntnu.cabinet.database.Report;

/**
 * Servlet implementation class RegisterReport
 */
@WebServlet("/RegisterReport")
public class RegisterReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterReport() {
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
	 	RequestDispatcher erd = request.getRequestDispatcher("WEB-INF/report_error.jsp");

		String date_string = request.getParameter("day")
		   		+ "-" + request.getParameter("month") 
		   		+ "-" + request.getParameter("year");
		Date date;
		SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy");
	   	try {
			date = sdf.parse(date_string);
		} catch (ParseException e) {
			request.setAttribute("error", "Invalid report date.");
			erd.forward(request, response);
			return;
		}
	   	
	   	int cabin_id;
	   	try {
	   		cabin_id = Integer.parseInt(request.getParameter("cabin_id"));
	   	} catch(Exception e) {
			request.setAttribute("error", "Invalid cabin id.");
			erd.forward(request, response);
			return;
	   	}
	   	
	   	if(cabin_id < 0 || cabin_id > 23) {
			request.setAttribute("error", "Invalid cabin id.");
			erd.forward(request, response);
			return;
	   	}
	   	
	   	int wood;
	   	try {
	   		wood = Integer.parseInt(request.getParameter("wood"));
	   	} catch(Exception e) {
			request.setAttribute("error", "Invalid wood count.");
			erd.forward(request, response);
			return;
	   	}
	   	
	   	if(wood < 0) {
			request.setAttribute("error", "Negative wood count.");
			erd.forward(request, response);
			return;
	   	}
	   	
	   	String email = request.getParameter("email");
	   	if(email == null || email.isEmpty()) {
			request.setAttribute("error", "Missing contact information (e-mail).");
			erd.forward(request, response);
			return;
	   	}
	   	
	   	String damage = request.getParameter("damage");
	   	if(damage == null) damage = "";
	   	String missing = request.getParameter("missing");
	   	if(missing == null) missing = "";
	   	String other = request.getParameter("other");
	   	if(other == null) other = "";
		
		Report report = new Report();
		report.setCabin_id(cabin_id);
		report.setBooking_id(0);
		report.setWood(wood);
		report.setDamage(damage);
		report.setMissing(missing);
		report.setOther(other);
		report.setEmail(email);
		report.setReport_date(date);
		Database db = new Database();
		int report_id = db.addReport(report);
		db.close();
		
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/report_confirmation.jsp");
		request.setAttribute("report_id", report_id);
		rd.forward(request, response);
		
	}

}
