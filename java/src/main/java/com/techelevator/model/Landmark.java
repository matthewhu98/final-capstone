package com.techelevator.model;

public class Landmark {
	
	private long landmarkID;
	private String name;
	private String summery;
	private String discription;
	private String img;
	private int addressID;
	
	public long getLandmarkID() {
		return landmarkID;
	}
	public void setLandmarkID(long landmarkID) {
		this.landmarkID = landmarkID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSummery() {
		return summery;
	}
	public void setSummery(String summery) {
		this.summery = summery;
	}
	public String getDiscription() {
		return discription;
	}
	public void setDiscription(String discription) {
		this.discription = discription;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getAddressID() {
		return addressID;
	}
	public void setAddressID(int addressID) {
		this.addressID = addressID;
	}
}