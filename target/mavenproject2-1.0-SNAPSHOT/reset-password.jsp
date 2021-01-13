<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Email to Reset Password</title>
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="css/login.css" rel="stylesheet" type="text/css"/>
    <script src="https://kit.fontawesome.com/8a5c84a665.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    
    
                        
     <div class="container">
            <div class="forms-container">
                <div class="signin-signup">
                    <form action="ResetPassword" method="post" class="sign-in-form">
                        <!---->
                        <h2 class="title">Reset Password</h2>
                        <!---->
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="text" name="email" placeholder="Email" />
                        </div>
                        <span style="color: red"><c:out value="${emailError}"/></span>
                        <!---->
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="password" placeholder="New Password" />
                        </div>
                        
                        
                        <!---->
                        <input type="submit" value="Reset" class="btn solid" />
                       
                    </form>
                </div>
            </div>
     </div>
                        
         
    
</body>
</html>