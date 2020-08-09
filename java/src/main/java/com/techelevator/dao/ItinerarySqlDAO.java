package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;

import com.techelevator.model.Itinerary;


@Service
public class ItinerarySqlDAO implements ItineraryDAO {
	
	private JdbcTemplate jdbcTemplate;

    public ItinerarySqlDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

	@Override
	public List<Itinerary> getAllItinerary(long id) {
		List<Itinerary> allIT = new ArrayList<>();
		
		String sql ="select * from itinerary where user_id = ?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sql, id);
		
		while (result.next()) {
			Itinerary itinerary = mapRowToItinerary(result);
			allIT.add(itinerary);
		}
		
		
		return allIT;
	}

	@Override
	public Itinerary createNewItinerary(long id ,Itinerary itinerary) {
		 String sql = "insert into itinerary (itinerary_id , name , user_id) values (default , ? , ?) returning user_id";
		 Long itId = jdbcTemplate.queryForObject(sql, Long.class , itinerary.getName() , itinerary.getUserID());
		 itinerary.setItineraryID(itId);
		 
		
		return itinerary;
	}
	
	@Override
	public void deleteItierary(long id) {   // itinerary ID
		
		String firstSql = "delete from itinerary_landmarks where itinerary_id = ?";
		jdbcTemplate.update(firstSql , id);
		
		String sql = "delete from itinerary where itinerary_id = ?";
		jdbcTemplate.update(sql, id);
		
	}
	

	
	private Itinerary mapRowToItinerary(SqlRowSet rs) {
		Itinerary it  = new Itinerary();
		it.setItineraryID(rs.getLong("itinerary_id"));
		it.setName(rs.getString("name"));
		it.setUserID(rs.getInt("user_id"));
		
		return it;
		
	}

	

	
}
