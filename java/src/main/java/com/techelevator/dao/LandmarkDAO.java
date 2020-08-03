package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Landmark;

public interface LandmarkDAO {
	
	public List<Landmark> getAllLandmarks();
	
	public Landmark addLandMark(Landmark landmark);

}
