package com.nt.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nt.dao.CategoryDao;
import com.nt.entity.Category;

@WebServlet(urlPatterns = { "/delOperation" }, name = "delOperation")
public class DeleteCategoryOperation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CategoryDao catDao;


	public DeleteCategoryOperation() {
		System.out.println("Category object is created");
		catDao = new CategoryDao();
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Category> listcategory =null;
		try {
			listcategory=catDao.getCategories();
			request.setAttribute("listcategory", listcategory);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
