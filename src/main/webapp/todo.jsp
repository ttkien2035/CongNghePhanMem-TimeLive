<%-- 
    Document   : index
    Created on : Dec 17, 2020, 12:34:03 AM
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
    <%
    Users user = (Users)session.getAttribute("user");
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
                            <h4 class="card-title">Todo List <button class="btn" id="task-todo-refresh" ><i class="fa fa-repeat"></i></button></h4>
                        </div>
                        <div class="card-body">
                            <!-- the events -->
                            <div id="external-events">
                                <%
                                List<Todo> listofTodos = TodoDAO.getAllTodos(user.getUserid());
                                for (int i=0;i<listofTodos.size();i++)
                                {
                                %>
                                <form class="task-group mb-1" style="background-color:<%= listofTodos.get(i).getTag().getColor()  %>;">
                                    <input type="hidden" id="task-todo-id" value="<%= listofTodos.get(i).getTodoid()  %>">
                                    <div class="checkbox middle">
                                        <label >
                                            <input type="checkbox" id="task-todo-check" class="check" >
                                        </label>
                                    </div>
                                    <div class="external-event middle" id="task-todo-des"><%= listofTodos.get(i).getDescript() %></div>
                                    <div><span class="badge badge-secondary middle" id="task-todo-prio"><%= listofTodos.get(i).getTag().getTag() %></span></div>
                                    <button class="btn btn-hidden-bgr middle" id="task-todo-edit"><i class="fa fa-pencil-square-o" ></i></button>
                                    <button class="btn btn-hidden-bgr middle" id="task-todo-delete"><i class="fa fa-trash" ></i></i></button>
                                </form>
                                <% } %>
                            </div>
                            <div class="add-todo-task">
                                <button type="button" class="btn btn-add-todo-task" id="btn-add-todo-task" data-toggle="modal" data-target="#addtodotask">
                                    Add New  <i class="fa fa-plus" aria-hidden="true"></i>
                                </button>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                </div>
                <!----------  End Todo List View ----------->

                <!---------- Start Category List View ---------->
                <div class="mb-3 container">
                    <div class="card todo-block container">
                        <div class="card-header">
                            <h4 class="card-title">My category</h4>
                        </div>
                        <div class="card-body ">
                            <div id="external-category-events" class="category-list-view">
                                <%
                                    List<Tag> listofTags = TodoDAO.getAllTags(user.getUserid());
                                    for(int i=0;i<listofTags.size();i++)
                                    {
                                %>
                                
                                <div class="category-group" style="background-color: <%= listofTags.get(i).getColor() %>">
                                    <input type="hidden" id="tag-id" value="<%= listofTags.get(i).getUsers().getUserid() %>">
                                    <div class="external-category-event" id="tag-des"><%= listofTags.get(i).getTag() %></div>
                                    <button class="btn btn-hidden-bgr middle" id="tag-edit"><i class="fa fa-pencil" aria-hidden="true"></i></button>
                                    <a href="DeleteTag?tagid=<%= listofTags.get(i).getTagid() %>" class="btn btn-hidden-bgr middle" id="tag-delete"><i class="fa fa-trash" ></i></i></a>
                                </div>
                                <% } %>
                            </div>
                        </div>
                        <div class="add-todo-category">
                            <button type="button" class="btn btn-add-todo-category" id="btn-add-tag" data-toggle="modal" data-target="#addtodocategory">
                                Add New  <i class="fa fa-plus" aria-hidden="true"></i>
                            </button>
                        </div>

                        <!-- /.card-body -->
                    </div>

                </div>
                <!------------- End Category List View ---------------->
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
                            <form action="" method="get">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Task</span>
                                    </div>
                                    <input type="text" id="task-des-add" name="task-des-add" class="form-control">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Category</span>
                                    </div>
                                    <select class="form-control" id="task-cate-add" name="task-cate-add">
                                        <%
                                         for(int i=0;i<listofTags.size();i++)
                                         {
                                        %>
                                        <option calue="<%= listofTags.get(i).getTagid() %>"><%= listofTags.get(i).getTag() %></option>
                                        <% } %>
                                    </select>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Date</span>
                                    </div>
                                    <input type="date" id="todo-date-add" name="todo-date-add" class="form-control">
                                </div>
                                <button type="button" id="btn-add-todo-task" class="btn btn-outline-info btn-lg btn-block">Add</button>
                            </form>
                        </div>
                        <!---   End card add task   -->
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>
        <!---------- End modal add Todo task ---------->
        
        
        
        <!---------- Start modal add Todo Tag----------->
        <div class="modal" id="addtodocategory">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Add Tag</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <!------ Start card add task ----->
                        <div class= "card todo-block container mt-3">
                            <form action="InsertTag" method="get">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Task</span>
                                    </div>
                                    <input type="text" id="tag-des-add" name="tag-des-add" class="form-control">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Category</span>
                                    </div>
                                    <input type="color" id="tag-color-add" name="tag-color-add" class="form-control" list="categoryList">
                                </div>
                            
                            <button type="submit" id="btn-add-todo-tag" class="btn btn-outline-info btn-lg btn-block">Add</button>
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
        <!---------- End modal add Todo Category --------------->
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