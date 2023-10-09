<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Sell Book Page</title>

        <%@include file="csslinks.jsp" %>
    </head>

    <body style="background: url(img/bg.jpg); background-size: cover; background-attachment: fixed;">

        <!<!-- Navigation Bar -->
        <nav style="background-color: transparent">
            <div class="container">
                <div class="nav-wrapper">
                    <div class="brand-logo left"><img src="img/KharidLow Logo.png" height="50" width="120"></div>
                    <ul id="nav-mobile" class="right hide-on-med-and-down">
                        <li><a href="index.jsp"><i class="material-icons left">home</i>Home</a></li>
                        <li><%= request.getParameter("email")%></li>
                        <li><a href="logoutservlet"><i class="material-icons left">settings_power</i></a></li>
                    </ul>
                </div>
            </div>  
        </nav>

        <%
            String email = request.getParameter("email");
        %>

        <div class="container">
            <div class="row">

                <p style="margin-top: 40px; margin-bottom: 2px; font-weight: bold; font-size: 30px; color: whitesmoke; text-align: center; padding: 0px">Add Item</p>

                <div class="col s6 offset-m3" style="border: none; margin-top: 18px">

                    <div class="sellitem-card">
                        <form action="additemservlet" method="post" id="myform"  enctype = "multipart/form-data" style="padding: 20px">
                            <c:if test="${not empty success_msg}">
                                <div class="msg" style="text-align: center; display: flex; align-content: center">
                                    <span  class="new badge" data-badge-caption="${success_msg}"></span>
                                </div>
                                <c:remove var="success_msg" scope="session"/>
                            </c:if>

                            <c:if test="${not empty failed_msg}">
                                <div class="msg" style="text-align: center; display: flex; align-content: center">
                                    <span class="new badge red" data-badge-caption="${failed_msg}"></span>
                                </div>
                                <c:remove var="failed_msg" scope="session"/>
                            </c:if>

                            <div class="item_name">
                                <input name="item_name" id="item_name" type="text" placeholder="Item name" style="color: whitesmoke" class="validate" required>
                            </div>
                            <div class="item_desc">
                                <input name="item_desc" id="item_desc" type="text" placeholder="Item Description (optional)" style="color: whitesmoke" class="validate">
                            </div>
                            <div class="item_price">
                                <input name="item_price" id="item_price" type="number" placeholder="Item Price" style="color: whitesmoke" class="validate" required>
                            </div>
                            <div class="contact">
                                <input name="contact" id="contact" type="text" placeholder="Your Contact" style="color: whitesmoke" class="validate">
                            </div>
                            <input type="hidden" name="email" id="email" value=<%= email %> />
                            <div class="files" style="margin: 10px 0px">
                                <label for="files" style="color: whitesmoke; opacity: 80%; font-size: 16px">Select image: </label>
                                <input name="files" id="files" type="file" placeholder="Choose Images" style="color: whitesmoke" class="validate" required>
                            </div>
                            <div class="sell-btn" style="display: flex; justify-content: center; align-items: center">
                                <button type="submit" class="btn waves-effect waves-light orange darken-2">SELL</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

        <script>

        </script>
    </body>
</html>
