<%@page import="com.oop.model.Specilization"%>
<%@page import="com.oop.model.Hospital"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oop.service.Impl.SpecilizationServiceImpl"%>
<%@page import="com.oop.service.Impl.HospitalServiceImpl"%>
<%@page import="com.oop.service.SpecilizationService"%>
<%@page import="com.oop.service.HospitalService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%
    response.setHeader("Cache-Controle", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
    response.setHeader("Expires", "0"); //Proxiy
    session.getAttribute("id");
           if(session.getAttribute("email") == null)
               response.sendRedirect("doctorLogin.jsp");
    %>
<!doctype html>
<html lang="en">
  <head>
  	<title>Sidebar 09</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="css/style.css">
	<style type="text/css">
    	.form{
			border-radius: 10px; 
			padding: 30px;
			background-color: white;
			box-shadow: 2px 2px 2px 2px rgb(194, 194, 194);
			margin: 10px;opacity: 0.7;
		}
    	.form:hover {
    		opacity: 0.9;
			transition: background 0.4s ease-in-out;
		}
    </style>
  </head>
  <body style="background-image: url(images/hero.jpg);">
    <jsp:include page="/WEB-INF/views/header2.jsp"></jsp:include>

        <!-- Page Content  -->
    <div id="content" class="p-4 p-md-5 pt-5">
        <form method="post" action="AddScheduleServlet" class="form-signin form">
        	<label for="">Categoty</label>
			    <select name="spz" id="" class="form-control" required="required">
			    <%
			    try {
			    	SpecilizationService specilizationService = new SpecilizationServiceImpl();
					ArrayList<Specilization> arrayList = specilizationService.findAll();
					
					for(Specilization specilization : arrayList){
				%>
				
			        <option value= "<%=specilization.getId()%>"><%=specilization.getSpecName() %></option>
			    <%	
			   		}
           		 %>    
			    </select>
			<label for="">Hospital</label>
			    <select name="hospital" id="" class="form-control" required="required">
			    <%
			   		HospitalService hospitalService = new HospitalServiceImpl();
					ArrayList<Hospital> hospitalList = hospitalService.findAll();
					
					for(Hospital hospital : hospitalList){
				%>
			        <option value="<%=hospital.getId()%>"><%=hospital.getName() %></option>
			     <%	
			   		}
			    } catch(Exception e) {
			    	
			    }
           	 	%> 
			    </select>
			    <label for="">Date</label>
			    <input class="form-control" min="" type="date" name="date" id="" required="required"> 
			    <label for="">From</label>
			    <input class="form-control" min="" type="time" name="fromTime" id="" required="required" placeholder="hh:mm"> 
			    <label for="">To</label>
			    <input class="form-control" min="" type="time" name="toTime" id="" required="required" placeholder="hh:mm">
			    <label for="">Spend time for one patient</label>
			    <input class="form-control" min="" type="number" name="minTime" id="" required="required"> </br>
			    <input type="radio" name="id" value="${id}" checked="checked" style="visibility: hidden;">
				<input class="btn btn-lg btn-primary btn-block" type="submit" value="Add Schedule">
		</form>
	</div>

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>