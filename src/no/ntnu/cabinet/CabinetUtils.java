package no.ntnu.cabinet;

import java.util.Date;
import java.util.Calendar;
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
	
	public static String ValidateBookingDates(Date from, Date to) {
	 	Calendar cal = Calendar.getInstance();
	 	cal.set(Calendar.HOUR_OF_DAY, 0);
	 	cal.set(Calendar.MINUTE, 0);
	 	cal.set(Calendar.SECOND, 0);
	 	cal.set(Calendar.MILLISECOND, 0);
	   	
	 	if(from.after(to)) {
	   		return "Start date is after end date.";
		}
	 	
	 	if(cal.getTime().after(from)) {
	   		return "Can't book in the past.";
	   	}
	 	
	 	cal.add(Calendar.MONTH, 6);
	 	if(cal.getTime().before(to)) {
	 		return "Attempted to book too far (6 months) in the future.";
	 	}
	 	
	 	cal.setTime(from);
	 	cal.add(Calendar.DAY_OF_MONTH, 6);
	 	if(cal.getTime().before(to)) {
	 		return "Can only book up to 7 days at a time.";
	 	}
	 	
		return null;
	}
}
