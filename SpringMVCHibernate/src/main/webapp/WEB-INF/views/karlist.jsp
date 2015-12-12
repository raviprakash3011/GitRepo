<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>



<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.centered {
  position: fixed;
  top: 50%;
  left: 50%;
  /* bring your own prefixes */
  transform: translate(-50%, -50%);
}
.center {
	margin: auto;
    width: 30%;
    padding: 10px;
}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
function loadFinalDestination(value){
	//alert(value);
	if(value != '' && value.length > 3){
		
		$.getJSON('./findAllEndPointsByStartPoint?startPoint='+value,function(data){
				var html = "";
				for(var i = 0; i < data.length; i++){
					html += '<option value="'+data[i]+'">'+data[i]+'</option>';
				}
				$("#tripTo").html(html);
		});
		
	}
}

</script>


<title>RPG Rides</title>
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7; IE=EmulateIE9">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <!--  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" media="all" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demo.css" media="all" /> -->
</head>
<body style="background-color: lightblue">

			 
<form action="./karlist"  method="get">

<div class="mainContainer" style="height:10%; width:90%;background: LightGray; margin:auto; padding:10px">
<a style="float:right" href="./createPage" >Post a ride </a> 

<span style="float:left"  >Find a ride</span>


<br />
<br />
<br />
		<div class="center" >
			From: 
			<select name="startPoint" onchange="javascript:loadFinalDestination(this.value);" > 
				<c:forEach items="${tripFrom}" var="trips">
					<option value="${trips}">${trips}</option>
				</c:forEach>
			</select>
			
			&nbsp;
			
			To: 
			<select name="endPoint" id="tripTo" > 
				<c:forEach items="${tripTo}" var="trips">
					<option value="${trips}">${trips}</option>
				</c:forEach>
			</select>
			&nbsp;
			<input type="submit" name="findMatchingTrips" value="Go" />
		</div>
</div>


<c:if test="${fn:length(tripList) gt 0}">
<hr>
<div id="listTrips" >
	<h1>Results</h1>
	<c:forEach items="${tripList}" var="trip">
		<div style="width: 90%; align: center;background: LimeGreen;margin:auto; padding:10px">
			<p> <strong>Date</strong>: <fmt:formatDate value="${trip.startDate}" pattern="dd/MM/yyyy HH:mm" />   </p>
			<p> <strong>Trip</strong>: ${trip.startPoint} &nbsp; ------> &nbsp; ${trip.endPoint}   </p>
			<p> <strong>Details</strong>: ${trip.tripDetails}   </p>
			<hr>
		</div>
	 </c:forEach>
	 
</div>
</c:if>

<c:if test="${tripListEmpty}">
	<br><br>
	<div style="width: 90%; align: center;background: FireBrick ;margin:auto; padding:10px">
	No rides available between ${tripDetails.startPoint} &nbsp; -----> &nbsp;  ${tripDetails.endPoint}.
	</div>
</c:if>

<c:if test="${landingPage}">
<div class="center" style="width:80%">
	<h2>How it works</h2>
 	<p>	<b>Post a ride: </b>
 		<br>1. You can only post ride starting within next 20 days.
 		<br>2. In details, mention pickup and drop address, mobile phone, cost of ride share if any.
 		<br>3. Presently you can not delete your post, you may repost your ride.
 		<br>4. Once your ride is full or you wish to delete the post, email me @ ravi.prakash.australia[at]gmail[dot]com.
 		
 		<br><br>
 		<b>Find a ride: </b>
 		<br>1. We only show starting points from where rides are available in next 20 days. You may choose the destination.
 		<br>2. Contact the driver and fix your seat.
 		<br>3. For any suggestions, grievance, send me an email.
 	</p>
</div>

</c:if>

</form>
			 
			 
			 


</body>
</html>


