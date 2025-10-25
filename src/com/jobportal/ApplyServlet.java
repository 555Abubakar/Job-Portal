package com.jobportal;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class ApplyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            HttpSession session = request.getSession(false);
            if(session == null || session.getAttribute("user_id") == null){
                response.sendRedirect("login.html");
                return;
            }
            int user_id = (Integer)session.getAttribute("user_id");
            int job_id = Integer.parseInt(request.getParameter("job_id"));

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal","root","");
            PreparedStatement ps = con.prepareStatement("INSERT INTO applications(user_id, job_id) VALUES(?, ?)");
            ps.setInt(1, user_id);
            ps.setInt(2, job_id);
            ps.executeUpdate();
            con.close();

            response.sendRedirect("jobs.jsp");
        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
