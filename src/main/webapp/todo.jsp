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
                                <div class="task-group mb-1" style="background-color:<%= listofTodos.get(i).getTag().getColor()  %>;">
                                    <input type="hidden" id="task-todo-id" value="<%= listofTodos.get(i).getTodoid()  %>">
                                    <div class="checkbox middle">
                                        <label >
                                            <input type="checkbox" id="task-todo-check" class="check" >
                                        </label>
                                    </div>
                                    <div class="external-event middle" id="task-todo-des"><%= listofTodos.get(i).getDescript() %></div>
                                    <div><span class="badge badge-secondary middle" id="task-todo-prio"><%= listofTodos.get(i).getTag().getTag() %></span></div>
                                    <button class="btn btn-hidden-bgr middle" id="todo-edit" onclick="FillEditTodoModal('<%= listofTodos.get(i).getDescript() %>','<%= listofTodos.get(i).getPrio() %>',<%= listofTodos.get(i).getTag().getTagid() %>,'<%= listofTodos.get(i).getDatetodo() %>')" data-toggle="modal" data-target="#edittodotask"><i class="fa fa-pencil" aria-hidden="true"></i></button>
                                    <a href="DeleteTodo?todoid=<%= listofTodos.get(i).getTodoid() %>" class="btn btn-hidden-bgr middle" id="task-todo-delete"><i class="fa fa-trash" ></i></a>
                                </div>
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
                                    <button class="btn btn-hidden-bgr middle" id="tag-edit" onclick="FillEditTagModal('<%= listofTags.get(i).getTag() %>','<%= listofTags.get(i).getColor() %>','<%= listofTags.get(i).getTagid() %>' )" data-toggle="modal" data-target="#edittodotag"><i class="fa fa-pencil" aria-hidden="true"></i></button>
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
                            <form action="InsertTodo" method="get">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Task</span>
                                    </div>
                                    <input type="text" id="todo-des-add" name="todo-des-add" class="form-control">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Priority</span>
                                    </div>
                                    <input type="text" id="todo-prio-add" name="todo-prio-add" class="form-control">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Category</span>
                                    </div>
                                    <select class="form-control" id="todo-tag-add" name="todo-tag-add">
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
                                        <span class="input-group-text">Date</span>
                                    </div>
                                    <input type="date" id="todo-date-add" name="todo-date-add" class="form-control">
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
        <!---------- End modal add Todo task ---------->
        
        
        
        <!-- Modal edit Todo Task -->
        <div class="modal" id="edittodotask">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Edit Todo</h4>
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
                                    <input type="text" id="todo-des-edit" name="todo-des-edit" class="form-control">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Priority</span>
                                    </div>
                                    <input type="text" id="todo-prio-edit" name="todo-prio-edit" class="form-control">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Category</span>
                                    </div>
                                    <select class="form-control" id="todo-tag-edit" name="todo-tag-edit">
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
                                        <span class="input-group-text">Date</span>
                                    </div>
                                    <input type="date" id="todo-date-edit" name="todo-date-edit" class="form-control">
                                </div>
                                <input type="submit" id="btn-add-todo-task" class="btn btn-outline-info btn-lg btn-block" value="OK">
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
        
       
        
        <!---------- End modal edit Todo task ---------->
        
        
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
                                        <span class="input-group-text">Tag</span>
                                    </div>
                                    <input type="text" id="tag-des-add" name="tag-des-add" class="form-control">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Color</span>
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
        <!---------- End modal add Todo Tag --------------->
        
        
        <!---------- Start modal edit Todo Tag----------->
        <div class="modal" id="edittodotag">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Edit Tag</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <!------ Start card add task ----->
                        <div class= "card todo-block container mt-3">
                            <form action="EditTag" method="get">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Tag</span>
                                    </div>
                                    <input type="text" id="tag-des-edit" name="tag-des-edit" class="form-control">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Color</span>
                                    </div>
                                    <input type="color" id="tag-color-edit" name="tag-color-edit" class="form-control">
                                </div>
                                <input type="hidden" name="tag-id-edit" id="tag-id-edit" value="">
                            <button type="submit" id="btn-add-todo-edit" class="btn btn-outline-info btn-lg btn-block">OK</button>
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
        <!---------- End modal edit Todo Category --------------->
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