 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
 
 
<!DOCTYPE html>
<html>
   <head>
    <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Post rides</title>
        <link href='http://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
         <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
 		 <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  			<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  			
  			
   <style type="text/css">
   
   *, *:before, *:after {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: 'Nunito', sans-serif;
  color: #384047;
}

form {
  max-width: 300px;
  margin: 10px auto;
  padding: 10px 20px;
  background: #f4f7f8;
  border-radius: 8px;
}

h1 {
  margin: 0 0 30px 0;
  text-align: center;
}

input[type="text"],
input[type="password"],
input[type="date"],
input[type="datetime"],
input[type="email"],
input[type="number"],
input[type="search"],
input[type="tel"],
input[type="time"],
input[type="url"],
textarea,
select {
  background: rgba(255,255,255,0.1);
  border: none;
  font-size: 16px;
  height: auto;
  margin: 0;
  outline: 0;
  padding: 15px;
  width: 100%;
  background-color: #e8eeef;
  color: #8a97a0;
  box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
  margin-bottom: 30px;
}

input[type="radio"],
input[type="checkbox"] {
  margin: 0 4px 8px 0;
}

select {
  padding: 6px;
  height: 32px;
  border-radius: 2px;
}

button {
  padding: 19px 39px 18px 39px;
  color: #FFF;
  background-color: #4bc970;
  font-size: 18px;
  text-align: center;
  font-style: normal;
  border-radius: 5px;
  width: 100%;
  border: 1px solid #3ac162;
  border-width: 1px 1px 3px;
  box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
  margin-bottom: 10px;
}

fieldset {
  margin-bottom: 30px;
  border: none;
}

legend {
  font-size: 1.4em;
  margin-bottom: 10px;
}

label {
  display: block;
  margin-bottom: 8px;
}

label.light {
  font-weight: 300;
  display: inline;
}

.number {
  background-color: #5fcf80;
  color: #fff;
  height: 30px;
  width: 30px;
  display: inline-block;
  font-size: 0.8em;
  margin-right: 4px;
  line-height: 30px;
  text-align: center;
  text-shadow: 0 1px 0 rgba(255,255,255,0.2);
  border-radius: 100%;
}

@media screen and (min-width: 480px) {

  form {
    max-width: 480px;
  }

}
   
   </style>
   
   <script>
  var dat = new Date();
  $(function() {
	 
    $( "#datepicker" ).datepicker(
    		{
    			  dateFormat: "dd/mm/yy",minDate: dat, maxDate: dat.getDate()+9
    			}
    );
  });
  </script>
  
       
    </head>
    <body>
<a href="<c:url value="/karlist" />"><img class="alignnone size-full wp-image-144" title="Back to find rides" alt="Back button find ride" src="http://rmbiggs.files.wordpress.com/2010/06/pointer-unpositioned.png?w=630"></a>
      
