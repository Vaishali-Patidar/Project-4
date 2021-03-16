<%@page import="in.com.sunrays.pro4.controller.TimeTableCtl"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="in.com.sunrays.pro4.util.HTMLUtility"%>
<%@page import="in.com.sunrays.pro4.bean.TimeTableBean"%>
<%@page import="java.util.List"%>

<%@page import="in.com.sunrays.pro4.controller.TimeTableListCtl"%>
<%@page import="in.com.sunrays.pro4.util.DataUtility"%>
<%@page import="in.com.sunrays.pro4.util.ServletUtility"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'mm/dd/yy',
			//defaultDate : "06/06/2001",
			changeMonth : true,
			changeYear : true,
			//yearRange: "c-20:c+0",
			//yearRange : "1980:2002",
		//maxDate:'0',
		// minDate:0
		yearRange : "-40:-18"
		});
	});
</script>

<meta charset="ISO-8859-1">
<title>Add Time Table</title>
</head>
<body>
<jsp:useBean id="bean" class="in.com.sunrays.pro4.bean.TimeTableBean" scope="request"></jsp:useBean>

<form action="<%=ORSView.TIMETABLE_CTL %>" method="post">

	<%@include file="Header.jsp" %>

<center>
	<%
	List <TimeTableBean> courseList =(List<TimeTableBean>)request.getAttribute("CourseList"); 
	List <TimeTableBean> subjectList = (List<TimeTableBean>)request.getAttribute("SubjectList");
	%>
	
	<input type="hidden" name="id" value="<%=bean.getId() %>">
	<input type="hidden" name="createdby" value="<%=bean.getCreatedBy() %>">
	<input type="hidden" name="modifiedby" value="<%=bean.getModifiedBy() %>">
	<input type="hidden" name="createddatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime()) %>">
	<input type="hidden" name="modifiedby" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">
	
	<div align = "center">
		<h1 >
			<% if(bean != null && bean.getId() >0 ){ %>
			
		<tr><th>Update TimeTable</th></tr>
				
			<% }else{ %>
		
		<tr ><th >Add TimeTable</th></tr>	
			<% } %>
		</h1>
		
	<h3 align="center"><font style="color: red"><%=ServletUtility.getErrorMessage(request)%></font></h3>
	<h3 align="center"><font style="color: green"><%=ServletUtility.getSuccessMessage(request) %></font></h3>
	</div>

<table>
	<tr>
	<th align="left">Course <span style="color: red">*</span> :</th>
	<td><%=HTMLUtility.getList("courseId", String.valueOf(bean.getCourseId()), courseList) %></td>
	<td style="position: fixed;"><font color="red"><%=ServletUtility.getErrorMessage("courseId",request) %></font> 
	</td></tr>
	
 <tr><th style="padding: 3px"></th></tr>   
	
	<tr><th align="left">Subject <span style="color: red">*</span> :</th>
	<td><%=HTMLUtility.getList("subjectId", String.valueOf(bean.getSubjectId()), subjectList) %></td>
	<td style="position: fixed;"><font color="red"><%=ServletUtility.getErrorMessage("subjectId",request) %></font> 
	</td></tr>
	
 <tr><th style="padding: 3px"></th></tr>   
	
	<tr>
	<th align="left">Semester<span style="color: red">*</span> :</th>
	<td><%
		LinkedHashMap<String , String> map = new LinkedHashMap< String , String>();
	    
		map.put("1st","1st");
		map.put("2nd","2nd");
		map.put("3rd","3rd");
		map.put("4th","4th");
		map.put("5th","5th");
		map.put("6th","6th");
		map.put("7th","7th");
		map.put("8th","8th");
	
		String htmlList = HTMLUtility.getList("semester", bean.getSemester(), map);
	%>
	<%=htmlList %>
	</td>
	<td style="position: fixed;"><font color="red"><%=ServletUtility.getErrorMessage("semester",request) %></font> 
	</td></tr>
	
 <tr><th style="padding: 3px"></th></tr>  
  
	
					<tr><th align="left">Exam Date <span style="color: red">*</span> :</th>
					<td><input type="text" style="width:175px" name="ExDate" id="datepicker"
						placeholder="Enter exam date" readonly="readonly"
						value="<%=DataUtility.getDateString(bean.getExamDate())%>">
						
						&nbsp;<font style="position: fixed;" color="red"> <%=ServletUtility.getErrorMessage("ExDate", request)%></font></td>
				</tr>
	
 <tr><th style="padding: 3px"></th></tr>   
 
	<tr><th align="left">Exam Time <span style="color: red">*</span> :</th>
	<td>
	<%
		LinkedHashMap<String , String > map1 = new LinkedHashMap<String  ,String >();
		map1.put("08:00 AM to 11:00 AM","08:00 AM to 11:00 AM");
		map1.put("12:00 PM to 03:00 PM","12:00 PM to 03:00 PM");
		map1.put("04:00 PM to 07:00 PM","04:00 PM to 07:00 PM");
	
		String htmlList1 = HTMLUtility.getList("ExTime", bean.getExamTime(), map1);
	%>
	<%=htmlList1 %>
	</td>
	<td style="position: fixed;"><font color="red"><%=ServletUtility.getErrorMessage("ExTime",request) %></font> 
	</td></tr>
	
<%-- 	<tr><th align = "right">Description <span style="color: red">*</span></th>
	<td><input type="text" name="description" placeholder="Enter Description" size="25" value="<%=DataUtility.getStringData(bean.getDescription())%>">
	
	<%
	if(bean != null && bean.getId()>0) {
	%>
	<%=DataUtility.getStringData(bean.getDescription()) %>
	<% } %>
	</td>
	<td style="position: fixed;"><font color="red"><%=ServletUtility.getErrorMessage("description", request) %>	</font>	</td></tr>
	
 --%>
 
 	<tr><th style="padding: 3px"></th>
	<td></td></tr>
	
	<tr><th></th><td></td>
	</tr>
	
	<tr align="center">	
	<%
	if(bean != null && bean.getId() > 0){
	%>
		<td colspan="2">
		 &emsp; &emsp;  &emsp;
		<input type="submit" name="operation" value="<%=TimeTableCtl.OP_UPDATE%>">
		 &nbsp;  &nbsp;
		<input type="submit" name="operation" value="<%=TimeTableCtl.OP_CANCEL%>">
		</td>
		<%} else { %>
		
		<td colspan="2">
		 &nbsp;  &emsp;
		<input type="submit" name="operation" value="<%=TimeTableCtl.OP_SAVE%>">
		 &nbsp;  &nbsp;
		<input type="submit" name="operation" value="<%=TimeTableCtl.OP_RESET%>">
		</td>
		<% } %>
	</tr>
</table>
</form>	
</center>

	<%@include file="Footer.jsp" %>
</body>
</html>