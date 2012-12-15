<%@ include file="/WEB-INF/template/include.jsp" %>
<%@ page import="java.io.*" %>

<%--Get's the patient's default (preferred) identifier --%>
<c:set var="idnum" value="${model.patient.activeIdentifiers[0].identifier}"/> 

<%--The following section of code checks whether or not a file system folder exists for the patient and, if not, creates one --%>
<%
String idnumber = (String) pageContext.getAttribute("idnum");
String filepath = org.openmrs.api.context.Context.getAdministrationService().getGlobalProperty("filebrowser.patientfilepath");

filepath = filepath + idnumber;

java.io.File file = new File(filepath); 

if(!file.exists()) 
	file.mkdirs();  
%>

</br>

<%--Inserts iframe with source path of global property and appends preferred patient ID --%>
<iframe src="<openmrs:globalProperty key="filebrowser.url"/>${model.patient.activeIdentifiers[0]}" height="600" width="800"></iframe>


