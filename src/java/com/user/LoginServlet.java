package com.user;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;
import javax.servlet.ServletException;

public class LoginServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kharidlo", "root", "payal");

            PreparedStatement ps = con.prepareStatement("SELECT * from kharidlo.login where emailid=? and password=?");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            System.out.println("Check");

            if (rs.next()) {
                RequestDispatcher rd = request.getRequestDispatcher("homepage.jsp");
                request.setAttribute("email",email);
                rd.forward(request, response);
            } else {
                out.println("Username or Password incorrect");
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.include(request, response);
            }
        } catch (ClassNotFoundException | SQLException | ServletException e) {
            System.out.println(e);
        }
    }

}
