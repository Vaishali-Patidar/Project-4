<%@page import="in.com.sunrays.pro4.controller.UserCtl"%>
<%@page import="java.util.List"%>
<%@page import="in.com.sunrays.pro4.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.com.sunrays.pro4.util.DataUtility"%>
<%@page import="in.com.sunrays.pro4.util.ServletUtility"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="ISO-8859-1">
<title>Add User</title>
</head>
<body>
  <form action="<%=ORSView.USER_CTL%>" method="post">
        <%@ include file="Header.jsp"%>
<!--         <script type="text/javascript" src="../js/calendar.js"></script> -->
        <jsp:useBean id="bean" class="in.com.sunrays.pro4.bean.UserBean"
            scope="request"></jsp:useBean>

        <%
            List l = (List) request.getAttribute("roleList");
        %>

        <center>
            <h1>
		<% if(bean != null && bean.getId() > 0 ) {%>
			<tr><th>Update User</th></tr>
		<%}else{ %>
			<tr><th>Add User</th></tr>
		<% }%>
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
                   <th align="left">First Name<span style="color: red">*</span> :</th>
                    <td><input type="text" name="firstName"
                        value="<%=DataUtility.getStringData(bean.getFirstName())%>"></td>
                        
                       <td style="position: fixed"><font color="red"> <%=ServletUtility.getErrorMessage("firstName", request)%></font></td>
                </tr>
                <tr>
                    <th align="left">Last Name<span style="color: red">*</span> :</th>
                    <td><input type="text" name="lastName"
                        value="<%=DataUtility.getStringData(bean.getLastName())%>"></td>
                        <td style="position: fixed" ><font
                        color="red"> <%=ServletUtility.getErrorMessage("lastName", request)%></font></td>
                </tr>
                <tr>
                    <th align="left">Login Id<span style="color: red">*</span> :</th>
                    <td><input type="text" name="login"
                        value="<%=DataUtility.getStringData(bean.getLogin())%>"
                        <%=(bean.getId() > 0) ? "readonly" : ""%>></td>
                        <td style="position: fixed" ><font
                        color="red"> <%=ServletUtility.getErrorMessage("login", request)%></font></td>
                </tr>
                <tr>
                    <th align="left">Password<span style="color: red">*</span> :</th>
                    <td><input type="password" name="password"
                        value="<%=DataUtility.getStringData(bean.getPassword())%>"></td>
                        <td style="position: fixed" ><font
                        color="red"> <%=ServletUtility.getErrorMessage("password", request)%></font></td>
                </tr>
                <tr>
                    <th align="left">Confirm Password<span style="color: red">*</span> :</th>
                    <td><input type="password" name="confirmPassword"
                        value="<%=DataUtility.getStringData(bean.getPassword())%>"></td>
                        <td style="position: fixed" ><font
                        color="red"> <%=ServletUtility.getErrorMessage("confirmPassword",
                    request)%></font></td>
                </tr>
                
                 <tr>
                   <th align="left">Mobile Number<span style="color: red">*</span> :</th>
                    <td><input type="text" name="mobile"
                        
                        value="<%=DataUtility.getStringData(bean.getMobileNo())%>"></td>
                        <td style="position: fixed" ><font
                        color="red"> <%=ServletUtility.getErrorMessage("mobile", request)%></font></td>
                </tr>
                
                <tr>
                    <th align="left">Gender<span style="color: red">*</span> :</th>
                    <td>
                        <%
                            HashMap map = new HashMap();
                       
                            map.put("Male", "Male");
                            map.put("Female", "Female");

                            String htmlList = HTMLUtility.getList("gender", bean.getGender(),
                                    map);
                        %> <%=htmlList%></td>
                         <td style="position: fixed">
                    <font color="red"><%=ServletUtility.getErrorMessage("gender", request)%></font></td>
                   </tr>
                    <tr>
					
					<th align="left">Role<span style="color: red">*</span> :
					</th>
					<td><%=HTMLUtility.getList("roleId", String.valueOf(bean.getRoleId()),l)%></td>
					<td style="position: fixed"><font style="position: fixed"
						color="red"> <%=ServletUtility.getErrorMessage("roleId", request)%></font></td>
				</tr>
				
                <tr>
					<th align="left">Date Of Birth<font color="red">*</font></th>
					<td><input type="text" name="dob" id="datepicker"
						placeholder="Enter Date Of Birth" readonly="readonly"
						value="<%=DataUtility.getDateString(bean.getDob())%>">
						&nbsp;<font style="position: fixed;" color="red"> <%=ServletUtility.getErrorMessage("dob", request)%></font></td>
				</tr>
                <tr>
                    <th></th>
                    <td colspan="2"><input type="submit" name="operation"
                        value="<%=UserCtl.OP_SAVE%>">&emsp; <input type="submit"
                        name="operation" value="<%=UserCtl.OP_RESET%>"></td>
                </tr>
            </table>
    </form>
    </center>
    <%@ include file="Footer.jsp"%>
</body>
</html>