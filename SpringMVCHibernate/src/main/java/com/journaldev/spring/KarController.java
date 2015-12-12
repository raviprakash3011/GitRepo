package com.journaldev.spring;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.journaldev.spring.model.Person;
import com.journaldev.spring.model.TripDetails;
import com.journaldev.spring.service.KarService;
import com.journaldev.spring.service.PersonService;

import flexjson.JSONException;
import flexjson.JSONSerializer;

@Controller
public class KarController {

	private KarService karService;
	
	@Autowired(required=true)
	@Qualifier(value="karService")
	public void setKarService(KarService ks){
		this.karService = ks;
	}
	
	@RequestMapping(value = "/karlist", method = RequestMethod.GET)
	public String karList(Model model,  TripDetails tripDetails) {
		
		model.addAttribute("tripFrom", karService.findAllStartPoints() );
		model.addAttribute("tripTo", karService.findAllEndPoints() );
		
		
		if(StringUtils.isNotBlank(tripDetails.getStartPoint()) && StringUtils.isNotBlank(tripDetails.getEndPoint())){
			List<TripDetails> list = karService.findMatchingTrips(tripDetails) ;
			
			if(CollectionUtils.isEmpty(list)){
				model.addAttribute("tripListEmpty", true );
			}else{
				model.addAttribute("tripList", list );
			}
		}else{
			model.addAttribute("landingPage", true );
		}
		
		model.addAttribute("tripDetails", tripDetails );
		
		return "karlist";
	}
	
	@RequestMapping(value = "/createPage", method = RequestMethod.GET)
	public String createPage(Model model) {
		
		return "createPage";
	}
	
	@RequestMapping(value = "/saveTripDetails", method = RequestMethod.POST)
	public String saveTripDetails(TripDetails tripDetails ) {
		Map map = new HashMap();
		
		boolean validated = checkInputFields(tripDetails);
		
		if(validated){
			String dateStr = tripDetails.getStartDateStr().trim()+" "+tripDetails.getStartTimeStr().trim();
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			Date startDate = null;
			try {
				startDate = format.parse(dateStr);
				
				Calendar cal = new GregorianCalendar();
				Date s = cal.getTime();
				cal.add(Calendar.DATE, 20);
				Date e = cal.getTime();
				
				if(startDate.getTime() >= s.getTime() && startDate.getTime() <= e.getTime()){			
					tripDetails.setStartDate(startDate);
					karService.saveTripDetails(tripDetails);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}	
		//return new ModelAndView("karlist", map);
		return "redirect:/karlist";
	}
	
	@RequestMapping(value="/findAllEndPointsByStartPoint", method=RequestMethod.GET)
	public void findAllEndPointsByStartPoint(@RequestParam("startPoint") String startPoint, HttpServletResponse response)
	 throws IOException, JSONException{
		List<String> list =  karService.findAllEndPointsByStartPoint(startPoint);
		
		JSONSerializer js = new JSONSerializer();
		String str = js.serialize(list);
		
		//response.setContentType("text/plain;charset=UTF-8");
		response.setContentType("application/json");
		OutputStream out = response.getOutputStream();
		out.write(str.getBytes());
		out.flush();
		out.close();
	}
	
	private boolean checkInputFields(TripDetails tripDetails ) {
		if(StringUtils.isBlank(tripDetails.getStartPoint()) || StringUtils.isBlank(tripDetails.getEndPoint())
				|| StringUtils.isBlank(tripDetails.getStartDateStr())
					||	StringUtils.isBlank(tripDetails.getStartTimeStr())
								|| StringUtils.isBlank(tripDetails.getTripDetails()) ){
			return false;
		}
		
		
		return true;
	}
}
