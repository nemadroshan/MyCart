package com.nt.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nt.dao.CategoryDao;
import com.nt.dao.ProductDao;
import com.nt.entity.Category;

@WebServlet(urlPatterns = { "/delOperation" }, name = "delOperation")
public class DeleteCategoryOperation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CategoryDao catDao;
	private ProductDao patdao;

	public DeleteCategoryOperation() {
		System.out.println("Category object is created");
		catDao = new CategoryDao();
		patdao = new ProductDao();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Category> listcategory = null;
		HttpSession session = request.getSession();
		try {
			String[] id = request.getParameterValues("pcheck");
			String[] catid = request.getParameterValues("cCheck");
			System.err.println("Id Arrt -->" + Arrays.toString(id));
			System.err.println("Id Arrt -->" + Arrays.toString(catid));
			
			String operation = request.getParameter("operation");
			
			System.err.println("Operatoiobs -->"+operation);
			if (operation != null && operation.equals("delProduct")) {
				if (id != null) {
					for (String i : id) {
						if (i != null) {
							int c = patdao.removeProduct(Integer.parseInt(i));
							System.err.println("product deletd witgh id -->" + c);
							if (c > 0)
								session.setAttribute("message", "Selected Product Has been Deleted");
							response.sendRedirect("admin.jsp");
							return;
						}
					}
				}
			} else if (operation != null && operation.equals("delCategory")) {
				if (catid != null) {
					for (String i : catid) {
						if (i != null) {
							int c = catDao.removeCategory(Integer.parseInt(i));
							System.err.println("product deletd witgh id -->" + c);
							if (c > 0)
							session.setAttribute("message", "Selected Category Has been Deleted");
							response.sendRedirect("admin.jsp");
							return;
						}
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
