/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.UserDAO;
import Model.Users;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author tkluffy
 */
public class LoginAdmin extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
                response.setContentType("text/html;charset=UTF-8");
                String email = request.getParameter("email_login").trim();
		String password = request.getParameter("password_login").trim();
		System.out.println(email);
                System.out.println(password);
		Users user = UserDAO.loginAdmin(email, password);
		System.out.println("Check xong");
		if (user != null) {
			session.setAttribute("user", user);
			/* List<Tag> listTag = userDao.getTagsByUser(user.getId()); */
			/* request.setAttribute("listTag", listTag); */
			/* session.setAttribute("listTag", listTag); */
			/*
			 * RequestDispatcher dispatcher =
			 * request.getRequestDispatcher("tags/index.jsp"); dispatcher.forward(request,
			 * response);
			 */
                        System.out.println("Chuyen huong");
                        response.sendRedirect(request.getContextPath() + "/adminpage/admin.jsp");
			
			
		} else {
                        request.setAttribute("error_login", "Sai tài khoản hoặc mật khẩu");
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/adminpage/admin-login.jsp");
                        dispatcher.forward(request, response);
		}
        
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
