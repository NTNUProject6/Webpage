package no.ntnu.cabinet.database;

import java.util.Date;

public class Cabin {
	private int id;
	private String name;
	private String location;
	private int capacity;
	private int difficulty;
	private int wood;
	private Date wood_updated;
	private double lat;
	private double lng;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public int getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(int difficulty) {
		this.difficulty = difficulty;
	}
	public int getWood() {
		return wood;
	}
	public void setWood(int wood) {
		this.wood = wood;
	}
	public Date getWood_updated() {
		return wood_updated;
	}
	public void setWood_updated(Date wood_updated) {
		this.wood_updated = wood_updated;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
}
