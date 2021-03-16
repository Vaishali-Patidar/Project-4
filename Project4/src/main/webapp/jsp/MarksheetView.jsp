<%@page import="in.com.sunrays.pro4.controller.MarksheetCtl"%>
<%@page import="java.util.List"%>
<%@page import="in.com.sunrays.pro4.util.HTMLUtility"%>
<%@page import="in.com.sunrays.pro4.util.DataUtility"%>
<%@page import="in.com.sunrays.pro4.util.ServletUtility"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Add Marksheet</title>
</head>
<body>
   <form action="<%=ORSView.MARKSHEET_CTL%>" method="post">
        <%@ include file="Header.jsp"%>

        <jsp:useBean id="bean" class="in.com.sunrays.pro4.bean.MarksheetBean"
            scope="request"></jsp:useBean>

        <%
            List l = (List) request.getAttribute("studentList");
        %>

       <center>
			<h1>
				<%
					if (bean != null && bean.getId() > 0) {
				%>

				<tr>
					<th>Update Marksheet</th>
				</tr>
				<%
					} else {
				%>

				<tr>
					<th>Add Marksheet</th>
				</tr>
				<%
					}
				%>
			</h1>
            <H2>
                <font color="red"> <%=ServletUtility.getErrorMessage(request)%>
                </font>
            </H2>
            <H2>
                <font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
                </font>
            </H2>


            <input type="hidden" name="id" value="<%=bean.getId()%>">
            <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
            <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
            <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
            <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">
            

            <table>
                <tr>
                   <th align="left"> Rollno <span style="color: red">*</span> :</th>
                    <td><input type="text" name="rollNo"
                        value="<%=DataUtility.getStringData(bean.getRollNo())%>"
                        <%=(bean.getId() > 0) ? "readonly" : ""%>> </td>
                        <td style="position: fixed;"><font color="red"> <%=ServletUtility.getErrorMessage("rollNo", request)%></font></td>
                </tr>
                <tr><th style="padding: 3px"></th></tr>
                
                <tr>
                    <th align="left"> Name <span style="color: red">*</span> :</th>
                    <td><%=HTMLUtility.getList("studentId",
                    String.valueOf(bean.getStudentId()), l)%></td>
                </tr>
                <tr><th style="padding: 3px"></th></tr>
                
                <tr>
                    <th align="left">Physics<span style="color: red">*</span> :</th>
                    <td><input type="text" name="physics"
                        value="<%=DataUtility.getStringData(bean.getPhysics())%>"></td>
                        <td style="position: fixed;"><font
                        color="red"> <%=ServletUtility.getErrorMessage("physics", request)%></font></td>
                </tr>
                <tr><th style="padding: 3px"></th></tr>
                
                <tr>
                    <th align="left">Chemistry<span style="color: red">*</span> :</th>
                    <td><input type="text" name="chemistry"
                        value="<%=DataUtility.getStringData(bean.getChemistry())%>"></td>
                        <td style="position: fixed;"><font
                        color="red"> <%=ServletUtility.getErrorMessage("chemistry", request)%></font></td>
                </tr>
                <tr><th style="padding: 3px"></th></tr>
                
                <tr>
                    <th align="left"> Maths <span style="color: red">*</span> :</th>
                    <td><input type="text" name="maths"
                        value="<%=DataUtility.getStringData(bean.getMaths())%>"></td>
                        <td style="position: fixed;"><font color="red"> <%=ServletUtility.getErrorMessage("maths", request)%></font></td>

                </tr>
                <tr>
                    <th></th>
                    <td colspan="2"><input type="submit" name="operation"
                        value="<%=MarksheetCtl.OP_SAVE%>"> <%
     if (bean.getId() > 0) {
 %> <%
     }
 %> <input type="submit" name="operation"
                        value="<%=MarksheetCtl.OP_RESET%>"></td>
                </tr>
            </table>
        </form>
        </center>
        <%@ include file="Footer.jsp"%>
</body>
</html>