<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us</title>

        <%@include file="csslinks.jsp" %>
    </head>

    <style>
        body{
            color: whitesmoke;
        }
        fieldset{
            width:35%;
            box-shadow: 0 0 20px hsla(192, 27%, 53%, 0.15);
            margin: auto;
            margin-top: 10%;
            border-radius: 3%;
            border-bottom-color: hsl(27, 100%, 34%);
            border-bottom-width: 5px;
            border-right-color: hsl(27, 100%, 34%);
            border-right-width: 5px;
            font-size: 16px;
            padding: 20px;

        }

        a{
            text-decoration: none;
            color:white;
        }

        legend{
            font-size: 20px;
        }
    </style>
    <body style="background: url(img/bg.jpg); background-size: cover; background-attachment: fixed;">
        <!<!-- Navigation Bar -->
        <nav style="background-color: transparent">
            <div class="container">
                <div class="nav-wrapper">
                    <div class="brand-logo left"><img src="img/KharidLow Logo.png" height="50" width="120"></div>
                    <ul id="nav-mobile" class="right hide-on-med-and-down">
                        <li><a href="index.jsp"><i class="material-icons left">home</i>Home</a></li>
                        <li><a href="aboutus.jsp"><i class="material-icons left">assignment_ind</i>About</a></li>
                        <li><a href="mailto:19bce152@nirmauni.ac.in?Subject=Query regarding KharidLow"><i class="material-icons left">call_end</i>Contact Us</a></li>
                        <li><a href="signup.jsp" class="waves-effect waves-light btn orange darken-2">Sign In</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div>
            <fieldset>
                <legend>About Us</legend>
                खरीदLow is a C2C web application where Nirma University Students can sell or buy books/accessories from other students.  Our main motivation is to  lower the manual efforts of contacting different people and provides a reliable way to sell/buy things.       

            </fieldset>
        </div>

        <div class="team" style="margin-left: 45%; margin-top: 18px">
            <a class="waves-effect waves-light btn orange darken-2" href="mailto:19bce152@nirmauni.ac.in?Subject=Query regarding KharidLow"><i class="material-icons left">call_end</i>Contact Us</a>
        </div>
    </body>
</html>
