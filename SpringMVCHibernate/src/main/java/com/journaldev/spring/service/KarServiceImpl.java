package com.journaldev.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.KarDAO;
import com.journaldev.spring.dao.PersonDAO;
import com.journaldev.spring.model.Person;
import com.journaldev.spring.model.TripDetails;

@Service
@Transactional
public class KarServiceImpl implements KarService {
	
	private KarDAO karDAO;
	
	public void setKarDAO(KarDAO karDAO) {
		this.karDAO = karDAO;
	}
	
	@Override
	public void saveTripDetails(TripDetails tripDetails){
		karDAO.saveTripDetails(tripDetails);
    }

	@Override
	public List<String> findAllStartPoints(){
		return karDAO.findAllStartPoints();
	}
	
	@Override
	public List<String> findAllEndPoints(){
		return karDAO.findAllEndPoints();
	}
	
	@Override
	public List<String> findAllEndPointsByStartPoint(String startPoint){
		List<String> l = karDAO.findAllEndPointsByStartPoint(startPoint);
		return l;
	}
	
	@Override
	public List<TripDetails> findMatchingTrips(TripDetails tripDetails){
		return karDAO.findMatchingTrips(tripDetails);
	}
	
}
