package com.techelevator.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.techelevator.model.ItineraryLandmark;

@Service
public class ItineraryLandmarkSqlDAO implements ItineraryLandmarkDAO{
	
	private JdbcTemplate jdbcTemplate;
	
    public ItineraryLandmarkSqlDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


	@Override
	public void addLandmarkToItinerary(ItineraryLandmark il) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO itinerary_landmarks (itinerary_id, landmark_id) VALUES (?,?)";
		jdbcTemplate.update(sql, il.getItineraryId(), il.getLandmarkId());
	}


//	@Override
//	public void deleteLandmarkInItinerary(int itineraryID, int landmarkID) {
//		String sql = "delete from itinerary_landmarks where itinerary_id = ? and landmark_id = ?";
//		jdbcTemplate.update(sql, itineraryID, landmarkID);
//		
//	}


	@Override
	public void deleteLandmarkInItinerary(ItineraryLandmark itineraryLandmark) {   //deleting landmark from specific itinerary
		
		
		String sql = "delete from itinerary_landmarks where itinerary_id = ? and landmark_id = ?";
		jdbcTemplate.update(sql, itineraryLandmark.getItineraryId(), itineraryLandmark.getLandmarkId());
		
	}


	
}
