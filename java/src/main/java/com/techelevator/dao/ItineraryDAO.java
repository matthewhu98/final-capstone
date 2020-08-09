package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Itinerary;

public interface ItineraryDAO {

	
	public List<Itinerary> getAllItinerary(long id);     // this is the user id
	
	public Itinerary createNewItinerary(long id ,Itinerary itinerary);
	
	public void deleteItierary (long id);    // deleting a whole itinerary
	

}
