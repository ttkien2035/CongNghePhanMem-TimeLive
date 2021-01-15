<%-- 
    Document   : user-detail
    Created on : Jan 6, 2021, 1:03:52 PM
    Author     : ASUS
--%>

<%@page import="javax.enterprise.inject.Model"%>
<%@page import="DAO.*"%>
<%@page import="Model.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String sid = request.getParameter("user-id");
    if(sid.isEmpty()){
        response.sendRedirect("manage-user.jsp");
    }

    int id = Integer.parseInt(sid);
    Users u = UserDAO.getUser(id);
            
    

%>
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
        <title>Admin | User detail</title>
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
        <a href="admin.jsp">Home</a>
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
            <strong><%=u.getFullname()            %></strong>
          </span>
          <span class="user-role"><%=u.getEmail()        %></span>
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
              <a href="admin.jsp">
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
        <div class="container-fluid">
            <h2>TIME LIVE</h2>
            <h2><b>User Info</b></h2>
            <article style="border:solid 1px black;padding-left: 3%;padding-right: 3%">
                <h5>Name : <%=u.getFullname()             %></h5>
                <h5>Sex : <%=u.returnGen()             %></h5>
                <h5>Email : <%=u.getEmail()         %></h5>
                <h5>Birthday : <%=u.getBirthdate()             %></h5>
            </article>
            <form method="post" action="SetAdminU">
                <input type="hidden" name="id" value="<%=id %>">
                <input type="submit" value="Set Admin" >
            </form>
            <h2><b>User Todo List</b></h2>
            <article style="border:solid 1px black;padding-left: 3%;padding-right: 3%">
                <%
                    List<Todo> listofTodos = TodoDAO.getAllTodos(u.getUserid());
                %>
                <h5>All todo: <%= listofTodos.size() %> </h5>
                <div class="card todo-block container" id="mytask">
                    <table id="mytodo-table">
                        <tr>
                            <th>Id</th>
                            <th>Description</th>
                            <th>Prio</th>
                            <th>Date</th>
                            <th>Done</th>
                        </tr>
                        <%
                            for(int i=0;i<listofTodos.size();i++){
                                Todo x = listofTodos.get(i);
                                String color = x.getTag().getColor();
                        %>
                        <tr style="background-color: <%=color%>">
                            <td><%= x.getTodoid()   %></td>
                            <td><%= x.getDescript()   %></td>
                            <td><%= x.getPrio()  %></td>
                            <td><%= x.getDatetodo()  %></td>
                            <td><%= x.getDone()  %></td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </article>
            <h2><b>User Task List</b></h2>
            <article style="border:solid 1px black;padding-left: 3%;padding-right: 3%">
                <%
                    List <Task> curtask = TaskDAO.getAllTasks(u.getUserid());
                    List <Task> fihtask = TaskDAO.getAllDoneTasks(u.getUserid());
                %>
                <h5>Current Task : <%=curtask.size()           %></h5>
                    <div class="card todo-block container" id="mytask">   
                        <table id="mytask-table">
                            <tr>
                                <th>Id</th>
                                <th>Name</th>
                                <th>Deadline</th>
                            </tr>
                            <%
                            for(int i=0;i<curtask.size();i++){
                                Task x = curtask.get(i);
                                String color = x.getTag().getColor();
                            %>
                            <tr style="background-color: <%=color%>">
                                <td><%=x.getTaskid()   %></td>
                                <td><%=x.getTaskname()   %></td>
                                <td><%=TaskDAO.returnDate(x.getDeadline())  %></td>
                            </tr>   
                            <%   
                                }
                            %>
                        </table>
                    </div>
                <h5>Finished Task : <%=fihtask.size()           %></h5>
                    <div class="card todo-block container" id="mytaskdone">   
                        <table id="mytaskdone-table">
                            <tr>
                                <th>Id</th>
                                <th>Name</th>
                                <th>Deadline</th>
                                <th>Done at</th>
                            </tr>
                            <%
                            for(int i=0;i<fihtask.size();i++){
                                Task x = fihtask.get(i);
                                String color = x.getTag().getColor();
                            %>
                            <tr style="background-color: <%=color%>">
                                <td><%=x.getTaskid()   %></td>
                                <td><%=x.getTaskname()   %></td>
                                <td><%=TaskDAO.returnDate(x.getDeadline())  %></td>
                                <td><%=TaskDAO.returnDate(x.getDoneat())  %></td>
                            </tr>   
                            <%   
                                }
                            %>
                        </table>
                    </div>
            </article>
            <h2><b>User Routine List</b></h2>
            <article style="border:solid 1px black;padding-left: 3%;padding-right: 3%">
                <%
                    List<Routines> listofRT1 = RoutineDAO.getAllRoutineses(u.getUserid());                
                %>
                <h5>All Routine: <%= listofRT1.size() %> </h5>
                <div class="card todo-block container" id="mytask">
                    <table id="mytodo-table">
                        <tr>
                            <th>Id</th>
                            <th>Name of Routine</th>
                            
                        </tr>
                        <%
                            for(int i=0;i<listofRT1.size();i++){
                                Routines x = listofRT1.get(i);
                        %>
                        <tr>
                            <td><%= x.getRid()   %></td>
                            <td><%= x.getRname()   %></td>
                            
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
                
                
            </article>
           
            
        </div>
    </main>
  <!-- page-content" -->
    </div>
    </body>
</html>
