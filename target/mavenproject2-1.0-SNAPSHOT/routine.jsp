<%-- 
    Document   : index
    Created on : Dec 17, 2020, 12:34:03 AM
    Author     : ASUS
--%>

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
        <title>Routine</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/sidebar.js" type="text/javascript"></script>
        <script src="js/routine.js" type="text/javascript"></script>
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
                <!------------ Start Daily View ------------>
                <div class="mb-3 container">
                    <div class="card todo-block container">
                        <h4 class="card-title">Daily Routine</h4>
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="container-fluid routine-list">
                                    <%
                                        List<Routines> listofRoutineses = RoutineDAO.getAllRoutineses(user.getUserid());
                                        String rridString= (String)request.getAttribute("rid-resp");
                                        System.out.println(rridString + "    rrid");
                                        int rid=0;
                                        if(listofRoutineses!=null && listofRoutineses.size()> 0){
                                            rid = listofRoutineses.get(0).getRid();
                                        }
                                        if(rridString!=null){
                                            rid=Integer.parseInt(rridString);
                                        }
                                        if(listofRoutineses!=null){
                                        for(int i=0;i<listofRoutineses.size();i++) {
                                    %>
                                    <div class="group-routine" >
                                        <input type="hidden" value="<%= listofRoutineses.get(i).getRid() %>">
                                        <span onclick="location.assign('SearchRoutine?rid=<%= listofRoutineses.get(i).getRid() %>');"><%= listofRoutineses.get(i).getRname() %></span>
                                        <button class="btn btn-hidden-bgr middle" onclick="fillformEditRt('<%= listofRoutineses.get(i).getRid()%>','<%= listofRoutineses.get(i).getRname()%>');" id="routine-edit"  data-toggle="modal" data-target="#editroutine"><i class="fa fa-pencil" aria-hidden="true"></i></button>
                                        <a onclick="deletert(<%= listofRoutineses.get(i).getRid() %>);" class="btn btn-hidden-bgr middle" id="routine-delete"><i class="fa fa-trash" ></i></a>
                                    </div>
                                    <% } } %>
                                </div>  
                                <div class="add-todo-task">
                                    <button type="button" class="btn btn-add-routine" id="btn-add-routine" data-toggle="modal" data-target="#addroutine">
                                        Add New  <i class="fa fa-plus" aria-hidden="true"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <div class="container-fluid routine-detail-list">
                                    <%
                                        if(listofRoutineses !=null){
                                        List<Activity> listofActivitys = null;
                                        
                                        listofActivitys = (ArrayList<Activity>)request.getAttribute("listofActivitys");
                                        if(listofActivitys==null){
                                            listofActivitys = RoutineDAO.getActivitys(rid);
                                        }
                                        for(int j=0;j<listofActivitys.size();j++) {
                                    %>
                                    <input type="hidden" value="<%= rid %>" name="rid" id="rid">
                                    <div class="group-routine-detail">
                                        <div>
                                            <%
                                            SimpleDateFormat formatter = new SimpleDateFormat("hh:mm");
                                            String timestart = formatter.format(listofActivitys.get(j).getTimestart());
                                            String timesend = formatter.format(listofActivitys.get(j).getTimeend());
                                            %>
                                            <span><%= timestart %> - <%= timesend %></span>
                                            <h5><%= listofActivitys.get(j).getActivity() %></h5>
                                        </div>
                                            <button class="btn btn-hidden-bgr middle" id="routine-edit" onclick="fillformEditActivity('<%= rid %>','<%= listofActivitys.get(j).getActivity() %>','<%= timestart %>','<%= timesend %>','<%= listofActivitys.get(j).getAcid()  %>')"  data-toggle="modal" data-target="#editact"><i class="fa fa-pencil" aria-hidden="true"></i></button>
                                            <a onclick="deleteactivity('<%= listofActivitys.get(j).getAcid() %>');" class="btn btn-hidden-bgr middle" id="routine-delete"><i class="fa fa-trash" ></i></a>
                                    </div>
                                    <hr>
                                    <% } } %>
                                </div>
                                <div class="add-todo-task">
                                    <button type="button" class="btn btn-add-routine" id="btn-add-act" data-toggle="modal" data-target="#addact">
                                        Add New  <i class="fa fa-plus" aria-hidden="true"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!----------  End Daily View ----------->

                <!---------- Start Weekly View ---------->
                <div class="mb-3 container">
                    <div class="card todo-block container">
                        <h4 class="card-title">Daily Routine</h4>
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
                            
                        </div>
                        <!-- /.card-body -->
                    </div>

                </div>
                <!------------- End Weekly View ---------------->
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
                                
                                
                                
        <div class="modal" id="addroutine">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Add Routine</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <!------ Start card add task ----->
                        <div class= "card todo-block container mt-3">
                            <form action="AddRoutine" method="get">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Routine</span>
                                    </div>
                                    <input type="text" name="routine-des" class="form-control">
                                </div>
                                <input type="submit" id="btn-add-todo-task" class="btn btn-outline-info btn-lg btn-block" value="Add">
                            </form>
                        </div>
                        <!---   End card add task   -->
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>              
        
        <div class="modal" id="editroutine">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Edit routine</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <!------ Start card add task ----->
                        <div class= "card todo-block container mt-3">
                            <form action="EditRoutine" method="get">  
                                <input type="hidden" name="rt-id" id="routine-edit-id">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Routine</span>
                                    </div>
                                    <input type="text" id='routine-edit-frm' name="routine-edit" class="form-control">                                  
                                </div>                               
                                <input type="submit" id="btn-add-activity-task" class="btn btn-outline-info btn-lg btn-block" value="OK">
                            </form>
                        </div>
                        <!---   End card add task   -->
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>   
        <!-- Modal add activity -->
        <div class="modal" id="addact">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Add Activity</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <!------ Start card add task ----->
                        <div class= "card todo-block container mt-3">
                            <form action="AddActivity" method="get">
                                <input type="hidden" name="rid" value="<%= rid %>">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Activity</span>
                                    </div>
                                    <input type="text" id="activity-atv" name="activity-atv" class="form-control">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Category</span>
                                    </div>
                                    <select class="form-control" id="activity-add-routine" name="activity-add-routine">
                                        <%
                                         for(int i=0;i<listofRoutineses.size();i++)
                                         {
                                        %>
                                        <option value="<%= listofRoutineses.get(i).getRid()%>" <%if (listofRoutineses.get(i).getRid() == rid){%> checked <%}%> ><%= listofRoutineses.get(i).getRname() %></option>
                                        <% } %>
                                    </select>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Time Begin</span>
                                    </div>
                                    <input type="time" id="activity_timebegin" name="activity_timebegin" class="form-control">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Time End</span>
                                    </div>
                                     <input type="time" id="activity_timeend" name="activity_timeend" class="form-control"> 
                                </div>
                                <input type="submit" id="btn-add-activity-task" class="btn btn-outline-info btn-lg btn-block" value="Add">
                            </form>
                        </div>
                        <!---   End card add task   -->
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>
        <!---------- End modal add Activity task ---------->
        
        
        
        
        <!---------------------------------KHOAPHAN1----------------------------------------------->
        <div class="modal" id="editact">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Edit Activity</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <!------ Start card add task ----->
                        <div class= "card todo-block container mt-3">
                            <form action="EditActivity" method="get">
                                <input type="hidden" id="activity-edit-idatv" name="activity_id">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Activity</span>
                                    </div>
                                    <input type="text" id="activity-atv-edit" name="activity-edit" class="form-control">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Category</span>
                                    </div>
                                    <select class="form-control" id="activity-edit-routine" name="activity-edit-routine">
                                        <%
                                         for(int i=0;i<listofRoutineses.size();i++)
                                         {
                                        %>
                                        <option value="<%= listofRoutineses.get(i).getRid()%>" <%if (listofRoutineses.get(i).getRid()==rid){%> checked <%}%>><%= listofRoutineses.get(i).getRname() %></option>
                                        <% } %>
                                    </select>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Time Begin</span>
                                    </div>
                                    <input type="time" id="activity_timebegin_edit" name="time_begin" class="form-control">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Time End</span>
                                    </div>
                                     <input type="time" id="activity_timeend-edit" name="activity_timeend" class="form-control"> 
                                </div>
                                <input type="submit" id="btn-add-activity-task" class="btn btn-outline-info btn-lg btn-block" value="OK">
                            </form>
                        </div>
                        <!---   End card add task   -->
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div> 
        <!---------------------------------KHOAPHAN1----------------------------------------------->                       
    </div>
  </main>
  <!-- page-content" -->
</div>
<!-- page-wrapper -->
    
    
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