<%-- 
    Document   : account
    Created on : Jan 11, 2021, 10:42:37 PM
    Author     : tkluffy
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="Model.*"%>
<%@page import="DAO.*"%>
<%@page import="Hibernate.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/app.css" rel="stylesheet" type="text/css"/>
<!--        <link href="css/sidebar.css" rel="stylesheet" type="text/css"/>-->
        <link href="css/calendar.css" rel="stylesheet" type="text/css"/>
        <title>Account</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/sidebar.js" type="text/javascript"></script>
        <script src="js/todo.js" type="text/javascript"></script>
        <script src="https://kit.fontawesome.com/8a5c84a665.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/account.css">
    
    <script src="https://kit.fontawesome.com/8a5c84a665.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body>
        <%
            Users user = (Users)session.getAttribute("user");
            if(user == null ){ %>
            <jsp:forward page="login.jsp"/>
            <% }
            String a = user.getEmail();
        %>
        <div class="page-wrapper chiller-theme toggled">
            <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
              <i class="fas fa-bars"></i>
            </a>
            <nav id="sidebar" class="sidebar-wrapper">
              <div class="sidebar-content">
                <div class="sidebar-brand">
                  <a href="#">pro sidebar</a>
                  <div id="close-sidebar">
                    <i class="fas fa-times"></i>
                  </div>
                </div>
                <div class="sidebar-header">
                  <div class="user-pic">
                    <img class="img-responsive img-rounded" src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg"
                      alt="User picture">
                  </div>
                  <div class="user-info">
                    <span class="user-name">
                      <strong><%=user.getFullname()          %></strong>
                    </span>
                    <span class="user-role"><%=user.getEmail()            %></span>
                    <span class="user-status">
                      <i class="fa fa-circle"></i>
                      <span>Online</span>
                    </span>
                  </div>
                </div>
                <div class="sidebar-menu">
                  <ul>
                      <li class="header-menu">
                        <span>General</span>
                      </li>
                      <li class="sidebar-dropdown">
                        <a href="dashboard.jsp">
                          <i class="fa fa fa-tachometer"></i>
                          <span>Dashboard</span>
                          <span class="badge badge-pill badge-warning">New</span>
                        </a>
                      </li>
                      <li class="sidebar-dropdown">
                        <a href="todo.jsp">
                          <i class="fa fa-pencil-square-o"></i>
                          <span>Todo</span>
                          <span class="badge badge-pill badge-danger">3</span>
                        </a>
                      </li>
                      <li class="sidebar-dropdown">
                        <a href="task.jsp">
                          <i class="fa fa-tasks"></i>
                          <span>Task</span>
                        </a>
                      </li>
                      <li class="sidebar-dropdown">
                        <a href="routine.jsp">
                          <i class="fa fa-repeat"></i>
                          <span>Routine</span>
                        </a>
                      </li>
                      <li class="sidebar-dropdown">
                        <a href="statistic.jsp">
                          <i class="fa fa-chart-line"></i>
                          <span>Statistic</span>
                        </a>

                      </li>
                      <li class="header-menu">
                        <span>Extra</span>
                      </li>
                      <li>
                        <a href="account.jsp">
                          <i class="fa fa-book"></i>
                          <span>Account</span>
                          <span class="badge badge-pill badge-primary">Beta</span>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="fa fa-calendar"></i>
                          <span>Calendar</span>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="fa fa-folder"></i>
                          <span>Setting</span>
                        </a>
                      </li>
                  </ul>
                </div>
                <!-- sidebar-menu  -->
              </div>
          <!-- sidebar-content  -->
          <div class="sidebar-footer">
              <a>
                  <i class="fa fa-cog"></i>
                  <span class="badge-sonar"></span>
              </a>
              <a href="#">
                  <i class="fa fa-power-off"></i>
              </a>
          </div>
        </nav>
                    
        <main class="page-content">
            <div class="container-fluid">
                <h2>TIME LIVE</h2>   
                <hr>
                <div class="row" id="body-row">
                <div class="col-md-8">
                    
                        <div class="title">
                            <h3>Profile</h3>
                            
                        </div>
                   <div class="profile-form-container">
                        <form action="${pageContext.request.contextPath}/UpdateUser" method="post">
                                <div class="form-component">
                                    <label>Email</label>
                                    <input type="text" name="email" value="<c:out value='${sessionScope.user.email}'/>" required disabled>

                                    <p style="color: red;"><i><strong><c:out value="${email}"/></strong><c:out value="${emailError}"/></i></p>
                                </div>
                                <div class="form-component">
                                    <label>Password</label>
                                    <input type="password" name="password" value="<c:out value='${sessionScope.user.pass}'/>" required disabled >
                                    <p></p>
                                </div>
                                <div class="form-component">
                                    <label>Fullname</label>
                                    <input type="text" name="fullname" value="<c:out value='${sessionScope.user.fullname}'/>" required>
                                    <p></p>
                                </div>

                                <div class="form-component">
                                    <label>Gender</label>
                                    <div class="radio-btn">
                                        <input type="radio" id="male" name="gender" value="male" <c:if test="${sessionScope.user.gender == false}">checked</c:if> >
                                        <label for="male">Male</label>

                                        <input type="radio" id="female" name="gender" value="female" <c:if test="${sessionScope.user.gender == true}">checked</c:if> >
                                        <label for="female">Female</label>
                                    </div>
                                </div>

                                <div class="form-component">
                                    <label>Birthdate</label>

                                    <input type="date" name="birthdate" value="<c:out value='${sessionScope.user.birthdate}'/>" >
                                    <p></p>
                                </div>

                                <div class="form-component">
                                    <input  type="submit" value="Update">
                                </div>

                        </form>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="week-calendar sticky-top">
                        <div class="week-container">
                            <div class="day">
                                <span id="sun">22</span>
                                <span>SUN</span>
                            </div>
                            <div class="day">
                                <span id="mon">20</span>
                                <span>MON</span>
                            </div>
                            <div class="day">
                                <span id="tue">21</span>
                                <span>TUE</span>
                            </div>
                            <div class="day">
                                <span id="wed">22</span>
                                <span>WED</span>
                            </div>
                            <div class="day">
                                <span id="thu">22</span>
                                <span>THU</span>
                            </div>
                            <div class="day">
                                <span id="fri">22</span>
                                <span>FRI</span>
                            </div>
                            <div class="day">
                                <span id="sat">22</span>
                                <span>SAT</span>
                            </div>
                        </div>

                        <div class="datetime-container">
                            <div class="time">
                                <span id="hour">08</span>:
                                <span id="min">00</span>
                            </div>
                            <div class="date">
                                <span id="date">23</span>
                                <span id="month">October</span>
                                <span id="year">2020</span>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
        
                
        </div>
            
        </main>
        </div>
                            
            
        <!-- Main -->
    
   </div>
      <script type="module" src="https://unpkg.com/ionicons@5.2.3/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule="" src="https://unpkg.com/ionicons@5.2.3/dist/ionicons/ionicons.js"></script> 
     <script language="javascript">
      // Hàm show kết quả
      function show_message()
      {
        alert("Bạn đã update thành công");
      }
    </script>
    </body>
</html>
