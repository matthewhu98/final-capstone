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
	public Itinerary createNewItinerary(Itinerary itinerary) {
		// TODO Auto-generated method stub
		return null;
	}

	
	private Itinerary mapRowToItinerary(SqlRowSet rs) {
		Itinerary it  = new Itinerary();
		it.setItineraryID(rs.getLong("itinerary_id"));
		it.setName(rs.getString("name"));
		it.setUserID(rs.getInt("user_id"));
		
		return it;
		
	}
}
