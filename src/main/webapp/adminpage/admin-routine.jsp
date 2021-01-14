<%-- 
    Document   : admin-task
    Created on : Jan 8, 2021, 4:31:13 PM
    Author     : ASUS
--%>
<%@page import="java.util.List"%>
<%@page import="DAO.*"%>
<%@page import="Model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <script src="../js/jquery.tablePagination.js" type="text/javascript"></script>
        <style>
            .tablePagination {
                margin-top: 1em;
                right:5%;
                font-size: 20px;
                width: 100%;
                background-color: #bacbcf;
                text-align: center;
                padding-left: 20px;
                display: inline;

            }

            .tablePagination:before {
                content:"Pages: ";
            }

            .tablePagination li {
                cursor: pointer;
                display: inline-block;
                list-style: none;
                padding: 2px 9px;
            }

            .tablePagination li:hover {
                background: #eee;
            }

            .tablePagination .current {
                background: #26b;
                color: #fff;
            }
        </style>
        <script>
            $(document).ready(function(){
               $('#mytodo-table').tablePagination({
                    perPage: 10,
                    initPage:1,                      
                    showAllButton:false
                }); 
            });
        </script>
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
                         <div class="user-info">
                            <span class="user-name">
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
                </div>
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
            <%
                List<Routines> listofTodos = RoutineDAO.getAllRoutine();
                int soRoutine = RoutineDAO.getTotalRoutine();
                
            %>
            <main class="page-content">
                <div class="container-fluid">
                    <h2>TIME LIVE</h2>
                    <h2><b>Routine Info</b></h2>
                    <h5>Total Routine : <%= soRoutine   %></h5>
                    <article style="border:solid 1px black;padding-left: 3%;padding-right: 3%">
                        <h5>List of Routine</h5>
                        <div class="card todo-block container" id="mytask">   
                            <table id="mytodo-table">
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    
                                </tr>
                                <%
                                    for(int i=0;i<listofTodos.size();i++){
                                        Routines x = listofTodos.get(i);
                                        
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
        </div>   
    </body>
</html>
