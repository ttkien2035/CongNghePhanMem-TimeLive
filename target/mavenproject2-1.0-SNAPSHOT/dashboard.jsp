<%-- 
    Document   : index
    Created on : Dec 17, 2020, 12:34:03 AM
    Author     : ASUS
--%>

<%@page import="Model.Users"%>
<%@page import="Hibernate.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Users user = (Users)session.getAttribute("user");
    if(user == null ){ %>
    <jsp:forward page="login.jsp"/>
    <% }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="style.css"> 
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/app.css" rel="stylesheet" type="text/css"/>
        <link href="css/sidebar.css" rel="stylesheet" type="text/css"/>
        <title>To do List</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./fullcalendar/main.min.css">
        <script src="./fullcalendar/main.min.js" defer></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/sidebar.js" type="text/javascript"></script>
    </head>
    <body>
<div class="page-wrapper chiller-theme toggled">
  <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
    <i class="fas fa-bars"></i>
  </a>
  <nav id="sidebar" class="sidebar-wrapper">
    <div class="sidebar-content">
      <div class="sidebar-brand">
        <a href="dashboard.jsp">Home</a>
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
            <strong><%=user.getFullname()                %>       </strong>
          </span>
          <span class="user-role"><%=user.getEmail()               %></span>
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
              <a href="statistic">
                <i class="fa fa-chart-line"></i>
                <span>Statistic</span>
              </a>

            </li>
            <li class="header-menu">
              <span>Extra</span>
            </li>
            <li>
              <a href="#">
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
  <!-- sidebar-wrapper  -->
  <main class="page-content">
    <div class="container-fluid">
        <h2>TIME LIVE</h2>
        <hr>
        <div class="row" id="body-row">
            <div class="col-md-8">
                <!------------ Start Todo List view ------------>
                <div class="mb-3 container">
                    <div class="card todo-block container">
                        <div class="card-header">
                            <h4 class="card-title">Todo for Today</h4>
                        </div>
                        <div class="card-body">
                            <!-- the events -->
                            <div id="external-events">
                                <form class="task-group mb-1" style="background-color:#aaaaaa;">
                                    <div class="checkbox middle">
                                        <label >
                                            <input type="checkbox" class="check">
                                        </label>
                                    </div>
                                    <div class="external-event middle">Lunch</div>
                                    <div><span class="badge badge-secondary middle">New</span></div>
                                    <button class="btn btn-hidden-bgr middle"><i class="fa fa-pencil-square-o" ></i></button>
                                    <button class="btn btn-hidden-bgr middle"><i class="fa fa-trash" ></i></i></button>

                                </form>
                                <form class="task-group mb-1">
                                    <div class="checkbox middle">
                                        <label >
                                            <input type="checkbox" class="check">
                                        </label>
                                    </div>
                                    <div class="external-event middle">Lunch</div>
                                    <div><span class="badge badge-secondary middle">New</span></div>
                                    <button class="btn btn-hidden-bgr middle"><i class="fa fa-pencil-square-o" ></i></button>
                                    <button class="btn btn-hidden-bgr middle"><i class="fa fa-trash" ></i></i></button>

                                </form>
                                <form class="task-group mb-1">
                                    <div class="checkbox middle">
                                        <label >
                                            <input type="checkbox" class="check">
                                        </label>
                                    </div>
                                    <div class="external-event middle">Lunch</div>
                                    <div><span class="badge badge-secondary middle">New</span></div>
                                    <button class="btn btn-hidden-bgr middle"><i class="fa fa-pencil-square-o" ></i></button>
                                    <button class="btn btn-hidden-bgr middle"><i class="fa fa-trash" ></i></i></button>

                                </form>
                                <form class="task-group mb-1">
                                    <div class="checkbox middle">
                                        <label >
                                            <input type="checkbox" class="check">
                                        </label>
                                    </div>
                                    <div class="external-event middle">Lunch</div>
                                    <div><span class="badge badge-secondary middle">New</span></div>
                                    <button class="btn btn-hidden-bgr middle"><i class="fa fa-pencil-square-o" ></i></button>
                                    <button class="btn btn-hidden-bgr middle"><i class="fa fa-trash" ></i></i></button>

                                </form>
                                <form class="task-group mb-1">
                                    <div class="checkbox middle">
                                        <label >
                                            <input type="checkbox" class="check">
                                        </label>
                                    </div>
                                    <div class="external-event middle">Lunch</div>
                                    <div><span class="badge badge-secondary middle">New</span></div>
                                    <button class="btn btn-hidden-bgr middle"><i class="fa fa-pencil-square-o" ></i></button>
                                    <button class="btn btn-hidden-bgr middle"><i class="fa fa-trash" ></i></i></button>

                                </form>
                            </div>
                            <div class="add-todo-task">
                                <button type="button" class="btn btn-add-todo-task" data-toggle="modal" data-target="#addtodotask">
                                    Add New  <i class="fa fa-plus" aria-hidden="true"></i>
                                </button>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                </div>
                <!----------  End Todo List View ----------->
                <!---------- DeadLine Upcoming ------------->
                <div class="mb-3 container">
                    <div class="card todo-block container">
                        <div class="card-header">
                            <h4 class="card-title">Deadline Upcoming</h4>
                        </div>
                        <div class="card-body">
                            <!-- the events -->
                            <div id="external-deadline-upcoming-events" class="deadline-upcoming-list-view">
                                <div class="deadline-group">
                                    <div class="external-deadline-upcoming-event">Lunch</div>
                                    <button class="btn btn-hidden-bgr middle"><i class="fa fa-pencil" aria-hidden="true"></i></button>
                                    <button class="btn btn-hidden-bgr middle"><i class="fa fa-trash" ></i></i></button>
                                </div>
                                
                            </div>
                            <div class="add-todo-task">
                                <button type="button" class="btn btn-add-todo-task" data-toggle="modal" data-target="#addtodotask">
                                    Add New  <i class="fa fa-plus" aria-hidden="true"></i>
                                </button>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                </div>
                
                
                <!----------- End Deadline Upcoming----------------------------->
            </div>
            <div class="col-md-4">
                sgdjfgjsdgfjsghfgjsgfsjhd
            </div>
        </div>
        
        <!-- Modal add Todo Task -->
        <div class="modal" id="addtodotask">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Add Todo</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <!------ Start card add task ----->
                        <div class= "card todo-block container mt-3">
                            <form>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Task</span>
                                    </div>
                                    <input type="text" id="task-des-add" class="form-control">
                                </div>
                            </form>
                            <form>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Category</span>
                                    </div>
                                    <input type="text" id="task-cate-add" class="form-control" list="categoryList">
                                    <datalist id="categoryList">
                                        <!-- <option value="Personal"></option>
                                        <option value="Work"></option> -->
                                    </datalist>
                                </div>
                            </form>
                            <form>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Date</span>
                                    </div>
                                    <input type="date" id="todo-date-add" class="form-control">
                                </div>
                            </form>
                            <button type="button" id="btn-add-todo-task" class="btn btn-outline-info btn-lg btn-block">Add</button>
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
        <!---------- End modal add Todo task ---------->
        
    </div>
  </main>
  <!-- page-content" -->
</div>
<!-- page-wrapper -->
    
    
</body>
</html>
<script>

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