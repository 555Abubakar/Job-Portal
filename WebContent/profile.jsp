<%@ include file="header.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ include file="header.jsp" %>

<%
    HttpSession session = request.getSession(false);
    if(session == null || session.getAttribute("user_id") == null){
        response.sendRedirect("login.html");
    }
    int user_id = (Integer)session.getAttribute("user_id");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal","root","");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE id=" + user_id);
    rs.next();
%>

<h2>Your Profile</h2>
<form action="ProfileServlet" method="post">
Username: <input type="text" name="username" value="<%= rs.getString("username") %>"><br>
Email: <input type="text" name="email" value="<%= rs.getString("email") %>"><br>
Password: <input type="password" name="password" value="<%= rs.getString("password") %>"><br>
<input type="submit" value="Update Profile">
</form>

<%
con.close();
%>
