<%@page import="in.com.sunrays.pro4.controller.CollegeCtl"%>
<%@page import="in.com.sunrays.pro4.util.DataUtility"%>
<%@page import="in.com.sunrays.pro4.util.ServletUtility"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add College</title>
</head>
<body>
<form action="CollegeCtl" method="POST">
        <%@ include file="Header.jsp"%>

        <jsp:useBean id="bean" class="in.com.sunrays.pro4.bean.CollegeBean"
            scope="request"></jsp:useBean>

        <center>
           <h1>
		<% if(bean != null && bean.getId() > 0 ) {%>
			<tr><th>Update College</th></tr>
		<%}else{ %>
			<tr><th>Add College</th></tr>
		<% }%>
	</h1>

            <H2>
                <font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
                </font>
            </H2>
            <H2>
                <font color="red"> <%=ServletUtility.getErrorMessage(request)%>
                </font>
            </H2>

            <input type="hidden" name="id" value="<%=bean.getId()%>"> <input
                type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
            <input type="hidden" name="modifiedBy"
                value="<%=bean.getModifiedBy()%>"> <input type="hidden"
                name="createdDatetime"
                value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
            <input type="hidden" name="modifiedDatetime"
                value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">

            <table>
                <tr>
                   <th align="left">Name <span style="color: red">*</span> :</th>
                    <td><input type="text" name="name"
                        value="<%=DataUtility.getStringData(bean.getName())%>"></td>
                        <td style="position: fixed" ><font
                        color="red"> <%=ServletUtility.getErrorMessage("name", request)%></font></td>
                </tr>
                <tr>
                    <th align="left">Address <span style="color: red">*</span> :</th>
                    <td><input type="text" name="address"
                        value="<%=DataUtility.getStringData(bean.getAddress())%>"></td>
                        <td style="position: fixed" ><font
                        color="red"> <%=ServletUtility.getErrorMessage("address", request)%></font></td>
                </tr>
                <tr>
                    <th align="left">State <span style="color: red">*</span> :</th>
                    <td><input type="text" name="state"
                        value="<%=DataUtility.getStringData(bean.getState())%>"></td>
                        <td style="position: fixed" ><font
                        color="red"> <%=ServletUtility.getErrorMessage("state", request)%></font></td>
                </tr>
                <tr>
                    <th align="left">City <span style="color: red">*</span> :</th>
                    <td><input type="text" name="city"
                        value="<%=DataUtility.getStringData(bean.getCity())%>"></td>
                        <td style="position: fixed" ><font
                        color="red"> <%=ServletUtility.getErrorMessage("city", request)%></font></td>
                </tr>
                <tr>
                   <th align="left">Phone No <span style="color: red">*</span> :</th>
                    <td><input type="text" name="phoneNo"
                        value="<%=DataUtility.getStringData(bean.getPhoneNo())%>"></td>
                        <td style="position: fixed" ><font
                        color="red"> <%=ServletUtility.getErrorMessage("phoneNo", request)%></font></td>
                </tr>


                <tr>
                    <th></th>
                    <td colspan="2"><input type="submit" name="operation"
                        value="<%=CollegeCtl.OP_SAVE%>"> <%
     if (bean.getId() > 0) {
 %>  <%
     }
 %>&emsp; <input type="submit" name="operation"
                        value="<%=CollegeCtl.OP_RESET%>"></td>
                </tr>
            </table>
    </form>
    </center>
    <%@ include file="Footer.jsp"%>
</body>
</html>