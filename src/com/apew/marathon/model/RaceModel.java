package com.apew.marathon.model;

public class RaceModel {
	public Long getID() {
		return ID;
	}

	public void setID(Long iD) {
		ID = iD;
	}

	public String getRaceName() {
		if(RaceName==null)
			return "";
		return RaceName;
	}

	public void setRaceName(String raceName) {
		RaceName = raceName;
	}

	public String getStartTime() {
		return StartTime;
	}

	public void setStartTime(String startTime) {
		StartTime = startTime;
	}

	public String getEndTime() {
		return EndTime;
	}

	public void setEndTime(String endTime) {
		EndTime = endTime;
	}

	public Float getPrice() {
		return Price;
	}

	public void setPrice(Float price) {
		Price = price;
	}

	public String getToken() {
		return Token;
	}

	public void setToken(String token) {
		Token = token;
	}

	private Long ID;
	private String RaceName;
	private String StartTime;
	private String EndTime;
	private Float Price;
	private String Token;
}
