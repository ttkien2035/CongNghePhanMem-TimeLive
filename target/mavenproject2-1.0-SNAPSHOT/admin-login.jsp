<%-- 
    Document   : admin-login
    Created on : Jan 11, 2021, 8:11:16 PM
    Author     : tkluffy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="https://kit.fontawesome.com/64d58efce2.js"    crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Admin page</title>
    </head>
    <body>
        <div class="container">
            <div class="forms-container">
                <div class="signin-signup">
                    <form action="LoginAdmin" method="post" class="sign-in-form">
                        <!---->
                        <h2 class="title">Sign in</h2>
                        <!---->
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="text" name="email_login" placeholder="Username" />
                        </div>
                        <% 
                        String err_login = (String)request.getAttribute("error_login"); 
                        System.out.println(err_login);
                        if (err_login == null ) err_login="" ;
                        %>
                        <span style="color: red"><%= err_login %></span>
                        <!---->
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="password_login" placeholder="Password" />
                        </div>
                        
                        
                        <!---->
                        <input type="submit" value="Login" class="btn solid" />
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
