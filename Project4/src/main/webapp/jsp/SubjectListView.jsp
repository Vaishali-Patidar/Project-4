<%@page import="in.com.sunrays.pro4.model.SubjectModel"%>
<%@page import="in.com.sunrays.pro4.model.CourseModel"%>
<%@page import="java.beans.beancontext.BeanContext"%>
<%@page import="in.com.sunrays.pro4.util.HTMLUtility"%>
<%@page import="in.com.sunrays.pro4.bean.CourseBean"%>
<%@page import="in.com.sunrays.pro4.controller.SubjectListCtl"%>
<%@page import="in.com.sunrays.pro4.bean.SubjectBean"%>
<%@page import="in.com.sunrays.pro4.util.DataUtility"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.com.sunrays.pro4.util.ServletUtility"%>
<%@page import="in.com.sunrays.pro4.controller.ORSView"%>
<!DOCTYPE html>
<html>
<head>
<script src="<%=ORSView.APP_CONTEXT %>/js/jquery.min.js"></script>
<script src="<%=ORSView.APP_CONTEXT %>/js/Checkbox11.js"></script>
<meta charset="ISO-8859-1">
<title>Subject List</title>
</head>
<body>
<jsp:useBean id="bean" class="in.com.sunrays.pro4.bean.SubjectBean" scope="request"></jsp:useBean>
<jsp:useBean id="cobean" class="in.com.sunrays.pro4.bean.CourseBean" scope="request"></jsp:useBean>


<center>

<form action="<%=ORSView.SUBJECT_LIST_CTL%>" method="post">
	<%@include file ="Header.jsp"%>
	
	<div align="center">
    			<h1>Subject List</h1>
                <h3><font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
                <font color="green"><%=ServletUtility.getSuccessMessage(request)%></font></h3>
                    
	</div>
	
	<%
		List<SubjectBean> slist = (List<SubjectBean>)request.getAttribute("subjectList");
	
		List<CourseBean> clist =  (List<CourseBean>) request.getAttribute("courseList");
		
		 int next=DataUtility.getInt(request.getAttribute("nextlist").toString());

	%>
		<% 
		int pageNo = ServletUtility.getPageNo(request);
		int pageSize = ServletUtility.getPageSize(request);
		int index = ((pageNo - 1) * pageSize) + 1;
		
		List list = ServletUtility.getList(request);
		Iterator<SubjectBean> it = list.iterator();

			if(list.size() !=0) {
			%>
	
	
	<table width="100%" align="center">
		<tr>
		 <td align="center"><label>Subject Name :</label>
		 <input	type="text" name="name" placeholder="Enter Subject Name"
						value="<%=ServletUtility.getParameter("name", request)%>">
		          
		 
		<%--  <%=HTMLUtility.getList("subjectname", String.valueOf(bean.getId()), slist) %>
			 --%>
			 
		  <label>CourseName :</label>
		<%=HTMLUtility.getList("coursename", String.valueOf(bean.getCourseId()), clist) %>
		&nbsp; 
		
		&nbsp;
		<input type="submit" name="operation" value="<%=SubjectListCtl.OP_SEARCH%>">			
		
		&nbsp;
		<input type="submit" name="operation" value="<%=SubjectListCtl.OP_RESET %>">
			</td>
	</tr>
	</table>
	<br>
	
	<table border="1" width="100%" align="center" cellpadding=6px cellspacing=".2">
		 <tr style="background: skyblue">
			<th><input type="checkbox" id="select_all" name ="select"> Select All.</th>
			
			<th>S.No.</th>
			<th>Subject Name</th>
			<th>Description</th>
			<th>CourseName</th>
			<th>Edit</th>							
		</tr>
		
		<%
			while (it.hasNext())
			{
				bean = it.next();	
		%>
		
		
		<tr align="center">
		<td> <input type="checkbox" class="checkbox" name="ids" value="<%=bean.getId()%>"></td>
		<td><%=index++ %></td>		
		<td><%=bean.getSubjectName() %></td>
		<td><%=bean.getDescription() %></td>
		<td><%=bean.getCourseName() %></td>
		<td><a href ="SubjectCtl?id=<%=bean.getId() %>" >Edit</a></td>
		</tr>
		
		<%
		}
		%>
	</table>
	
	<table width="100%">
		<tr>
		<% if(pageNo == 1){ %>
		<td align="left" ><input type="submit" name="operation" disabled="disabled" value="<%=SubjectListCtl.OP_PREVIOUS %>"></td>
		 <%}else{ %>
		 <td align="left" ><input type="submit" name="operation" value="<%=SubjectListCtl.OP_PREVIOUS %>"></td>
		 <%} %>
		<td><input type="submit" name="operation" value="<%=SubjectListCtl.OP_DELETE %>"></td> 
		<td><input type="submit" name="operation" value="<%=SubjectListCtl.OP_NEW %>"></td> 
		
		<%-- <%
			SubjectModel model = new SubjectModel();
		%>
			
		<% if(list.size() < pageSize || model.nextPk() - 1 == bean.getId()) { %>		
		<td align="right"><input type="submit" name="operation" disabled="disabled"  value="<%=SubjectListCtl.OP_NEXT %>"></td>
		<%}else{ %>
				<td align="right"><input type="submit" name="operation" value="<%=SubjectListCtl.OP_NEXT %>"></td>
		<%} %> --%>
		
		 <td align="right"><input type="submit"  name="operation" value="<%=SubjectListCtl.OP_NEXT%>" <%=(list.size()<pageSize||next==0)?"disabled":"" %>> </td>
		
		</tr>
	</table>
					<%}if(list.size() == 0){ %>
            		<td align="center"><input type="submit" name="operation" value="<%=SubjectListCtl.OP_BACK%>"></td>
            		
            		<% } %>
            		
	<input type="hidden" name="pageNo" value="<%=pageNo%>">
	<input type="hidden" name="pageSize" value="<%=pageSize%>">
</form>
</br>
</br>
</center>

	<%@include file = "Footer.jsp" %>
</body>
</html>