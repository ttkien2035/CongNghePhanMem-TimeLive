/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.UserDAO;
import Mail.MailAPI;
import Mail.RandomString;
import Model.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class SignUp extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String fullname=request.getParameter("fullname");
        String bd=request.getParameter("bd");
        String gender=request.getParameter("gender");
        String mail=request.getParameter("mail");
        String pass=request.getParameter("password");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SignUp</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUp at " + request.getContextPath() + "</h1>");
            out.println("<h1>"+ fullname +" </h1>");
            out.println("<h1>"+ bd +" </h1>");
            out.println("<h1>"+ gender +" </h1>");
            out.println("<h1>"+ mail +" </h1>");
            out.println("<h1>"+ pass +" </h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        processRequest(request, response);
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
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            String url="";
            String fullname=request.getParameter("fullname");
            String bd=request.getParameter("bd");
            String gender=request.getParameter("gender");
            String mail=request.getParameter("mail");
            String pass=request.getParameter("password");
            Users newU = UserDAO.existUser(mail);
            PrintWriter out = response.getWriter();
            boolean boolgender = true;
            if(Integer.valueOf(gender)==0)
            {
                boolgender = false;
            }
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date birthdate;
            birthdate = formatter.parse(bd);
            if(null!=newU)
            {
                url="/signup-fail.jsp";
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);
            } else {
                Users a=new Users(mail,pass,fullname,boolgender,birthdate);
                
                url="/signup-confirm.jsp";
                request.getSession().setAttribute( "newuser", a);
                String code = MailAPI.Send(mail);
                request.getSession().setAttribute("code",code);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);
            }
        } catch (ParseException ex) {
            String url="/signup-fail.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
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
