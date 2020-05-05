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
</head>
<body>
	<div class="container">

		<div class="row">
			<div class="col">
				<h2 class ="text-primary ">Patient Management Details</h2><br>
				<form method="post" action="patients.jsp">

					First Name: <input name="patientFirstName" type="text" class="form-control form-control-sm" placeholder="Enter your first name here"><br>
					Last Name: <input name="patientlastName" type="text" class="form-control form-control-sm" placeholder="Enter your last name here"><br>
					Full Name: <input name="patientfullName" type="text"class="form-control form-control-sm" placeholder="Enter your full name here"><br>
					Home Address: <input name="patientAddress" type="text" class="form-control form-control-sm" placeholder="Enter permenet Home Address"><br>
					Date of Birth:<input name="patintDOB" type="text" class="form-control form-control-sm" placeholder="Enter your birth day"><br>
					Sex: <input name="patientsex" type="text" class="form-control form-control-sm" placeholder="Enter your sex: EX. Male : 'M' Female : 'F' "><br>
					Tell-No:<input name="patientTell" type="text" class="form-control form-control-sm" placeholder="Telephone Number"><br>
					Age: <input name="patientAge" type="text" class="form-control form-control-sm" placeholder="Age for Today"><br> 
					NIC:<input name="patientNIC" type="text" class="form-control form-control-sm" placeholder="National Identity Card Number"><br>
					 
					<input name="btnSubmit" type="submit" value="Save" class = " btn btn-primary">
				</form>
				<br>
			</div>
		</div>



	</div>

</body>
</html>
