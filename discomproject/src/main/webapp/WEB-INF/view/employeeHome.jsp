<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.bcits.discomproject.beans.EmployeeMaster"%>
<%@page import="com.bcits.discomproject.beans.CurrentBill"%>
<%@page import="com.bcits.discomproject.beans.MonthlyConsumption"%>
<%@page import="java.util.List"%>
<%@page import="com.bcits.discomproject.beans.ConsumerMaster"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url var="css" value="/resources/css"></spring:url>
<spring:url var="js" value="/resources/javascript"></spring:url>
<spring:url  var="images" value="/resources/images"></spring:url>
<%
	String msg = (String) request.getAttribute("msg");
%>
<%
	EmployeeMaster master = (EmployeeMaster) session.getAttribute("admin");
	%>


<jsp:include page="employeeHeader.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${css}/home.css">
<title>Employee Management</title>
</head>
<body style="background-image: url('${images}/empHome.jpg'); ">
	<div class="container"  >
		<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mt-3 " >
			<div class="card text-center w3-opacity border-collapse: collapse;" style="background: url('/${images}/bg-01.jpg');">
				<div class="card-header bg-info " style="height: 70px;">
					<h4 style="color: rgb(13, 24, 24);">Welcome to Discom Employee
						Portal</h4>
				</div>
				<div class="card-body" >
					<table>
						<tr style="color:#d9d9d9; font-size: large;">
							<td>
								<h5 style="text-align: left;">Full Name</h5>
							</td>
							<td>
								<h5 style="text-align: left;">:</h5>
							</td>
							<td>
								<h5 style="text-align: left;"><%=master.getName()%>
								</h5>
							</td>
						</tr>
						<tr style="color:#d9d9d9; font-size: large;">
							<td>
								<h5 style="text-align: left;">Employee-Id</h5>
							</td>
							<td>
								<h5 style="text-align: left;">:</h5>
							</td>
							<td>
								<h5 style="text-align: left;"><%=master.getId()%></h5>
							</td>
						</tr>
						<tr style="color:#d9d9d9; font-size: large;">
							<td>
								<h5 style="text-align: left;">Region</h5>
							</td>
							<td>
								<h5 style="text-align: left;">:</h5>
							</td>
							<td>
								<h5 style="text-align: left;"><%=master.getRegion()%></h5>
							</td>
						</tr>
						<tr style="color:#d9d9d9; font-size: large;">
							<td>
								<h5 style="text-align: left;">Number Of Consumer</h5>
							</td>
							<td>
								<h5 style="text-align: left;">:</h5>
							</td>
							<td>
								<h5 style="text-align: left;"><%=master.getConsumerCount()%></h5>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<br />
		<div class="row justify-content-center">
			<div class="col-12 col-md-10 col-lg-8">
				<form class="card card-sm" action="./getSearchResult">
					<div class="card-body row no-gutters align-items-center">
						<div class="col-auto">
							<i class="fas fa-search h4 text-body"></i>
						</div>
						<div class="col">
							<input name="rrNumber"
								class="form-control form-control-lg form-control-borderless"
								type="search" placeholder="Search Consumer">
						</div>
						<div class="col-auto">
							&nbsp;
							<button class="btn  btn-primary" type="submit">Search</button>
						</div>
					</div>
				</form>
				<%
					if (msg != null && !msg.isEmpty()) {
				%>
				<h2 style="color: green;">
					<%=msg%></h2>
				<%
					}
				%>
			</div>
		</div>
		<div  class="card col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 mt-5 mx-auto d-block" style="background: url('/${images}/bg-01.jpg');" >
		 
		  <div class="card-body px-lg-5 pt-0">
		         <div class="row " style="text-align: left;">
                     <div class="col mt-3">
			          <a href="./getAll">
				        <button type="button" class="btn btn-info btn-lg btn-block">Generate Bill</button></a>
			        </div><br>
                      <div class="col mt-3">
<a href="./monthlyRevenue">
				<button type="button" class="btn btn-info btn-lg btn-block">Monthly
					Revenue</button>
			</a>
			        </div><br>
			       
			</div>
			</div>
			
			 <div class="card-body px-lg-5 pt-0">
		         <div class="row " style="text-align: left;">
                     <div class="col mt-3">
			         <a href="./collected">
				<button type="button" class="btn btn-info btn-lg btn-block">This
					Month Bill Collected</button>
			</a>
			        </div><br>
                      <div class="col mt-3">
<a href="./generatedBills">
				<button type="button" class="btn btn-info btn-lg btn-block">Generated
					Bills</button>
			</a>
			        </div><br>			       
			</div>
			</div>	
			
			 <div class="card-body px-lg-5 pt-0">
		         <div class="row " style="text-align: left;">
                     <div class="col mt-3">
			         <a href="./requestSupport">
				<button type="button" class="btn btn-info btn-lg btn-block">
					 Support Request</button>
			</a>
			        </div><br>
               		       
			</div>
			</div>	
			
			
		</div>


	</div>
	<script src="${js}/jquery-3.2.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>