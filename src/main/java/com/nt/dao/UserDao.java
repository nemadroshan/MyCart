package com.nt.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.nt.Factory.FactoryProvider;
import com.nt.entity.User;

public class UserDao {
	private SessionFactory sessionFactory;

	public UserDao() {
		this.sessionFactory = FactoryProvider.getFactory();
	}

	public int insertUser(User user) throws Exception{
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		int num = (int) session.save(user);
		tx.commit();
		session.close();
		return num;
	}

	public User getUserByEmailAndPassword(String uemail, String password) throws Exception{
		User user=null;
	
			String query = "from User where userEmail =: e and userPassword =: p";
			Session session = sessionFactory.openSession();
			Transaction tx = session.beginTransaction();
			
			Query createQuery = session.createQuery(query);
			createQuery.setParameter("e", uemail);
			createQuery.setParameter("p", password);
			
			user =(User) createQuery.uniqueResult();//this method returns unique obj based on parameters 
			session.close();
		return user;
	}
}
