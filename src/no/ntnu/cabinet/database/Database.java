package no.ntnu.cabinet.database;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Database {
	
	private static java.sql.Connection connection;
	private static java.sql.Statement statement;
	
	private static String url = "jdbc:mysql://cabinet-ntnu.no-ip.org/cabinet",
					username = "cabinet", password = "CabiNet";
			
	public Database(){
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			connection = DriverManager.getConnection(url, username, password);
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void addBooking(Booking booking){
		try{
			statement = connection.createStatement();
			String query = "INSERT INTO cabins (user_id, cabin_id, date_from, date_to) "
					+ "VALUES (?, ?, ?, ?)";
			PreparedStatement pStatement = connection.prepareStatement(query); 
			pStatement.setString(1, booking.getUser_id());
			pStatement.setInt(2, booking.getCabin_id());
			pStatement.setDate(3, booking.getDate_From());
			pStatement.setDate(4, booking.getDate_To());
			
			pStatement.execute();
			
			statement.close();
		} catch (Exception e){
			System.err.println("Got an exception!");
		    System.err.println(e.getMessage());
		}
	}
	
	public ArrayList<Booking> getBooking(int cabin_id){
		ArrayList<Booking> ab = new ArrayList<Booking>();
		try{
			statement = connection.createStatement();
			String sql = "select * from bookings where cabin_id = " + cabin_id + " order by date_from asc";
			ResultSet rs = statement.executeQuery(sql);
			while(rs.next()){
				Booking b = new Booking();
				b.setId(rs.getInt("booking_id"));
				b.setUser_id(rs.getString("user_id"));
				b.setCabin_id(rs.getInt("cabin_id"));
				b.setDate_From(rs.getDate("date_from"));
				b.setDate_To(rs.getDate("date_to"));
				ab.add(b);
			}
			rs.close();
			statement.close();
		} catch(SQLException se){
			se.printStackTrace();
		}
		return ab;
	}
	
	public static void main(String[] args){
		Database db = new Database();
		Booking booking1 = new Booking();
		booking1.setUser_id("Hello mtfk");
		booking1.setCabin_id(1);
		booking1.setDate_From(new Date(2014,11,1));
		booking1.setDate_To(new Date(2014,11,7));
		db.addBooking(booking1);
		
		ArrayList<Booking> ab = new ArrayList<Booking>();
		ab = db.getBooking(1);
		for(Booking b : ab){
			System.out.println("////////////////////////////////");
			System.out.println("booking_id:	" + b.getId());
			System.out.println("user_id:	" + b.getUser_id());
			System.out.println("cabin_id:	" + b.getCabin_id());
			System.out.println("date_from:	" + b.getDate_From());
			System.out.println("date_to:	" + b.getDate_To());
		}

	}
}
