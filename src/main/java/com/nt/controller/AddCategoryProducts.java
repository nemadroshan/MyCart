package com.nt.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.io.IOUtils;

import com.nt.dao.CategoryDao;
import com.nt.dao.ProductDao;
import com.nt.entity.Category;
import com.nt.entity.Product;

@WebServlet(urlPatterns = { "/AddOperation" }, name = "AddOperation")
@MultipartConfig
public class AddCategoryProducts extends HttpServlet {
	
	private CategoryDao catDao;
	private ProductDao podDao;

	public AddCategoryProducts() {
		this.catDao = new CategoryDao();
		this.podDao = new ProductDao();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession();
		// TODO Auto-generated method stub
		try {
			String op = request.getParameter("operation");
			Category category = null;
			int count = 0;
			if (op.trim().equals("addCategory")) {
				// add categore here
				String categoryTitle = request.getParameter("catTitle");
				String catgoryDesc = request.getParameter("catDesc");

				category = new Category();
				category.setCategoryTitle(categoryTitle);
				category.setCategoryDecription(catgoryDesc);
				count = catDao.insertCategory(category);
				if (count > 0)
					session.setAttribute("message", "Categogy saved Successfully");
				response.sendRedirect("admin.jsp");
				return;

			} // if
			else if (op.trim().equals("addProduct")) {
				count = 0;
				Product product = null;
				// add product here
				String pName = request.getParameter("podName");
				String pdesc = request.getParameter("podDesc");
				String pPhoto = request.getParameter("podImg");
				int pPrice = Integer.parseInt(request.getParameter("podPrice"));
				int pDiscount = Integer.parseInt(request.getParameter("podDiscount"));
				int pQuantity = Integer.parseInt(request.getParameter("podQuantity"));
				int categoryId = Integer.parseInt(request.getParameter("catId"));

				// feching fie
				Part part = request.getPart("podImg");
				category = null;
				category = catDao.getCategoryById(categoryId);

				// setting values to product object
				product = new Product();
				product.setCategory(category);
				product.setpDesc(pdesc);
				product.setpQuantity(pQuantity);
				product.setpName(pName);
				product.setpPhoto(pPhoto);
				product.setpDiscount(pDiscount);
				product.setpPrice(pPrice);
				product.setpPhoto(part.getSubmittedFileName());

				// save product

				 String FOLDER_PATH = "D:\\temp\\"+part.getSubmittedFileName();

//				String FOLDER_PATH = request.getRealPath("img") + File.separator + "product" + File.separator
//						+ part.getSubmittedFileName();
				System.out.println("Folder path :: " + FOLDER_PATH);
				try {
					FileOutputStream os = new FileOutputStream(FOLDER_PATH);
					InputStream is = part.getInputStream();

					/*
					try {
					int read = 0;  byte[] bytes = new byte[1024];
					os = new FileOutputStream(new File(FOLDER_PATH));
					while ((read = is.read(bytes)) != -1) {
						os.write(bytes, 0, read);
					}
					os.flush(); os.close();
					}
					catch (IOException ex) {
							ex.printStackTrace();
					}
					*/

					//byte[] bytes = new byte[is.available()];
					byte[] len =IOUtils.toByteArray(is);
					is.read(len);
					// writing data
					os.write(len);
					product.setImage(len);
					product.setImagePath("test");
				} catch (IOException ioe) {
					// TODO: handle exception
					ioe.printStackTrace();
				}

				count = podDao.insertProduct(product);
				if (count > 0)
					session.setAttribute("message", "product saved  with Id " + count);
				response.sendRedirect("admin.jsp");
				return;
			} // elseif

		}
		// try
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
