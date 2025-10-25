<%@ include file="header.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ include file="header.jsp" %>

<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal","root","");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM jobs");
%>

<h2>Available Jobs</h2>
<table border="1">
<tr>
<th>ID</th>
<th>Title</th>
<th>Company</th>
<th>Location</th>
<th>Action</th>
</tr>
<%
while(rs.next()){
%>
<tr>
<td><%= rs.getInt("id") %></td>
<td><%= rs.getString("title") %></td>
<td><%= rs.getString("company") %></td>
<td><%= rs.getString("location") %></td>
<td>
<form action="ApplyServlet" method="post">
<input type="hidden" name="job_id" value="<%= rs.getInt("id") %>">
<input type="submit" value="Apply">
</form>
</td>
</tr>
<%
}
con.close();
%>
</table>
