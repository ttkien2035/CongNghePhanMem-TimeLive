<%-- 
    Document   : task
    Created on : Dec 17, 2020, 1:09:38 AM
    Author     : ASUS
--%>
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
        <title>My Task</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/sidebar.js" type="text/javascript"></script>
        <script src="js/task.js" type="text/javascript"></script>
    </head>
    <body>
    <%
    Users user = (Users)session.getAttribute("user");
    if(user == null ){ %>
    <jsp:forward page="login.jsp"/>
    <% }
    String a = user.getEmail();
    List<Tag> listofTags = TodoDAO.getAllTags(user.getUserid());
    %>
    <script>
//        alert('<%=a%>');
    </script>
    <div class="page-wrapper chiller-theme toggled">
      <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
        <i class="fas fa-bars"></i>
      </a>
      <nav id="sidebar" class="sidebar-wrapper">
        <div class="sidebar-content">
          <div class="sidebar-brand">
            <a href="#">Menu</a>
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
        <a href="login.jsp">
            <i class="fa fa-power-off"></i>
        </a>
    </div>
  </nav>
        <main class="page-content">
        <div class="container-fluid">
            <h2>TIME LIVE</h2>
                    <%

                    List <Task> mytask = TaskDAO.getAllTasks(user.getUserid());
                    %>
                    <div  class="col-md-8">
                        <div class="mb-6 container">
                            <div class="card-header">
                                <h4 class="card-title">My Current Task <button class="btn" id="mytask-refresh" ><i class="fa fa-repeat"></i></button></h4>
                            </div>
                            <div class="add-todo-task">
                                <button type="button" class="btn btn-add-todo-task" id="btn-add-my-task" data-toggle="modal" data-target="#addmytask">
                                    Add New  <i class="fa fa-plus" aria-hidden="true"></i>
                                </button>
                            </div>
                            <div class="card todo-block container" id="mytask">   
                                <table id="mytask-table">
                                    <tr>
                                        <th>Id</th>
                                        <th>Name</th>
                                        <th style="display:none">Tag</th>
                                        <th>Deadline</th>
                                        <th>Edit</th>
                                        <th>Completed</th>
                                        <th>Remove</th>
                                    </tr>
                                    <%
                                    for(int i=0;i<mytask.size();i++){
                                        Task x = mytask.get(i);
                                        String color = x.getTag().getColor();
                                    %>
                                    <tr style="background-color: <%=color%>">
                                        <td><%=x.getTaskid()   %></td>
                                        <td><%=x.getTaskname()   %></td>
                                        <td style="display:none"><%=x.getTag().getTagid()%></td>
                                        <td><%=TaskDAO.returnDate(x.getDeadline())  %></td>
                                        <td><button id="task_edit"><i class="fas fa-edit"></i></button></td>
                                        <td><button  id="task_done"><i class="fas fa-check"></i></button></td>
                                        <td><button  id="task_del"><i class="fas fa-trash"></i></button></td>
                                    </tr>   
                                    <%   
                                        }
                                    %>
                                </table>
                            </div>
                        </div>
                    </div>
                                
                                
                                
                                
                                
                                
                                
                    <%

                    List <Task> mydonetask = TaskDAO.getAllDoneTasks(user.getUserid());
                    %>
                    <div  class="col-md-8">
                        <div class="mb-6 container">
                            <div class="card-header">
                                <h4 class="card-title">My Finished Task <button class="btn" id="mytaskdone-refresh" ><i class="fa fa-repeat"></i></button></h4>
                            </div>
                            <div class="card todo-block container" id="mytaskdone">   
                                <table id="mytaskdone-table">
                                    <tr>
                                        <th>Id</th>
                                        <th>Name</th>
                                        <th>Deadline</th>
                                        <th>Done at</th>
                                        <th>Remove</th>
                                    </tr>
                                    <%
                                    for(int i=0;i<mydonetask.size();i++){
                                        Task x = mydonetask.get(i);
                                        String color = x.getTag().getColor();
                                    %>
                                    <tr style="background-color: <%=color%>">
                                        <td><%=x.getTaskid()   %></td>
                                        <td><%=x.getTaskname()   %></td>
                                        <td><%=TaskDAO.returnDate(x.getDeadline())  %></td>
                                        <td><%=TaskDAO.returnDate(x.getDoneat())  %></td>
                                        <td><button  id="taskdone_del"><i class="fas fa-trash"></i></button></td>
                                    </tr>   
                                    <%   
                                        }
                                    %>
                                </table>
                            </div>
                        </div>
                    </div>        
               </div>
            </div>
        </main>
                                
                                
        <div class="modal" id="addmytask">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Add My Task</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <!------ Start card add task ----->
                        <div class= "card todo-block container mt-3">
                            <form action="InsertTask" method="get">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Task Name</span>
                                    </div>
                                    <input type="text" id="todo-des-add" name="task-name" class="form-control" value="Unnamed Task">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Category</span>
                                    </div>
                                    <select class="form-control" id="task-tag" name="task-tag">
                                        <%
                                         for(int i=0;i<listofTags.size();i++)
                                         {
                                        %>
                                        <option value="<%= listofTags.get(i).getTagid() %>"><%= listofTags.get(i).getTag() %></option>
                                        <% } %>
                                    </select>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Deadline</span>
                                    </div>
                                    <input type="date" id="task-date-add" name="task-deadline" class="form-control">
                                </div>
                                <input type="submit" id="btn-add-task" class="btn btn-outline-info btn-lg btn-block" value="Add">
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
                                    
                                    
         <div class="modal" id="editmytask">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Add My Task</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <!------ Start card add task ----->
                        <div class= "card todo-block container mt-3">
                            <form action="EditTask" method="get">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Task Name</span>
                                    </div>
                                    <input type="text" name="task-name" class="form-control" id="task-edit-name">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Category</span>
                                    </div>
                                    <select class="form-control" id="task-edit-tag" name="task-tag">
                                        <%
                                         for(int i=0;i<listofTags.size();i++)
                                         {
                                        %>
                                        <option value="<%= listofTags.get(i).getTagid() %>"><%= listofTags.get(i).getTag() %></option>
                                        <% } %>
                                    </select>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Deadline</span>
                                    </div>
                                    <input type="date"  name="task-deadline" class="form-control" id="task-edit-deadline">
                                    <input class="form-control" type="hidden" id="task-edit-id" value="696969" name="task-edit-id">
                                </div>
                                
                                <input type="submit" id="btn-edit-task" class="btn btn-outline-info btn-lg btn-block" value="Edit">
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
        
                                    
                                    

        <div>
            <form id="taskdone-form" action="DoneTask" method="post">
                <input type="hidden" name="task-id" id="task-done-id">
            </form>
            <form id="taskdel-form" action="DelTask" method="post">
                <input type="hidden" name="Id" id="task-del-id">
            </form>
        </div>
    </body>
</html>
