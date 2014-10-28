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
	
	public void close() {
		if(connection != null) {
			try {
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void addBooking(Booking booking){
		try{
			statement = connection.createStatement();
			String query = "INSERT INTO bookings (user_id, cabin_id, date_from, date_to) "
					+ "VALUES (?, ?, ?, ?)";
			PreparedStatement pStatement = connection.prepareStatement(query); 
			pStatement.setString(1, booking.getUser_id());
			pStatement.setInt(2, booking.getCabin_id());
			pStatement.setDate(3, new java.sql.Date(booking.getDate_From().getTime()));
			pStatement.setDate(4, new java.sql.Date(booking.getDate_To().getTime()));
			
			pStatement.execute();
			
			statement.close();
		} catch (Exception e){
			e.printStackTrace();
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
	
	public void addReport(Report report) {
		try{
			statement = connection.createStatement();
			String query = "INSERT INTO reports (cabin_id, wood, damage, missing, email, report_date) "
					+ "VALUES (1, ?, ?, ?, ?, ?)";
			PreparedStatement pStatement = connection.prepareStatement(query); 
			pStatement.setInt(1, report.getWood());
			pStatement.setString(2, report.getDamage());
			pStatement.setString(3, report.getMissing());
			pStatement.setString(4, report.getEmail());
			pStatement.setDate(5, new java.sql.Date(report.getReport_date().getTime()));
			//pStatement.setInt(1, report.getBooking_id());

			pStatement.execute();
			
			statement.close();
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	
}
