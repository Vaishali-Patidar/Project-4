<%@page import="in.com.sunrays.pro4.controller.MarksheetListCtl"%>
<%@page import="in.com.sunrays.pro4.controller.BaseCtl"%>
<%@page import="in.com.sunrays.pro4.util.ServletUtility"%>
<%@page import="in.com.sunrays.pro4.bean.MarksheetBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<!DOCTYPE html>
<html>
<head>
<script src="<%=ORSView.APP_CONTEXT %>/js/jquery.min.js"></script>
<script src="<%=ORSView.APP_CONTEXT %>/js/Checkbox11.js"></script>
<meta charset="ISO-8859-1">
<title>Marksheet List</title>
</head>
<body>
 <%@include file="Header.jsp"%>
    <center>
        <h1>Marksheet List</h1>

        <form action="<%=ORSView.MARKSHEET_LIST_CTL%>" method="POST">

            <table width="100%">
                <tr>
                    <td align="center"><label> Name :</label> <input type="text"
                        name="name"
                        value="<%=ServletUtility.getParameter("name", request)%>">
                        &emsp; <label>RollNo :</label> <input type="text" name="rollNo"
                        value="<%=ServletUtility.getParameter("rollNo", request)%>">&emsp;
                        <input type="submit" name="operation" value="<%=MarksheetListCtl.OP_SEARCH %>"></td>
                </tr>
            </table>
            <br>
            <table border="1" width="100%">
               <tr style="background: skyblue">
                    <th ><input type="checkbox" id="select_all" name ="Select">Select All.</th>
                    <th>ID</th>
                    <th>RollNo</th>
                    <th>Name</th>
                    <th>Physics</th>
                    <th>Chemistry</th>
                    <th>Maths</th>
                    <th>Edit</th>
                </tr>
                <tr>
                    <td colspan="8"><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></td>
                </tr>
                <%
                    int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int index = ((pageNo - 1) * pageSize) + 1;

                    List list = ServletUtility.getList(request);
                    Iterator<MarksheetBean> it = list.iterator();

                    while (it.hasNext()) {

                        MarksheetBean bean = it.next();
                %>
                <tr>
                    <td align="center"><input type="checkbox" class="checkbox" name="ids" value="<%=bean.getId()%>"></td>
                    <td align="center"><%=bean.getId()%></td>
                    <td align="center"><%=bean.getRollNo()%></td>
                    <td align="center"><%=bean.getName()%></td>
                    <td align="center"><%=bean.getPhysics()%></td>
                    <td align="center"><%=bean.getChemistry()%></td>
                    <td align="center"><%=bean.getMaths()%></td>
                    <td align="center"><a href="MarksheetCtl?id=<%=bean.getId()%>">Edit</a></td>
                </tr>

                <%
                    }
                %>
            </table>
            <table width="100%">
                <tr>
                    <td><input type="submit" name="operation"
                        value="<%=MarksheetListCtl.OP_PREVIOUS%>"></td>
                    <td><input type="submit" name="operation"
                        value="<%=MarksheetListCtl.OP_NEW%>"></td>
                    <td><input type="submit"
                        name="operation" value="<%=MarksheetListCtl.OP_DELETE%>"></td>
                    <td align="right"><input type="submit" name="operation"
                        value="<%=MarksheetListCtl.OP_NEXT%>"></td>
                </tr>
            </table>
            <input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
                type="hidden" name="pageSize" value="<%=pageSize%>">
        </form>
    </center>
    <%@include file="Footer.jsp"%>
</body>
</html>