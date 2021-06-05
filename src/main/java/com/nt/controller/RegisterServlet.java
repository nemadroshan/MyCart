package com.nt.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.exception.ConstraintViolationException;

import com.nt.Factory.FactoryProvider;
import com.nt.dao.UserDao;
import com.nt.entity.User;

@WebServlet(name = "RegisterServlet", urlPatterns = { "/RegisterServlet" })
public class RegisterServlet extends HttpServlet {
	private UserDao dao = null;

	public RegisterServlet() {
		super();
		this.dao = new UserDao();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		try {
			HttpSession session = request.getSession();
			String userName = request.getParameter("user_name");
			String userEmail = request.getParameter("user_email");
			String password = request.getParameter("pwd");
			String phone = request.getParameter("phone");
			String addrs = request.getParameter("addrs");

			if (userName == null || userName.length() == 0) {
				session.setAttribute("message", "User Name should not be blank");
				response.sendRedirect("register.jsp");
				return;
			}
			User user = new User(userName, userEmail, password, phone, "default.png", addrs, "normal");
			int userId = dao.insertUser(user);

			
			session.setAttribute("message", "Registration Successfull  with  Id : " + userId + " !! ");
			response.sendRedirect("register.jsp");
			return;
		} 
		catch (Exception e) {
			HttpSession session = request.getSession();
			System.out.println(e.getClass().getName());
			session.setAttribute("message", "Already Registerd with email  !! ");
			response.sendRedirect("register.jsp");
			e.printStackTrace();
			return;
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
