package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Person;
import com.journaldev.spring.model.TripDetails;

public interface KarDAO {

	public void saveTripDetails(TripDetails tripDetails);
	public List<String> findAllStartPoints();
	public List<String> findAllEndPoints();
	public List<String> findAllEndPointsByStartPoint(String startPoint);
	public List<TripDetails> findMatchingTrips(TripDetails tripDetails);
	
}
