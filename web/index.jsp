<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Login Page</title>
        
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
                        <li><a href="aboutus.jsp"><i class="material-icons left">assignment_ind</i>About</a></li>
                        <li><a href="mailto:19bce152@nirmauni.ac.in?Subject=Query regarding KharidLow"><i class="material-icons left">call_end</i>Contact Us</a></li>
                        <li><a href="signup.jsp" class="waves-effect waves-light btn orange darken-2">Sign In</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <div class="row">

                <p style="margin-top: 80px; font-weight: bold; font-size: 30px; color: whitesmoke; text-align: center; padding: 0px; margin-bottom: 5px">Login To Your Account</p>

                <p style="color: grey; font-family: sans-serif Trebuchet MS; text-align: center; padding: 0px; margin: 0px">खरीदLow is a C2C web application where Nirma University Students can sell or buy books/accessories from other students.</p>

                <div class="col s4 offset-m4" style="background: transparent; border: none; margin-top: 18px">

                    <div class="login-card" style="background-color: transparent;">
                        <form action="loginservlet" method="post" id="myform" style="padding: 20px">
                            <div class="email">
                                <input name="email" id="email" type="email" placeholder="Email" style="color: whitesmoke" class="validate" required>
                            </div>

                            <div class="password">
                                <input name="password" id="password" type="password" placeholder="Password" style="color: whitesmoke" class="validate" required>
                            </div>
                            <div class="login-btn" style="display: flex; justify-content: center; align-items: center">
                                <button type="submit" class="btn waves-effect waves-light orange darken-2">LOGIN</button>
                            </div>
                        </form>
                        <div class="submit" style="text-align: center; padding: 5px">
                            <a href="signup.jsp" style="text-align: center">Do not have an account? Create new account</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
</body>
</html>
