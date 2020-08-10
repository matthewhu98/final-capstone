package com.techelevator.dao;

import java.util.ArrayList;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;

import com.techelevator.model.Landmark;


@Service
public class LandmarkSqlDAO implements LandmarkDAO {
	
    private JdbcTemplate jdbcTemplate;

    public LandmarkSqlDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

	@Override
	public List<Landmark> getAllLandmarks() {
		List<Landmark> landmarks = new ArrayList<>();
		String sql = "SELECT * FROM landmark";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while(results.next()) {
            Landmark landmark = mapRowToLandmark(results);
            landmark.setMoreImgs(getLandmarkImgs(landmark.getLandmarkID()));
            landmarks.add(landmark);
        }
		return landmarks;
	}
	
	@Override
	public Landmark addLandMark(Landmark landmark) {
		
		String sql = "INSERT INTO landmark (landmark_id,name, summary, description, img, address_id) "
				+ "VALUES (default,?,?,?,?,?) returning landmark_id";
		
		Long id = jdbcTemplate.queryForObject(sql, Long.class , landmark.getName(), landmark.getSummery(),landmark.getDiscription(),landmark.getImg(),landmark.getAddressID());
		landmark.setLandmarkID(id);
		return landmark;
	}
	
	@Override
	public Landmark landmarkDetails(long id) {
		Landmark landmark = null;
		String sql = "select * from landmark where landmark_id =?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql,id);
		
		if (results.next()) {
    		landmark = mapRowToLandmark(results);
    	}
		
		landmark.setMoreImgs(getLandmarkImgs(id));
    	
		return landmark;
	
	}
	
	@Override
	public List<Landmark> getLandmarksForItinerary(long id) {
		List<Landmark> landmarks = new ArrayList<>();
		
		String sql = "select * from landmark " + 
				"join itinerary_landmarks as il on landmark.landmark_id = il.landmark_id " + 
				"join itinerary as it on il.itinerary_id = it.itinerary_id " + 
				"where it.itinerary_id = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql , id);
        while(results.next()) {
            Landmark landmark = mapRowToLandmark(results);
            landmarks.add(landmark);
        }
		return landmarks;
	}
	
	
	private List<String> getLandmarkImgs(long id) {
		List<String> landmarkImgs = new ArrayList<>();
		
		String sql = "select * from images where landmark_id =?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sql , id);
		
		while(result.next()) {
			landmarkImgs.add(result.getString("image_name"));
		}
		return landmarkImgs;
	}
	

	private Landmark mapRowToLandmark(SqlRowSet rs) {
        Landmark landmark = new Landmark();
        landmark.setLandmarkID(rs.getLong("landmark_id"));
        landmark.setName(rs.getString("name"));
        landmark.setSummery(rs.getString("summary"));
        landmark.setDiscription(rs.getString("description"));
        landmark.setImg(rs.getString("img"));
        landmark.setAddressID(rs.getInt("address_id")); 
        landmark.setmapLink(rs.getString("map_link"));
        return landmark;
    }

	

	

	

	
}
