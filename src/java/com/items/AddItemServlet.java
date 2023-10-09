package com.items;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

@MultipartConfig
public class AddItemServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String item_name = request.getParameter("item_name");
        String item_desc = request.getParameter("item_desc");
        int item_price = Integer.parseInt(request.getParameter("item_price"));
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        Part part = request.getPart("files");
        String image_path = part.getSubmittedFileName();

        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kharidlo", "root", "payal");

            String query = "INSERT INTO kharidlo.items (item_name, item_desc, item_price, contact, emailid, img_path) VALUES(?,?,?,?,?,?);";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, item_name);
            ps.setString(2, item_desc);
            ps.setInt(3, item_price);
            ps.setString(4, contact);
            ps.setString(5, email);
            System.err.println(email);
            ps.setString(6, image_path);

            int i = ps.executeUpdate();

            HttpSession session = request.getSession();

            String path = getServletContext().getRealPath("") + "img";
            System.out.println(path);
            File f = new File(path);
            part.write(path + File.separator + image_path);

            System.err.println(email);

            if (i == 1) {
                session.setAttribute("success_msg", "Item added successfully!");
                session.setAttribute("email", email);
                response.sendRedirect("addbook.jsp");
            } else {
                session.setAttribute("failed_msg", "Something went wrong on server!");
                session.setAttribute("email", email);
                response.sendRedirect("addbook.jsp");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            e.printStackTrace();
        }
    }

}
