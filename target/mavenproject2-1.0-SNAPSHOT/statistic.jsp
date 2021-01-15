<%-- 
    Document   : index
    Created on : Dec 17, 2020, 12:34:03 AM
    Author     : ASUS
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="Model.*"%>
<%@page import="DAO.*"%>
<%@page import="Hibernate.HibernateUtil"%>
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
    <link href="css/app.css" rel="stylesheet" type="text/css"/>
    <link href="css/sidebar.css" rel="stylesheet" type="text/css"/>
    <link href="css/calendar.css" rel="stylesheet" type="text/css"/>
    <title>To do List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/sidebar.js" type="text/javascript"></script>
    <script src="js/todo.js" type="text/javascript"></script>

    <link rel="stylesheet" type="text/css" href="css/pieChart.css">
    <link rel="stylesheet" type="text/css" href="css/barChart.css">
    <link rel="stylesheet" type="text/css" href="css/dailyStatistic.css">
    <script src="js/percentChart.js"></script>
    <script src="js/pieChartTag.js"></script>
    <script src="js/color.js"></script>


</head>
<body onload="initCalendar()">
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
                     <li class="sidebar-dropdown">
                        <a href="index.jsp">
                          <i class="fa fa fa-tachometer"></i>
                          <span>Home</span>
                        </a>
                      </li>
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
            <a href="login.jsp">
                <i class="fa fa-power-off"></i>
            </a>
        </div>
    </nav>
    <!-- sidebar-wrapper  -->
    <main class="page-content">
        <div class="container-fluid">
            <h2>TIME LIVE</h2>
            <hr>
            <div class="row" id="body-row">
                <div class="col-md-8">
                    <!------------ Start Statistic Daily ------------>
                    <div class="statistic-daily-container">
                        <div class="filterDailyStatistic">
                            <form action="${pageContext.request.contextPath}/StatisticDaily" method="post">
                                <div class="input-form-container">
                                    <label for="date" class="input-date-label">Date</label>
                                    <input type="date" name="dateStatistic" class="input-date" value="<c:out value="${date}"/>">
                                    <input type="submit" value="View Statistic" class="btn-submit">
                                </div>
                            </form>
                        </div>
                        <div class="chart-daily-container">
                            <div id='percent-done-chart' class="percentages-done-chart"></div>
                            <script>
                                var percentDone = <c:out value="${percentDone}" escapeXml="false"/>;
                                percentages_done_chart(percentDone);
                            </script>

                            <div id="statistic-todo-by-tag" class="pie-chart-for-todo-by-tag"></div>
                            <script>
                                var data = <c:out value="${countTodos}" escapeXml="false"/>;
                                pieChart_for_statistic_todo_by_tag(data);
                            </script>
                        </div>
                    </div>
                    <!----------  End Statisic Daily ----------->

                    <!------------ Start Statistic Weekly ------------>
                    <div class="statistic-weekly-container">
                        <div class="filterWeeklyStatistic">
                            <form action="${pageContext.request.contextPath}/StatisticDaily" method="post">
                                <div class="input-form-container">
                                    <label for="week" class="input-week-label">Week</label>
                                    <input type="week" name="weekStatistic" class="input-week" value="<c:out value="${week}"/>">
                                    <input type="submit" value="View Statistic" class="btn-submit">
                                </div>
                            </form>
                        </div>
                        <div class="chart-weekly-container">
                            <div class="barChart-container">
                                <div id='bar-done-chart' class="bar-chart">
                                    <h4 class="title-statistic">Weekly Statistic</h4>
                                    <h4 class="date-statistic"> <c:out value="${beginWeek}"/> - <c:out value="${endWeek}"/> </h4>
                                    <svg viewBox="0 0 190 140" class="svg-percent-chart">
                                        <g>
                                            <line x1="25" y1="20" x2="180" y2="20" class="yaxis-line"></line>
                                            <line x1="25" y1="40" x2="180" y2="40" class="yaxis-line"></line>
                                            <line x1="25" y1="60" x2="180" y2="60" class="yaxis-line"></line>
                                            <line x1="25" y1="80" x2="180" y2="80" class="yaxis-line"></line>
                                            <line x1="25" y1="100" x2="180" y2="100" class="yaxis-line"></line>
                                            <line x1="25" y1="120" x2="180" y2="120" class="yaxis-line"></line>
                                        </g>
                                        <g>
                                            <text x="15" y="20" class="valueY">100%</text>
                                            <text x="15" y="40" class="valueY">80%</text>
                                            <text x="15" y="60" class="valueY">60%</text>
                                            <text x="15" y="80" class="valueY">40%</text>
                                            <text x="15" y="100" class="valueY">20%</text>
                                            <text x="15" y="120" class="valueY">0%</text>
                                        </g>
                                        <g>
                                            <!-- <line x1="20" y1="20" x2="20" y2="120" shape-rendering="crispEdges" style="stroke:#EF2F48;stroke-width:0.24;"></line> -->
                                            <line x1="40" y1="20" x2="40" y2="120" class="whole-bar"></line>
                                            <line x1="60" y1="20" x2="60" y2="120" class="whole-bar"></line>
                                            <line x1="80" y1="20" x2="80" y2="120" class="whole-bar"></line>
                                            <line x1="100" y1="20" x2="100" y2="120" class="whole-bar"></line>
                                            <line x1="120" y1="20" x2="120" y2="120" class="whole-bar"></line>
                                            <line x1="140" y1="20" x2="140" y2="120" class="whole-bar"></line>
                                            <line x1="160" y1="20" x2="160" y2="120" class="whole-bar"></line>
                                            <!-- <line x1="180" y1="20" x2="180" y2="120" shape-rendering="crispEdges" style="stroke:#000000;stroke-width:0.24;"></line> -->

                                            <line x1="40" y1="20" x2="40" y2="120" class="bar-done" stroke-dasharray="<c:out value="${mon}"/> 100"></line>
                                            <line x1="60" y1="20" x2="60" y2="120" class="bar-done" stroke-dasharray="<c:out value="${tue}"/> 100"></line>
                                            <line x1="80" y1="20" x2="80" y2="120" class="bar-done" stroke-dasharray="<c:out value="${wed}"/> 100"></line>
                                            <line x1="100" y1="20" x2="100" y2="120" class="bar-done" stroke-dasharray="<c:out value="${thu}"/> 100"></line>
                                            <line x1="120" y1="20" x2="120" y2="120" class="bar-done" stroke-dasharray="<c:out value="${fri}"/> 100"></line>
                                            <line x1="140" y1="20" x2="140" y2="120" class="bar-done" stroke-dasharray="<c:out value="${sat}"/> 100"></line>
                                            <line x1="160" y1="20" x2="160" y2="120" class="bar-done" stroke-dasharray="<c:out value="${sun}"/> 100"></line>
                                        </g>
                                        <g>
                                            <text x="60" y="132" class="valueX">Mon</text>
                                            <text x="80" y="132" class="valueX">Tue</text>
                                            <text x="100" y="132" class="valueX">Wed</text>
                                            <text x="120" y="132" class="valueX">Thu</text>
                                            <text x="140" y="132" class="valueX">Fri</text>
                                            <text x="160" y="132" class="valueX">Sat</text>
                                            <text x="40" y="132" class="valueX">Sun</text>
                                        </g>
                                    </svg>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!----------  End Statisic Weekly ----------->
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
<!-- page-wrapper -->

<script src="js/statisticForm.js"></script>
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
        $('.check').click(function(){
            var list = document.getElementsByClassName('task-group mb-1');
            console.log(list.length)
            for(i=0;i<list.length;i++){
                var a = list[i].getElementsByClassName('check');
                if(a[0].checked === true){
                    list[i].style.opacity="0.5";
                }
                if(a[0].checked === false){
                    list[i].style.opacity="1";
                }
            }
        });


    });
</script>
