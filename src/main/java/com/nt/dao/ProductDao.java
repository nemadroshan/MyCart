package com.nt.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.nt.Factory.FactoryProvider;
import com.nt.entity.Product;

public class ProductDao {
	private SessionFactory sessionFactory;

	public ProductDao() {
		this.sessionFactory = FactoryProvider.getFactory();
	}

	public int insertProduct(Product product) throws Exception {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		int num = (int) session.save(product);
		tx.commit();
		session.close();
		return num;
	}
	//getAll Product+
	public List<Product> getallProducts(){
		List<Product>pList = null;
		Session session = sessionFactory.openSession();
		//create query
		Query query = null;
		query=session.createQuery("from Product");
		pList=query.getResultList();
		return pList;
	}
	//get category by Id
	public List<Product> getallProductsByCategoryId(int categoryId){
		List<Product>pList = null;
		Session session = sessionFactory.openSession();
		//create query
		Query query = null;
		query=session.createQuery("from Product as p where p.category.categoryId =: id");
		query.setParameter("id",categoryId);
		pList= query.getResultList();
		return pList;
	}
	
	public int removeProduct(int id){ 
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Query query2 = session.createQuery(" delete from Product where pid =: id ");
		//System.out.println("Deleting a row having the value 'Third' in a property named 'firstName'");
		query2.setParameter("id",id);
		int c =query2.executeUpdate();
		session.getTransaction().commit();
		return c;
	}

}
