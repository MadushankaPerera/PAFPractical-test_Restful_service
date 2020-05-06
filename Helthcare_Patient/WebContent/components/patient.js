$(document).ready(function() {
	$("#alertSuccess").hide();
	$("#alertError").hide();

});

// SAVE================================
$(document).on("click", "#btnSave", function(event) {
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();

	// Form validation-------------------
	var status = validatePatientForm();
	if (status != true) {

		$("#alertError").text(status);
		$("#alertError").show();
		return;

	}

	// If valid------------------------
	var type = ($("#hidPatientIDSave").val() == "") ? "POST" : "PUT";

	$.ajax({

		url : "PatientsAPI",
		type : type,
		data : $("#formPatient").serialize(),
		dataType : "text",
		complete : function(response, status) {
			onPatientSaveComplete(response.responseText, status);
		}

	});

});

function onPatientSaveComplete(response, status) {

	if (status == "success") {

		var resultSet = JSON.parse(response);

		if (resultSet.status.trim() == "success") {

			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();

		} else if (resultSet.status.trim() == "error") {

			$("#alertError").text(resultSet.data);
			$("#alertError").show();

		}

	} else if (status == "error") {

		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while saving..")
		$("#alertError").show();

	}

	$("#hidPatientIDSave").val("");
	$("#formPatient")[0].reset();

}

// REMOVE
$(document).on("click", ".btnRemove", function(event) {
	$.ajax({
		url : "PatientsAPI",
		type : "DELETE",
		data : "patientID=" + $(this).data("patientID"),
		dataType : "text",
		complete : function(response, status) {
			onPatientDeleteComplete(response.responseText, status);
		}

	});

});

function onPatientDeleteComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);

		if (resultSet.status.trim() == "success") {

			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();

			$("#divPatientsGrid").html(resultSet.data);

		} else if (resultSet.status.trim() == "error") {

			$("#alertError").text(resultSet.data);
			$("#alertError").show();

		}
	} else if (status == "error") {

		$("#alertError").text("Error while deleting.");
		$("#alertError").show();

	} else {

		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}

	

	// CLIENT MODEL
	function validatePatientForm() {
		// First Name
		if ($("#FirstName").val().trim() == "") {
			return "Insert First Name in textbox."
		}

		// Last Name
		if ($("#LastName").val().trim() == "") {
			return "Insert Last Name in textbox."
		}

		// Last Name
		if ($("#FullName").val().trim() == "") {
			return "Insert Last Name in textbox."
		}

		// Address
		if ($("#HomeAddress").val().trim() == "") {
			return "Insert Home Address in textbox."
		}

		// Date of Birth
		if ($("#DateofBirth").val().trim() == "") {
			return "Insert Date of Birth in textbox."
		}

		// Sex
		if ($("#Sex").val().trim() == "") {
			return "Insert Gender in textbox."
		}

		// Tell-No
		if ($("#Tell-No").val().trim() == "") {
			return "Insert Tell-No in textbox."
		}

		// Age
		if ($("#Age").val().trim() == "") {
			return "Insert Age in textbox."
		}

		// NIC
		if ($("#NIC").val().trim() == "") {
			return "Insert NIC in textbox."
		}

	}

}
