package no.ntnu.cabinet.database;

import java.util.Date;

public class Report {
	private int id;
	private int cabin_id;
	private int booking_id;
	private int wood;
	private String damage;
	private String missing;
	private String email;
	private String other;
	private Date report_date;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBooking_id() {
		return booking_id;
	}
	public int getCabin_id() {
		return cabin_id;
	}
	public void setCabin_id(int cabin_id) {
		this.cabin_id = cabin_id;
	}
	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}
	public int getWood() {
		return wood;
	}
	public void setWood(int wood) {
		this.wood = wood;
	}
	public String getDamage() {
		return damage;
	}
	public void setDamage(String damage) {
		this.damage = damage;
	}
	public String getMissing() {
		return missing;
	}
	public void setMissing(String missing) {
		this.missing = missing;
	}
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getReport_date() {
		return report_date;
	}
	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
}
