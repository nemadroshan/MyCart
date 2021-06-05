package com.nt.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Logout
 */
@WebServlet(urlPatterns = {"/logout"} ,name = "logout")
public class Logout extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Logout called");
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.removeAttribute("current-user");
		session.invalidate();
		response.sendRedirect("login.jsp");
	}
}
