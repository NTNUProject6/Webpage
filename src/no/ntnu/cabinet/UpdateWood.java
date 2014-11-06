package no.ntnu.cabinet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import no.ntnu.cabinet.database.*;

/**
 * Servlet implementation class UpdateWood
 */
@WebServlet("/UpdateWood")
public class UpdateWood extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateWood() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cabin_id;
		int wood;
	 	try {
	 		cabin_id = Integer.parseInt(request.getParameter("cabin"));
	 		wood = Integer.parseInt(request.getParameter("wood"));
	 	} catch (NumberFormatException e) {
	 		response.sendRedirect("wood_status.jsp");
			return;
	 	}
	 	
	 	Report r = new Report();
	 	Database db = new Database();
	 	
	 	r.setWood(wood);
	 	r.setCabin_id(cabin_id);
	 	r.setReport_date(new Date());
	 	
	 	db.updateWood(r);
	 	response.sendRedirect("wood_status.jsp");
	}

}
