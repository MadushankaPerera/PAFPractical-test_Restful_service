<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<meta charset="ISO-8859-1">
<title>Health care system</title>
</head>
<body>
	<div>
		<h1>Health care system</h1>
		<br>
	</div>
	<div>
		<h2>Patient Management Details</h2>
		<form method="post" action="patients.jsp">

			First Name: <input name="patientFirstName" type="text"><br>
			Last Name: <input name="patientlastName" type="text"><br>
			Full Name: <input name="patientfullName" type="text"><br>
			Home Address: <input name="patientAddress" type="text"><br>
			Date of Birth:<input name="patintDOB" type="text"><br>
			Sex: <input name="patientsex" type="text"><br> Tell-No:<input
				name="patientTell" type="text"><br> Age: <input
				name="patientAge" type="text"><br> NIC:<input
				name="patientNIC" type="text"><br> <input
				name="btnSubmit" type="submit" value="Save">
		</form>
		<br>
	</div>

</body>
</html>