<form action="./saveTripDetails" method="post">
      
      
        
        <fieldset>
          <legend>Some basic info</legend>
          <label for="name">Start:</label>
	      <select id="job" name="startPoint">
	          <optgroup label="Australia">
	            <option value="Sydney">Sydney</option>
	            <option value="Canberra">Canberra</option>
	            <option value="Melbourne">Melbourne</option>
	            <option value="Brisbane"> Brisbane</option>
	            <option value="Gold Coast">Gold Coast</option>
	            <option value="Cairns">Cairns</option>
	             <option value="Townsville">Townsville</option>
	            <option value="Hobart">Hobart</option>
	            <option value="Adelaide">Adelaide</option>
	            <option value="Perth">Perth</option>
	            <option value="Newcastle">Newcastle</option>
	            <option value="Darwin">Darwin</option>
	             <option value="Queanbeyan">Queanbeyan</option>
	             <option value="Sunshine Coast">Sunshine Coast</option>
	            <option value="Wollongong">Wollongong</option>
	            <option value="Geelong">Geelong</option>
	            <option value="Alice Spring">Alice Spring</option>
	            <option value="Great Ocean Drive">Great Ocean Drive</option>
	          </optgroup>
	          <optgroup label="New Zealand">
	            <option value="Auckland">Auckland</option>
	            <option value="Queenstown">Queenstown</option>
	            <option value="Wanaka">Wanaka</option>
	            <option value="Wellington">Wellington</option>
	            <option value="Christchurch">Christchurch</option>
	            <option value="Te Anau">Te Anau</option>
	            <option value="Milford Sound">Milford Sound</option>
	            <option value="Dunedin">Dunedin</option>
	            <option value="Invercargill">Invercargill</option>
	            <option value="Franz Josef Glacier">Franz Josef Glacier</option>
	            <option value="Fox Glacier">Fox Glacier</option>
	            <option value="Rotorua">Rotorua</option>
	            <option value="Matamata">Matamata</option>
	            <option value="Paihia">Paihia</option>
	            <option value="Taupo">Taupo</option>
	          </optgroup>
	      </select>
          
          <label for="mail">Destination:</label>
          <select id="job" name="endPoint">
	          <optgroup label="Australia">
	            <option value="Sydney">Sydney</option>
	            <option value="Canberra">Canberra</option>
	            <option value="Melbourne">Melbourne</option>
	            <option value="Brisbane"> Brisbane</option>
	            <option value="Gold Coast">Gold Coast</option>
	            <option value="Cairns">Cairns</option>
	             <option value="Townsville">Townsville</option>
	            <option value="Hobart">Hobart</option>
	            <option value="Adelaide">Adelaide</option>
	            <option value="Perth">Perth</option>
	            <option value="Newcastle">Newcastle</option>
	            <option value="Darwin">Darwin</option>
	             <option value="Queanbeyan">Queanbeyan</option>
	             <option value="Sunshine Coast">Sunshine Coast</option>
	            <option value="Wollongong">Wollongong</option>
	            <option value="Geelong">Geelong</option>
	            <option value="Alice Spring">Alice Spring</option>
	            <option value="Great Ocean Drive">Great Ocean Drive</option>
	          </optgroup>
	          <optgroup label="New Zealand">
	            <option value="Auckland">Auckland</option>
	            <option value="Queenstown">Queenstown</option>
	            <option value="Wanaka">Wanaka</option>
	            <option value="Wellington">Wellington</option>
	            <option value="Christchurch">Christchurch</option>
	            <option value="Te Anau">Te Anau</option>
	            <option value="Milford Sound">Milford Sound</option>
	            <option value="Dunedin">Dunedin</option>
	            <option value="Invercargill">Invercargill</option>
	            <option value="Franz Josef Glacier">Franz Josef Glacier</option>
	            <option value="Fox Glacier">Fox Glacier</option>
	            <option value="Rotorua">Rotorua</option>
	            <option value="Matamata">Matamata</option>
	            <option value="Paihia">Paihia</option>
	            <option value="Taupo">Taupo</option>
	          </optgroup>
	      </select>
          
          <label for="password">Date:</label>
          <input type="text" name="startDateStr" id="datepicker">
          
            <label for="mail">Time:</label>
            <select id="job" name="startTimeStr">	         
	           <option value="00:00:00">00:00</option>
    <option value="00:30:00">00:30</option>
    <option value="01:00:00">01:00</option>
    <option value="01:30:00">01:30</option>
    <option value="02:00:00">02:00</option>
    <option value="02:30:00">02:30</option>
    <option value="03:00:00">03:00</option>
    <option value="03:30:00">03:30</option>
    <option value="04:00:00">04:00</option>
    <option value="04:30:00">04:30</option>
    <option value="05:00:00">05:00</option>
    <option value="05:30:00">05:30</option>
    <option value="06:00:00">06:00</option>
    <option value="06:30:00">06:30</option>
    <option value="07:00:00">07:00</option>
    <option value="07:30:00">07:30</option>
    <option value="08:00:00">08:00</option>
    <option value="08:30:00">08:30</option>
    <option value="09:00:00">09:00</option>
    <option value="09:30:00">09:30</option>
    <option value="10:00:00">10:00</option>
    <option value="10:30:00">10:30</option>
    <option value="11:00:00">11:00</option>
    <option value="11:30:00">11:30</option>
    <option value="12:00:00">12:00</option>
    <option value="12:30:00">12:30</option>
    <option value="13:00:00">13:00</option>
    <option value="13:30:00">13:30</option>
    <option value="14:00:00">14:00</option>
    <option value="14:30:00">14:30</option>
    <option value="15:00:00">15:00</option>
    <option value="15:30:00">15:30</option>
    <option value="16:00:00">16:00</option>
    <option value="17:30:00">17:30</option>
    <option value="18:00:00">18:00</option>
    <option value="18:30:00">18:30</option>
    <option value="19:00:00">19:00</option>
    <option value="20:30:00">20:30</option>
    <option value="21:00:00">21:00</option>
    <option value="21:30:00">21:30</option>
    <option value="22:00:00">22:00</option>
    <option value="22:30:00">22:30</option>
    <option value="23:00:00">23:00</option>
    <option value="23:30:00">23:30</option>
	        </select> 	
            
             <label for="bio">Details:</label>
          <textarea id="bio" name="tripDetails"></textarea>
          
         
        <button type="submit">Done!!</button>
        
        
        </fieldset>
        
      </form>
      
    </body>
</html>