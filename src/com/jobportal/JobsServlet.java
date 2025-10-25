
package com.jobportal;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class JobsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM jobs");
            ResultSet rs = ps.executeQuery();

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h2>Available Jobs</h2><ul>");
            while(rs.next()) {
                out.println("<li>" + rs.getString("title") + " at " + rs.getString("company") + " (" + rs.getString("location") + ")</li>");
            }
            out.println("</ul>");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
