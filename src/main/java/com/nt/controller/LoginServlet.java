package com.nt.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nt.dao.UserDao;
import com.nt.entity.User;

@WebServlet(name = "LoginServlet", urlPatterns = { "/LoginServlet" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao dao;

	public LoginServlet() {
		dao = new UserDao();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		try {
			// get value from from
			String email = request.getParameter("email");
			String password = request.getParameter("pwd");

			// authetication from db
			User user = dao.getUserByEmailAndPassword(email, password);
			// System.out.println(user);
			HttpSession session = request.getSession();
			if (user == null) {
				response.sendRedirect("login.jsp");
				session.setAttribute("message", "Invalid email or Password !!");
				return;
			} else {
				session.setAttribute("current-user", user);
				if (user.getUserType().equals("admin")) {
					response.sendRedirect("admin.jsp");
				} else if (user.getUserType().equals("normal")) {
					response.sendRedirect("user.jsp");
				}
				else {
					response.sendRedirect("login.jsp");
					session.setAttribute("message", " We have not identified user !!");
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
