<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Home Page</title>

        <%@include file="csslinks.jsp" %>
        
        <style>
            tr {
                padding: 10px;
                font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            }
            .email_block:hover
            {
                font-weight: bold;
                color: #7e6365;
                background-color: rgba(140, 124, 124, 0.366);
            }
        </style>
    </head>

    <body style="background: url(img/bg.jpg); background-size: cover; background-attachment: fixed;">

        <%
            String email = request.getParameter("email");
        %>

        <!<!-- Navigation Bar -->
        <nav style="background-color: transparent">
            <div class="container">
                <div class="nav-wrapper">
                    <div class="brand-logo left"><img src="img/KharidLow Logo.png" height="50" width="120"></div>
                    <ul id="nav-mobile" class="right hide-on-med-and-down">
                        <li><%= request.getParameter("email")%></li>
                        <li><a href="logoutservlet"><i class="material-icons left">settings_power</i></a></li>
                        <li><a href="addbook.jsp?email=${email}" class="waves-effect waves-light btn orange darken-2">Sell</a></li>
                    </ul>
                </div>
            </div>  
        </nav>

        <%
            ArrayList<ArrayList<String>> allbooks = new ArrayList<>();
            try {
                Class.forName("com.mysql.jdbc.Driver");

                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kharidlo", "root", "payal");

                String query = "SELECT * FROM kharidlo.items;";
                PreparedStatement ps = con.prepareStatement(query);

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    ArrayList<String> book = new ArrayList<>();

                    String item_name = rs.getString("item_name");
                    String item_desc = rs.getString("item_desc");
                    String item_price = Integer.toString(rs.getInt("item_price"));
                    String contact = rs.getString("contact");
                    String emailid = rs.getString("emailid");
                    String img_path = rs.getString("img_path");

                    book.add(item_name);
                    book.add(item_desc);
                    book.add(item_price);
                    book.add(contact);
                    book.add(emailid);
                    book.add(img_path);

                    allbooks.add(book);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>

        <div class="container" style="margin-top: 20px">
            <table  style="color: black; background-color: whitesmoke; border:  gray solid; border:0cm; height: fit-content; box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);">
                <%
                    for (ArrayList<String> book : allbooks) {
                %>
                <tbody>
                    <tr>
                        <th rowspan="5" style="width:fit-content"><img alt="Item Image" src="img/<%= book.get(5)%>" width="350" height="300"></th>
                        <th colspan="2" style="width: 1000px; font-size: 25px;"><%= book.get(0)%></th>
                    </tr>
                    <tr>
                        <td colspan="2"><%= book.get(1)%></td>
                    </tr>
                    <tr>
                        <td colspan="2">Price: <%= book.get(2)%></td>
                    </tr>
                    <tr>
                        <td colspan="2">Contact: <%= book.get(3)%></td>
                    </tr>
                    <tr class="email_block">
                        <td>Listed By: <%= book.get(4)%></td>
                        <td><a href="mailto:<%= book.get(4)%>?Subject=Regarding '<%= book.get(0)%>' purchase" class="waves-effect waves-light btn orange darken-2">BUY NOW</a></td>
                    </tr>
                </tbody>
                <%
                    }
                %>
            </table>
        </div>

    </body>
</html>
