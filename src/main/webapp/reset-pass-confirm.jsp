

<%@page import="Mail.RandomString"%>
<%@page import="Model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
  
	String email = (String)request.getSession().getAttribute("email");
	String password = (String)request.getSession().getAttribute("password");
        String code = (String)request.getSession().getAttribute("code");
   
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Nhập mã xác của bạn</title>        
    </head>
    <body>
        <div class="container">
            <div class="forms-container">
                <div class="signin-signup">
                    <form action="ResetPassConfirm" class="sign-in-form" id="form" method="post">
                        <h2 class="title">Mã xác nhận đã được gửi đến <%=email       %></h2>
                        <h2 class="title">Nhập mã xác nhận để xác minh danh tính</h2>
                        <input type="text" name="maxacnhan" placeholder="Mã xác nhận">
                        <input type="hidden" name="code" value="<%=code%>">
                        <input type="submit" class="btn" value="Xác nhận" />                       
                    </form>
                </div>
                
            </div>
            <div class="panels-container">
                <div class="panel right-panel">
                </div>
            </div>
        </div>
    
    </body>
</html>
