package com;

import java.sql.*;

public class Patient {

	// Create CONNECTION
	private Connection connect() {
		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("Jdbc:mysql://localhost:3306/patient_paf", "root", "");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;
	}

	// READ patient details
	public String readPatients() {
		String output = "";

		try {

			Connection con = connect();

			if (con == null) {

				return "Error while connecting to the database for reading.";

			}

			// Prepare the HTML table to be displayed
			output = "<table border='1'><tr><th>First Name</th><th>Last Name</th><th>Full Name</th>\""
					+ "<th>Home Address</th><th>sex</th><th>Countact Number</th><th>Age</th><th>NIC</th><th>DOB</th><th>Update</th><th>Remove</th></tr>";

			// SQL statements
			String query = "select * from ";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			// iterate through the rows in the result set
			while (rs.next()) {

				String patientID = Integer.toString(rs.getInt("patientID"));
				String firstName = rs.getString("firstName");
				String lastName = rs.getString("lastName");
				String fullName = rs.getString("fullName");
				String address = rs.getString("address");
				String sex = rs.getString("sex");
				String cNumber = Integer.toString(rs.getInt("cNumber"));
				String age = rs.getString("age");
				String nic = rs.getString("nic");
				String dob = rs.getString("dob");

				// Add into the HTML table
				output += "<tr><td><input id='hidPatientIDUpdate' name='hidPatientIDUpdate' type='hidden' value='"
						+ patientID + "'>" + firstName + "</td>";
				output += "<td>" + lastName + "</td>";
				output += "<td>" + fullName + "</td>";
				output += "<td>" + address + "</td>";
				output += "<td>" + sex + "</td>";
				output += "<td>" + cNumber + "</td>";
				output += "<td>" + age + "</td>";
				output += "<td>" + nic + "</td>";
				output += "<td>" + dob + "</td>";

				// buttons
				output += "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary'></td>"
						+ "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-patietID='"
						+ patientID + "'>" + "</td></tr>";

			}

			con.close();

			// Complete the HTML table
			output += "</table>";

		} catch (Exception e) {
			output = "Error while reading the items.";
			System.err.println(e.getMessage());
		}

		return output;
	}

	// INSERT patient Details
	public String insertPatient(String fname, String lname, String funame, String add, String sex, String cNum,
			String age, String nic, String dob) {

		String output = "";

		try {

			Connection con = connect();

			if (con == null) {

				return "Error while connecting to the database for inserting.";

			}

			// Insert Query
			String query = " INSERT INTO patienttable (`firstName`, `lastName`, `fullName`, `address`, `sex`, `cNumber`, `age`, `nic`, `dob`)"
					+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";

			// create a prepared statement
			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values

			preparedStmt.setString(1, fname);
			preparedStmt.setString(2, lname);
			preparedStmt.setString(3, funame);
			preparedStmt.setString(4, add);
			preparedStmt.setString(5, sex);
			preparedStmt.setString(6, cNum);
			preparedStmt.setString(7, age);
			preparedStmt.setString(8, nic);
			preparedStmt.setString(9, dob);

			// execute the statement
			preparedStmt.execute();
			con.close();

			String newPatients = readPatients();
			output = "{\"status\":\"success\", \"data\": \"" + newPatients + "\"}";

		} catch (Exception e) {

			output = "{\"status\":\"error\",\"data\":\"Error while inserting the Patient Details.\"}";
			System.err.println(e.getMessage());

		}

		return output;

	}

	// UPDATE patient Details
	public String updatePatient(String fname, String lname, String funame, String add, String sex, String cNum,
			String age, String nic, String dob) {

		String output = "";

		try {
			Connection con = connect();

			if (con == null) {

				return "Error while connecting to the database for updating.";

			}

			// Update query
			String query = "UPDATE patienttable SET patientID=?, firstName=?, lastName=?, fullName=?, address=?, sex=?, cNumber=?, age=?, nic=?, dob=? WHERE patientID=?";

			// create a prepared statement
			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values
			preparedStmt.setString(1, fname);
			preparedStmt.setString(2, lname);
			preparedStmt.setString(3, funame);
			preparedStmt.setString(4, add);
			preparedStmt.setString(5, sex);
			preparedStmt.setString(6, cNum);
			preparedStmt.setString(7, age);
			preparedStmt.setString(8, nic);
			preparedStmt.setString(9, dob);

			// execute the statement
			preparedStmt.execute();
			con.close();

			String newPatients = readPatients();
			output = "{\"status\":\"success\", \"data\": \"" + newPatients + "\"}";

		} catch (Exception e) {

			output = "{\"status\":\"error\", \"data\": \"Error while updating the Patient Details.\"}";
			System.err.println(e.getMessage());

		}

		return output;

	}

	// DELETE patient Details
	public String deletePatient(String patientID) {

		String output = "";

		try {
			Connection con = connect();

			if (con == null) {

				return "Error while connecting to the database for deleting.";

			}

			// Delete query
			String query = "delete from patienttable where patientID=?";

			// create a prepared statement
			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values
			preparedStmt.setInt(1, Integer.parseInt(patientID));

			// execute the statement
			preparedStmt.execute();
			con.close();

			String newPatients = readPatients();
			output = "{\"status\":\"success\", \"data\": \"" + newPatients + "\"}";

		} catch (Exception e) {

			output = "{\"status\":\"error\", \"data\": \"Error while deleting the Patient Details.\"}";
			System.err.println(e.getMessage());

		}

		return output;
	}

}// end
