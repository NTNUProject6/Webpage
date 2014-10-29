package no.ntnu.cabinet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
		String date_string = request.getParameter("day")
		   		+ "-" + request.getParameter("month") 
		   		+ "-" + request.getParameter("year");
		Date date;
		SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy");
	   	try {
			date = sdf.parse(date_string);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return;
		}
		
		Report report = new Report();
		report.setCabin_id(Integer.parseInt(request.getParameter("cabin_id")));
		report.setBooking_id(0);
		report.setWood(Integer.parseInt(request.getParameter("wood")));
		report.setDamage(request.getParameter("damage"));
		report.setMissing(request.getParameter("missing"));
		report.setOther(request.getParameter("other"));
		report.setEmail(request.getParameter("email"));
		report.setReport_date(date);
		Database db = new Database();
		db.addReport(report);
		db.close();
		
		// TODO: Report success back to user
		response.sendRedirect("index.jsp");
	}

}
