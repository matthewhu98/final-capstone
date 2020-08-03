package com.techelevator.controller;

import java.util.List;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.techelevator.dao.LandmarkDAO;
import com.techelevator.model.Landmark;

@RestController
public class serverController {

	private LandmarkDAO landmarkDao;
	
	public serverController(LandmarkDAO landDao) {
		this.landmarkDao = landDao;
	}
	
	@RequestMapping(path = "/landmarks", method = RequestMethod.GET)
	public List<Landmark> getAllLandmarks(){
		return landmarkDao.getAllLandmarks();
	}
	
	@RequestMapping (path ="/landmarks/addlandmark" , method = RequestMethod.POST)
	public Landmark addLandMark(@RequestBody Landmark landmark) {
		return landmarkDao.addLandMark(landmark);
	}
	
}