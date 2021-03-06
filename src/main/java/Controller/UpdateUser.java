/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.UserDAO;
import Model.Users;

/**
 *
 * @author tkluffy
 */
public class UpdateUser extends HttpServlet {
    HttpSession session = null;

    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }
    private void updateUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException, ParseException {
		
		//String email = request.getParameter("email").trim();
		//String password = request.getParameter("password").trim();
		String fullname = request.getParameter("fullname").trim();
		String gender = request.getParameter("gender");
		
		String birthdate_str = request.getParameter("birthdate");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date birthdate = df.parse(birthdate_str);
		
        //Pattern emailPattern = Pattern.compile("\\w+@\\w+(.\\w+)*");
        //Matcher emailMatcher = emailPattern.matcher(email);
        //if (!emailMatcher.matches()) {
        //	request.setAttribute("email", email);
           // request.setAttribute("emailError", " is not an email address!");
       
        	Users user = (Users) session.getAttribute("user");
    		//user.setEmail(email);
    		//user.setPass(password);
    		user.setFullname(fullname);
    		
    		if(gender.equals("Male")) {
    			user.setGender(false);	// false = 0 --> Male
    		} else {
    			user.setGender(true);	// true = 1 --> Female
    		}
    		
    		user.setBirthdate(birthdate);
    		UserDAO.updateUser(user);
    		session.setAttribute("user", UserDAO.getUser(user.getUserid()));
        
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("account.jsp");
		dispatcher.forward(request, response);
}

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession(true);
		try {
			updateUser(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
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

}
