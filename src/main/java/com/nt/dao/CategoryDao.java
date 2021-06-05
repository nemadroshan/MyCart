package com.nt.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.nt.Factory.FactoryProvider;
import com.nt.entity.Category;
import com.nt.entity.User;

public class CategoryDao {
	private SessionFactory sessionFactory;
	
	public CategoryDao() {
		this.sessionFactory= FactoryProvider.getFactory();
	}
	
	public int insertCategory(Category category) throws Exception{
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		int num = (int) session.save(category);
		tx.commit();
		session.close();
		return num;
	}
	public List<Category> getCategories() throws Exception{
		List<Category> list = new ArrayList<>();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Category");
		list = query.getResultList();
		session.close();
		return list;
	}
	
	public Category  getCategoryById(int id) throws Exception {
		Category category =null;
		Session session= sessionFactory.openSession();
		category=	session.get(Category.class, id);
		session.close();
		return category;
	}
	
	public int removeCategory(int id){ 
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Query query2 = session.createQuery(" delete from Category where categoryId =: id ");
		//System.out.println("Deleting a row having the value 'Third' in a property named 'firstName'");
		query2.setParameter("id",id);
		int c =query2.executeUpdate();
		session.getTransaction().commit();
		return c;
	}
}
