<%-- 
    Document   : admin
    Created on : Jan 6, 2021, 12:55:56 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="../css/app.css" rel="stylesheet" type="text/css"/>
        <link href="../css/sidebar.css" rel="stylesheet" type="text/css"/>
        <link href="../css/calendar.css" rel="stylesheet" type="text/css"/>
        <title>Admin</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../js/sidebar.js" type="text/javascript"></script>
    </head>
    <body>
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
          <span class="user-name">Jhon
            <strong>Smith</strong>
          </span>
          <span class="user-role">Administrator</span>
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
              <a href="manage-user.jsp">
                <i class="fa fa fa-tachometer"></i>
                <span>Manage user</span>
                <span class="badge badge-pill badge-warning">New</span>
              </a>
            </li>
            <li class="sidebar-dropdown">
              <a href="admin-statistic.jsp">
                <i class="fa fa-chart-line"></i>
                <span>Statistic</span>
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
  <!-- sidebar-wrapper  -->
    <main class="page-content">
        <div class="container" id="main">
            <h2 class="admin-page-h2">Admin</h2> 
            <hr>
            <div class="row">
                <div class="col-md-8 ">       
                    <div class="group-card">
                        <div class="card-info">
                            <img src="https://i.pinimg.com/originals/51/f6/fb/51f6fb256629fc755b8870c801092942.png">
                            <h3>30</h3>
                            <h4>User</h4>
                            <button class="btn-add-todo-category">View</button>
                        </div>
                        <div class="card-info">
                            <img src="https://i.pinimg.com/originals/51/f6/fb/51f6fb256629fc755b8870c801092942.png">
                            <h3>300</h3>
                            <h4>Todo</h4>
                            <button class="btn-add-todo-category">View</button>
                        </div><!-- comment -->
                        <div class="card-info">
                            <img src="https://i.pinimg.com/originals/51/f6/fb/51f6fb256629fc755b8870c801092942.png">
                            <h3>3000</h3>
                            <h4>Tag</h4>
                            <button class="btn-add-todo-category">View</button>
                        </div><!-- comment -->
                        <div class="card-info">
                            <img src="https://i.pinimg.com/originals/51/f6/fb/51f6fb256629fc755b8870c801092942.png">
                            <h3>123</h3>
                            <h4>Routine</h4>
                            <button class="btn-add-todo-category">View</button>
                        </div>
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
  <!-- page-content" -->
    </div>
    </body>
</html>
<script>
    function updateCalendar() {
            var now = new Date();
            var day = now.getDay(),
                mon = now.getMonth(),
                date = now.getDate(),
                year = now.getFullYear(),
                hour = now.getHours(),
                min = now.getMinutes();
            
            Number.prototype.pad = function(digits) {
                for (var n= this.toString(); n.length < digits; n = 0 + n);
                return n;
            }
            
            var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
            
            var ids = ["hour", "min", "date", "month", "year"];
            var values = [hour.pad(2), min.pad(2), date.pad(2) , months[mon], year];
            for (var i = 0; i< ids.length; i++) {
                document.getElementById(ids[i]).firstChild.nodeValue = values[i];
            }

            var weekids = ["sun", "mon", "tue", "wed", "thu", "fri", "sat"];
            var begin = date - day;
            var dateInWeek = new Date();
            
            for (var i = 0; i < 7; i++) {
                dateInWeek.setDate(begin + i );
                document.getElementById(weekids[i]).firstChild.nodeValue = dateInWeek.getDate().pad(2);
            }

            document.getElementById(weekids[day]).parentElement.classList.add("today");

        }

    function initCalendar() {
        updateCalendar();
        window.setInterval("updateCalendar()", 1000);
    }
    $(function(){
       initCalendar(); 
       
    });
</script>
