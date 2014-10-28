package no.ntnu.cabinet;

import java.util.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import no.ntnu.cabinet.database.Database;
import no.ntnu.cabinet.database.Booking;

public class CabinetUtils {
	public static boolean BookingCollides(int cabin_id, Date from_date, Date to_date) {
		Database db = new Database();
		ArrayList<Booking> bookings = db.getBooking(cabin_id);
		db.close();
		for(Booking b : bookings) {
			if(to_date.compareTo(b.getDate_To()) <= 0 && to_date.compareTo(b.getDate_From()) >= 0)
				return true;
			else if(from_date.compareTo(b.getDate_To()) <= 0 && from_date.compareTo(b.getDate_From()) >= 0)
				return true;
		}
		return false;
	}
	
	public static boolean IsAdmin(HttpSession session) {
		return (session.getAttribute("isAdmin") != null &&
				(Boolean)session.getAttribute("isAdmin") == true);
	}
}
