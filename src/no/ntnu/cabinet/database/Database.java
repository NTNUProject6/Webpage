package no.ntnu.cabinet.database;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Database {
	private java.sql.Connection connection;
	private java.sql.Statement statement;

	private static String url = "jdbc:mysql://cabinet-ntnu.no-ip.org/cabinet",
					username = "cabinet", password = "CabiNet";

	public Database() {
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

	/**
	 * Close the JDBC connection
	 *
	 * This should be done whenever we are done with a Database instance
	 * to minimise the amount of open connections to our database.
	 */
	public void close() {
		if(connection != null) {
			try {
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public int addBooking(Booking booking) {
		int id;
		PreparedStatement pStatement = null;
		ResultSet rs = null;
		try{
			statement = connection.createStatement();
			String query = "INSERT INTO bookings (user_id, cabin_id, date_from, date_to) "
					+ "VALUES (?, ?, ?, ?)";
			pStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS); 
			pStatement.setString(1, booking.getUser_id());
			pStatement.setInt(2, booking.getCabin_id());
			pStatement.setDate(3, new java.sql.Date(booking.getDate_From().getTime()));
			pStatement.setDate(4, new java.sql.Date(booking.getDate_To().getTime()));

			pStatement.execute();
			rs = pStatement.getGeneratedKeys();

			if(rs.next())
				id = rs.getInt(1);
			else
				id = -2;

		} catch (Exception e) {
			e.printStackTrace();
			id = -1;
		} finally {
			try{ if(rs != null) rs.close(); } catch(Exception e) {};
			try{ if(statement != null) statement.close(); } catch(Exception e) {};
		}
		return id;
	}

	public void deleteBooking(int id) {
		try{
		statement = connection.createStatement();
		String query = "DELETE FROM bookings WHERE booking_id=" + id;
		statement.execute(query);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try{ if(statement != null) statement.close(); } catch(Exception e) {};
		}
	}
	
	public Booking getBookingById(int booking_id) {
		Booking b = new Booking();
		ResultSet rs = null;
		
		try{
			statement = connection.createStatement();
			String sql = "select * from bookings where booking_id = " + booking_id;
			rs = statement.executeQuery(sql);
			if(rs.next()) {
				b.setId(rs.getInt("booking_id"));
				b.setUser_id(rs.getString("user_id"));
				b.setCabin_id(rs.getInt("cabin_id"));
				b.setDate_From(rs.getDate("date_from"));
				b.setDate_To(rs.getDate("date_to"));
			}
		} catch(SQLException se) {
			se.printStackTrace();
		} finally {
			try{ if(rs != null) rs.close(); } catch(Exception e) {};
			try{ if(statement != null) statement.close(); } catch(Exception e) {};
		}
		
		return b;
		
	}
	
	public ArrayList<Booking> getBooking(int cabin_id) {
		ArrayList<Booking> ab = new ArrayList<Booking>();
		ResultSet rs = null;
		try{
			statement = connection.createStatement();
			String sql = "select * from bookings where cabin_id = " + cabin_id + " order by date_from asc";
			rs = statement.executeQuery(sql);
			while(rs.next()){
				Booking b = new Booking();
				b.setId(rs.getInt("booking_id"));
				b.setUser_id(rs.getString("user_id"));
				b.setCabin_id(rs.getInt("cabin_id"));
				b.setDate_From(rs.getDate("date_from"));
				b.setDate_To(rs.getDate("date_to"));
				ab.add(b);
			}
		} catch(SQLException se) {
			se.printStackTrace();
		} finally {
			try{ if(rs != null) rs.close(); } catch(Exception e) {};
			try{ if(statement != null) statement.close(); } catch(Exception e) {};
		}

		return ab;
	}
	
	public int addReport(Report report) {
		PreparedStatement pStatement = null;
		ResultSet rs = null;
		int id = 0;

		try{
			statement = connection.createStatement();
			String query = "INSERT INTO reports (cabin_id, wood, damage, missing, other, email, report_date) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
			pStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS); 
			pStatement.setInt(1, report.getCabin_id());
			pStatement.setInt(2, report.getWood());
			pStatement.setString(3, report.getDamage());
			pStatement.setString(4, report.getMissing());
			pStatement.setString(5, report.getOther());
			pStatement.setString(6, report.getEmail());
			pStatement.setDate(7, new java.sql.Date(report.getReport_date().getTime()));
			pStatement.execute();
			
			rs = pStatement.getGeneratedKeys();
			if(rs.next()) {
				id = rs.getInt(1);
			} else {
				id = -2;
			}
		} catch (Exception e){
			e.printStackTrace();
			id = -1;
		} finally {
			try{ if(rs != null) rs.close(); } catch(Exception e) {};
			try{ if(statement != null) statement.close(); } catch(Exception e) {};
		}

		return id;
	}
	
	public ArrayList<Report> getReports(int cabin_id) {
		ArrayList<Report> rp = new ArrayList<Report>();
		ResultSet rs = null;

		try{
			statement = connection.createStatement();
			String sql = "select * from reports where cabin_id = " + cabin_id + " order by report_date desc";
			rs = statement.executeQuery(sql);
			while(rs.next()){
				Report r = new Report();
				r.setWood(rs.getInt("wood"));
				r.setDamage(rs.getString("damage"));
				r.setMissing(rs.getString("missing"));
				r.setReport_date(rs.getDate("report_date"));
				r.setEmail(rs.getString("email"));
				r.setOther(rs.getString("other"));
				rp.add(r);
			}
		} catch(SQLException se) {
			se.printStackTrace();
		} finally {
			try{ if(rs != null) rs.close(); } catch(Exception e) {};
			try{ if(statement != null) statement.close(); } catch(Exception e) {};
		}

		return rp;
	}
	
	public Report getReportById(int report_id) {
		Report r = new Report();
		ResultSet rs = null;

		try {
			statement = connection.createStatement();
			String sql = "select * from reports where id = " + report_id;
			rs = statement.executeQuery(sql);
			if(rs.next()) {
				r.setCabin_id(rs.getInt("cabin_id"));
				r.setWood(rs.getInt("wood"));
				r.setDamage(rs.getString("damage"));
				r.setMissing(rs.getString("missing"));
				r.setReport_date(rs.getDate("report_date"));
				r.setEmail(rs.getString("email"));
				r.setOther(rs.getString("other"));
			}
		} catch(SQLException se) {
			se.printStackTrace();
		} finally {
			try{ if(rs != null) rs.close(); } catch(Exception e) {};
			try{ if(statement != null) statement.close(); } catch(Exception e) {};
		}

		return r;
	}
	
	public Cabin getCabin(int cabin_id) {
		Cabin cabin = new Cabin();
		ResultSet rs = null;

		try{
			statement = connection.createStatement();
			String sql = "select * from cabins where cabin_id = " + cabin_id + ";";
			rs = statement.executeQuery(sql);
			while(rs.next()){
				cabin.setName(rs.getString("cabin_name"));
				cabin.setWood(rs.getInt("cabin_wood"));
				cabin.setWood_updated(rs.getDate("wood_updated"));
				cabin.setLat(rs.getDouble("lat"));
				cabin.setLng(rs.getDouble("lng"));
				cabin.setLocation(rs.getString("location"));
				cabin.setCapacity(rs.getInt("beds"));
				cabin.setDifficulty(rs.getInt("difficulty"));
			}
		} catch(SQLException se) {
			se.printStackTrace();
		} finally {
			try{ if(rs != null) rs.close(); } catch(Exception e) {};
			try{ if(statement != null) statement.close(); } catch(Exception e) {};
		}

		cabin.setId(cabin_id);
		return cabin;
	}
	
	/**
	 * Update the wood status of a cabin from a report
	 *
	 * The cabin's wood status and wood updated date is set to the reported
	 * values if and only if the report's date is the same as or after the
	 * cabin's last wood updated date.
	 *
	 * @param r	the report instance with new data
	 * @return	true if the wood status was updated, else false
	 */
	public boolean updateWood(Report r) {
		Cabin c = getCabin(r.getCabin_id());

		if(c.getWood_updated().compareTo(r.getReport_date()) <= 0) {
			PreparedStatement pStatement = null;

			try{
				statement = connection.createStatement();
				String query = "UPDATE cabins SET cabin_wood=?,wood_updated=? WHERE cabin_id=" + c.getId();
				pStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
				pStatement.setInt(1, r.getWood());
				pStatement.setDate(2, new java.sql.Date(r.getReport_date().getTime()));
				pStatement.execute();
			} catch(SQLException se) {
				se.printStackTrace();
			} finally {
				try{ if(statement != null) statement.close(); } catch(Exception e) {};
			}

			return true;
		}
		return false;
	}
}
