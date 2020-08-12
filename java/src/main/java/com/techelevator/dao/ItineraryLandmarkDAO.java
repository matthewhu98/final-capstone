package com.techelevator.dao;

import com.techelevator.model.ItineraryLandmark;

public interface ItineraryLandmarkDAO {
	
	public void addLandmarkToItinerary(ItineraryLandmark il);
	
	public void deleteLandmarkInItinerary (ItineraryLandmark itineraryLandmark);
	
//	public void deleteLandmarkInItinerary (int itineraryID,int landmarkID);
}
