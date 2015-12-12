package com.journaldev.spring.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Person;
import com.journaldev.spring.model.TripDetails;

@Repository
public class KarDAOImpl implements KarDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(KarDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void saveTripDetails(TripDetails tripDetails) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(tripDetails);
		logger.info("tripDetails saved successfully,  Details="+tripDetails);
	}

	@Override
	public List<String> findAllStartPoints(){
		Session session = this.sessionFactory.getCurrentSession();
		return session.createQuery("select distinct t.startPoint from TripDetails t where t.startDate >= '"+new Date().getTime()+"' ORDER BY t.startPoint ASC").list();
	}
	
	@Override
	public List<String> findAllEndPoints(){
		Session session = this.sessionFactory.getCurrentSession();
		return session.createQuery("select distinct t.endPoint from TripDetails t where t.startDate >= '"+new Date().getTime()+"'  ORDER BY t.endPoint ASC ").list();
	}
	
	
	 @Override
	 public List<String> findAllEndPointsByStartPoint(String startPoint){
		Session session = this.sessionFactory.getCurrentSession();
		return session.createQuery("select distinct t.endPoint from TripDetails t where t.startDate >= '"+new Date().getTime()+"' AND t.startPoint = '"+startPoint.trim()+"' ").list();
	}
	 
	 @Override
	 public List<TripDetails> findMatchingTrips(TripDetails tripDetails){
		 Session session = this.sessionFactory.getCurrentSession();
			return session.createQuery("select distinct t from TripDetails t where t.startDate >= '"+new Date().getTime()+"' AND t.startPoint = '"+tripDetails.getStartPoint()+
					"'  AND t.endPoint =  '"+tripDetails.getEndPoint()+"' ORDER BY t.startDate ASC").list();
	 }
	
}
