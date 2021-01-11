/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tkluffy
 */
public class ResetPassConfirm extends HttpServlet {

    private UserDAO userDao;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        userDao = new UserDAO();
        String url="";
        String email =  (String)request.getSession().getAttribute("email");
        String password =  (String)request.getSession().getAttribute("password");
        System.out.println("day la pass moi"+password);
        String code = request.getParameter("code");
        String maxn = request.getParameter("maxacnhan");
        if(code.equals(maxn))
        {
            url="/reset-success.jsp";
            UserDAO.resetPassword(email, password);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
        else{
             url="/reset-confirm-fail.jsp";
             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ResetPassConfirm</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResetPassConfirm at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
		resetPassConfirm(request, response);
		
        } catch (Exception e) {
            // TODO Auto-generated catch block

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
    private void resetPassConfirm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
        String url="";
        String email =  (String)request.getSession().getAttribute("email");
        String password =  (String)request.getSession().getAttribute("password");
        System.out.println("day la pass moi"+password);
        String code = request.getParameter("code");
        String maxn = request.getParameter("maxacnhan");
        if(code.equals(maxn))
        {
            url="/reset-success.jsp";
            UserDAO.resetPassword(email, password);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
        else{
             url="/reset-confirm-fail.jsp";
             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
             dispatcher.forward(request, response);
        }
    }
}
