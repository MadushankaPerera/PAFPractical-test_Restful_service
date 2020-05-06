$(document).ready(function() 
{
	$("#alertSuccess").hide();
	$("#alertError").hide();
	
});	

//SAVE================================
$(document).on("click", "#btnSave", function(event) 
{   
	// Clear alerts---------------------
	$("#alertSuccess").text(""); 
	$("#alertSuccess").hide(); 
	$("#alertError").text("");
	$("#alertError").hide(); 
	
	// Form validation-------------------
	var status = validatePatientForm();
	if (status != true)
	{
		
		$("#alertError").text(status);
		$("#alertError").show();
		return;
		
	}
	
	// If valid------------------------
	var type = ($("#hidPatientIDSave").val() == "") ? "POST" : "PUT"; 
	
	$.ajax( 
	{
		
		url : "PatientsAPI",
		type : type,
		data : $("#formPatient").serialize(),
		dataType : "text",
		complete : function(response, status)
		{
			onPatientSaveComplete(response.responseText, status); 
		}
		
	});
	
});	
	
	function onPatientSaveComplete(response, status)
	{
		
		if (status == "success")
		{
			
			var resultSet = JSON.parse(response); 
			
			if (resultSet.status.trim() == "success")
			{
				
				$("#alertSuccess").text("Successfully saved."); 
				$("#alertSuccess").show(); 
				
			} else if (resultSet.status.trim() == "error")
			{
				
				$("#alertError").text(resultSet.data);
				$("#alertError").show();
				
			}
			
			
		} else if (status == "error")
		{
			
			$("#alertError").text("Error while saving.");
			$("#alertError").show(); 
		}else
		{
			$("#alertError").text("Unknown error while saving..")
			$("#alertError").show();
			
		}
		
		$("#hidPatientIDSave").val(""); 
		$("#formPatient")[0].reset();
		
		
	}
	


//REMOVE
$(document).on("click", ".btnRemove", function(event)
{
	$.ajax(
	{
		url : "PatientsAPI",
		type : "DELETE", 
		data : "patientID=" + $(this).data("patientid"), 
		dataType : "text", 
		complete : function(response, status)
		{
			onPatientDeleteComplete(response.responseText, status); 
		}
		
	});
				
});

function onPatientDeleteComplete(response, status)
{
	if (status == "success")
	{
		var resultSet = JSON.parse(response); 
		
		if (resultSet.status.trim() == "success") 
		{
			
			$("#alertSuccess").text("Successfully deleted."); 
			$("#alertSuccess").show(); 
			
			$("#divPatientsGrid").html(resultSet.data); 
			
		}else if (resultSet.status.trim() == "error") 
		{
			
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
			
		}
	} else if (status == "error") 
	{
		
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
		
	}else
	{
		
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}

}

























