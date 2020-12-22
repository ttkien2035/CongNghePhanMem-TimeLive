/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Hibernate.HibernateUtil;
import java.util.List;
import Model.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
/**
 *
 * @author ASUS
 */
public class TagDAO {
    public static void saveTag(Tag tag) {
		Transaction transaction = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			session.save(tag);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	
	public static void updateTag(Tag tag) {
		Transaction transaction = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			session.update(tag);
                        System.out.println("Update Sussess");
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
                
	}
	
	public static void deleteTag(int id) {
		Transaction transaction = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			Tag tag = session.get(Tag.class, id);
			
			if(tag != null) {
				session.delete(tag);
				System.out.println("Tag is deleted");
			}
			
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
	
	public static Tag getTag(int id) {
		Transaction transaction = null;
		Tag tag = null;
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			tag = session.get(Tag.class, id);
			
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return tag;
	}
	
	@SuppressWarnings("unchecked")
	public static List<Tag> getTagByUser(Users user) {
		Transaction transaction = null;
		List<Tag> listOfTag = null;
		
		String query = "from Tag T where T.user = :user";
		
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			listOfTag = session.createQuery(query).setParameter("user", user).getResultList();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return listOfTag;
	}
	
	@SuppressWarnings("unchecked")
	public static List<Tag> getAllTag() {
		Transaction transaction = null;
		List<Tag> listOfTag = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			listOfTag = session.createQuery("from Tag").getResultList();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return listOfTag;
	}
}
