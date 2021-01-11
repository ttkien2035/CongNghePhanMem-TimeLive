/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.UserDAO;
import Mail.MailAPI;

import Model.Users;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tkluffy
 */
public class ResetPassword extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private UserDAO userDao;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        userDao=new UserDAO();
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("email").trim();
	String password = request.getParameter("password").trim();
		
	Pattern emailPattern = Pattern.compile("\\w+@\\w+(.\\w+)*");
        Matcher emailMatcher = emailPattern.matcher(email);
        
        if (!emailMatcher.matches()) {
        	
        	request.setAttribute("email", email);
            request.setAttribute("emailError", "This is not an email address!");
            request.setAttribute("password", password);
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("reset-password.jsp");
			dispatcher.forward(request, response);
			
        } else {
        	Users user = UserDAO.existUser(email);
                
        	if (user != null) {
    			//userDao.resetPassword(email, password);
        		//url="/signup-confirm.jsp";
				request.getSession().setAttribute( "email", email);
				request.getSession().setAttribute( "password", password);
                String code = MailAPI.Send(email);
                request.getSession().setAttribute("code",code);
    			RequestDispatcher dispatcher = request.getRequestDispatcher("reset-pass-confirm.jsp");
    			dispatcher.forward(request, response);
    			
    		} else {
    			request.setAttribute("email", email);
                request.setAttribute("emailError", "User does not exist!");
                request.setAttribute("password", password);
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("reset-password.jsp");
    			dispatcher.forward(request, response);
    		}
        }
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ResetPassword</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResetPassword at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
	try {
		resetPassword(request, response);
		
        } catch (Exception e) {
		}
		
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    private void resetPassword(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String email = request.getParameter("email").trim();
	String password = request.getParameter("password").trim();
		
	Pattern emailPattern = Pattern.compile("\\w+@\\w+(.\\w+)*");
        Matcher emailMatcher = emailPattern.matcher(email);
        
        if (!emailMatcher.matches()) {
        	
        	request.setAttribute("email", email);
            request.setAttribute("emailError", "This is not an email address!");
            request.setAttribute("password", password);
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("reset-password.jsp");
			dispatcher.forward(request, response);
			
        } else {
        	Users user = UserDAO.existUser(email);
                
        	if (user != null) {
    			//userDao.resetPassword(email, password);
        		//url="/signup-confirm.jsp";
                    request.getSession().setAttribute( "email", email);
                    request.getSession().setAttribute( "password", password);
                    String code = MailAPI.Send(email);
                    request.getSession().setAttribute("code",code);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("reset-pass-confirm.jsp");
                    dispatcher.forward(request, response);
    			
    		} else {
                    request.setAttribute("email", email);
                    request.setAttribute("emailError", "User does not exist!");
                    request.setAttribute("password", password);
                
                    RequestDispatcher dispatcher = request.getRequestDispatcher("reset-password.jsp");
                    dispatcher.forward(request, response);
    		}
        }
		
		
    }
}
