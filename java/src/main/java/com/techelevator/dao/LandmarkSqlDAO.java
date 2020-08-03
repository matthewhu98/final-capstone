package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.techelevator.model.Landmark;

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
	
    private Landmark mapRowToLandmark(SqlRowSet rs) {
        Landmark landmark = new Landmark();
        landmark.setLandmarkID(rs.getLong("landmark_id"));
        landmark.setName(rs.getString("name"));
        landmark.setSummery(rs.getString("summery"));
        landmark.setDiscription(rs.getString("discription"));
        landmark.setImg(rs.getString("img"));
        landmark.setAddressID(rs.getInt("address_id"));      
        return landmark;
    }
}
