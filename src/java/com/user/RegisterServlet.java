package com.user;

import java.io.*;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;
import javax.servlet.ServletException;

public class RegisterServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Thread.sleep(1000);

            Class.forName("com.mysql.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kharidlo", "root", "payal");

            String query = "INSERT INTO kharidlo.login (emailid,password) VALUES (?,?);";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);

            ps.executeUpdate();

            out.println("<h2>Done!</h2>");
            out.println("Welcome user");
            RequestDispatcher rd = request.getRequestDispatcher("homepage.jsp");
            rd.forward(request, response);
        } catch (Exception ex) {
            out.println("<h2>Error..</h2>");
        }
    }
}
