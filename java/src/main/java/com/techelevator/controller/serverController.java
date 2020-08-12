package com.techelevator.controller;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.techelevator.dao.ItineraryDAO;
import com.techelevator.dao.ItineraryLandmarkDAO;
import com.techelevator.dao.LandmarkDAO;
import com.techelevator.model.Itinerary;
import com.techelevator.model.ItineraryLandmark;
import com.techelevator.model.Landmark;


@RestController
@CrossOrigin
public class serverController {

	private LandmarkDAO landmarkDao;
	private ItineraryDAO itDao;
	private ItineraryLandmarkDAO itlDao;
	
	public serverController(LandmarkDAO landDao , ItineraryDAO itDao, ItineraryLandmarkDAO itlDao) {
		this.landmarkDao = landDao;
		this.itDao = itDao;
		this.itlDao = itlDao;
	}
	
	@RequestMapping(path = "/landmarks", method = RequestMethod.GET)
	public List<Landmark> getAllLandmarks(){
		return landmarkDao.getAllLandmarks();
	}
	
	@RequestMapping (path ="/landmarks/addlandmark" , method = RequestMethod.POST)
	public Landmark addLandMark(@RequestBody Landmark landmark) {
		return landmarkDao.addLandMark(landmark);
	}
	
	@RequestMapping(path = "/landmarks/{id}" , method = RequestMethod.GET)
	public Landmark landmarkDetails(@PathVariable long id) {
		return landmarkDao.landmarkDetails(id);
	}
	
	@RequestMapping(path = "/itineraries/{id}" , method = RequestMethod.GET)  //user id 
	public List<Itinerary> getAllItinerary(@PathVariable long id){
		return itDao.getAllItinerary(id);
	}
	
	@RequestMapping(path = "/itinerarydetails/{id}", method = RequestMethod.GET)  // itinerary id
	public List<Landmark> getLandmarksForItinerary (@PathVariable long id){
		return landmarkDao.getLandmarksForItinerary(id);
	}
	
	
	@RequestMapping(path = "/itineraries/{id}", method = RequestMethod.POST)
	public Itinerary createNewItinerary(@PathVariable long id , @RequestBody Itinerary itinerary) {
		return itDao.createNewItinerary(id, itinerary);
	}
	
	@RequestMapping(path = "/landmarks/{id}", method = RequestMethod.POST)	
	public void addLandmarkToItinerary(@RequestBody ItineraryLandmark il) {
		itlDao.addLandmarkToItinerary(il);
	}
	
	@RequestMapping(path = "/itineraries/{id}", method = RequestMethod.DELETE)  //itinerary ID
	public void deleteItinerary(@PathVariable long id) {
		itDao.deleteItierary(id);
	}
	
//	 this method is to delete i specific landmark from Itinerary
	@RequestMapping(path = "/itinerarydetails/landmark/{id}", method = RequestMethod.POST)    // itinerary ID 
	public void deleteLandmarkInItinerary(@RequestBody ItineraryLandmark itineraryLandmark) {
		itlDao.deleteLandmarkInItinerary(itineraryLandmark);
	}
	
	
//	@RequestMapping(path = "/itinerarydetails/{id}", method = RequestMethod.DELETE)
//	public void deleteLandmarkInItinerary(@PathVariable int itineraryID, @RequestParam int landmarkID){
//		itlDao.deleteLandmarkInItinerary( itineraryID, landmarkID);
//	}
}
