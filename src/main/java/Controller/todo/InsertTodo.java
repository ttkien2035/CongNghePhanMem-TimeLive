/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.todo;

import DAO.TagDAO;
import DAO.TodoDAO;
import Model.Tag;
import Model.Todo;
import Model.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
public class InsertTodo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Users user = (Users)session.getAttribute("user");
        String todo_des = request.getParameter("todo-des-add");
        String todo_prio = request.getParameter("todo-prio-add");
        Tag todo_tag = TagDAO.getTag(Integer.parseInt(request.getParameter("todo-tag-add")));
        String todo_date = request.getParameter("todo-date-add");
        Date tododate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("todo-date-add"));
        String date = request.getParameter("date_todo");
        request.setAttribute("date_todo_send", date);
        if (date != null){
            List<Todo> listofTodos = TodoDAO.getAllTodosbydate(user.getUserid(), date);
            request.setAttribute("listofTodos", listofTodos);
        } 
        Todo td = new Todo(todo_tag,user,todo_des,todo_prio,tododate,false);
        System.out.println(todo_des);
        System.out.println(todo_prio);
        System.out.println(todo_tag);
        System.out.println(todo_date);
        TodoDAO.saveTodo(td);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/todo.jsp");
        dispatcher.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(InsertTodo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(InsertTodo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
