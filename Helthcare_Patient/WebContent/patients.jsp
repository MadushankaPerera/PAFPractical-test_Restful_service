<%@page import="com.Patient"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<!-- head code meta tag -->
<meta name="viweport" content="width= divice-width, initial-scale=1">

<!-- link CSS page to the index.html page -->
<link href="views/bootstrap.min.css" rel="stylesheet">

<!-- java script file -->
<script type="text/javascript" src="Components/jquery-3.5.0.min.js"></script>
<title>Health care system</title>

<style type="text/css">
body {
	background-image: url("image/image2.jpg");
	background-size: cover
}
</style>
</head>
<body>
	<div class="container">

		<div class="row">
			<div class="col= 6">
				<h2 class="text-primary ">Patient Management Details</h2>
				<br>
				<form method="post" action="patients.jsp" id="formPatient">

					First Name: <input name="patientFirstName" id="FirstName"
						type="text" class="form-control form-control-sm"
						placeholder="Enter your first name here"><br> Last
					Name: <input name="patientlastName" id="LastName" type="text"
						class="form-control form-control-sm"
						placeholder="Enter your last name here"><br> Full
					Name: <input name="patientfullName" id="FullName" type="text"
						class="form-control form-control-sm"
						placeholder="Enter your full name here"><br> Home
					Address: <input name="patientAddress" id="HomeAddress" type="text"
						class="form-control form-control-sm"
						placeholder="Enter permenet Home Address"><br> Date
					of Birth:<input name="patintDOB" id="DateofBirth" type="text"
						class="form-control form-control-sm"
						placeholder="Enter your birth day"><br> Sex: <input
						name="patientsex" id="Sex" type="text"
						class="form-control form-control-sm"
						placeholder="Enter your sex: EX. Male : 'M' Female : 'F' "><br>
					Tell-No:<input name="patientTell" id="Tell-No" type="text"
						class="form-control form-control-sm"
						placeholder="Telephone Number"><br> Age: <input
						name="patientAge" id="Age" type="text"
						class="form-control form-control-sm" placeholder="Age for Today"><br>
					NIC:<input name="patientNIC" id="NIC" type="text"
						class="form-control form-control-sm"
						placeholder="National Identity Card Number"><br> <input
						name="btnSubmit" type="submit" value="Save"
						class=" btn btn-primary"> <input type="hidden"
						id="hidPatientIDSave" name="hidPatientIDSave" value="">
				</form>
				<br>

				<!-- ALERTS -->
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>

				<br>
				<div id="divPatietsGrid">
					<%
						Patient patientobj = new Patient();
					out.print(patientobj.readPatients());
					%>
				</div>

			</div>
		</div>



	</div>

</body>
</html>
