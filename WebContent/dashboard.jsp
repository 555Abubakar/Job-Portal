<%@ include file="header.jsp" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
    HttpSession session = request.getSession(false);
    if(session == null || session.getAttribute("username") == null){
        response.sendRedirect("login.html");
    }
%>
<h2>Welcome, <%= session.getAttribute("username") %></h2>
<a href="../WEB-INF/classes/com/jobportal/JobsServlet">View Jobs</a>
