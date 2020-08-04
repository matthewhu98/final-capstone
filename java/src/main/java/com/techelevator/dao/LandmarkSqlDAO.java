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
		String sql = "Select * from landmark " + "where landmark_id = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql,id);
		
		if (results.next()) {
    		landmark = mapRowToLandmark(results);
    	}
    	
		return landmark;
	
	}
	
	
    private Landmark mapRowToLandmark(SqlRowSet rs) {
        Landmark landmark = new Landmark();
        landmark.setLandmarkID(rs.getLong("landmark_id"));
        landmark.setName(rs.getString("name"));
        landmark.setSummery(rs.getString("summary"));
        landmark.setDiscription(rs.getString("description"));
        landmark.setImg(rs.getString("img"));
        landmark.setAddressID(rs.getInt("address_id"));      
        return landmark;
    }

	

	
}
