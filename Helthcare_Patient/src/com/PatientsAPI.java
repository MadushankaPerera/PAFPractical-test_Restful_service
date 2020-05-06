package com;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PatientsAPI
 */
@WebServlet("/PatientsAPI")
public class PatientsAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Patient Object
	Patient patientobj = new Patient();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PatientsAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	

	// INSERT
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// for Insert Operation
		String output = patientobj.insertPatient(request.getParameter("firstName"), request.getParameter("lastName"),
				request.getParameter("fullName"), request.getParameter("address"), request.getParameter("sex"),
				request.getParameter("cNumber"), request.getParameter("age"), request.getParameter("nic"),
				request.getParameter("dob"));

		response.getWriter().write(output);

	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
//		Map paras = getParasMap(request);
//		
//		String output = patientobj.updatePatient(paras.get("hidPatientIDSave").toString(), 
//							paras.get("firstName").toString(),
//							paras.get("lastName").toString(), 
//							paras.get("fullName").toString(), 
//							paras.get("address").toString(),
//							paras.get("sex").toString(),
//							paras.get("cNumber").toString(), 
//							paras.get("age").toString(), 
//							paras.get("nic").toString(),
//							paras.get("dob").toString()); 
//		
//		response.getWriter().write(output); 
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
