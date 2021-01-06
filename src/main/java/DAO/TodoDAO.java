/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Hibernate.HibernateUtil;
import Model.*;
import java.util.Date;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author ASUS
 */
public class TodoDAO {
    public static Todo getTodo(int id) {

        Transaction transaction = null;
        Todo td = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            td = (Todo) session.get(Todo.class, id);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return td;
    }
    
  
    
    public static void saveTodo(Todo todo) {
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(todo);
            System.out.println("Insert Sussess");
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
        finally{
            session.close();
        }
    }
    
    public static List < Todo > getAllTodos(int userid) {

        Transaction transaction = null;
        List < Todo > listOfTodos = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            System.out.println("Start load");
            String qr="from Todo where userid =:userid";
            listOfTodos= session.createQuery(qr).setParameter("userid", userid).getResultList();
            System.out.println(listOfTodos.size());
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return listOfTodos;
    }
    public static List < Todo > getAllTodosbydate(int userid,String date) {

        Transaction transaction = null;
        List < Todo > listOfTodos = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            System.out.println("Start load todo by date");
            String qr="from Todo where userid =:userid and datetodo = '" + String.valueOf(date) + "'";
            listOfTodos= session.createQuery(qr).setParameter("userid", userid).getResultList();
            System.out.println(listOfTodos.size() + "load duoc may cai todo ne");
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
        return listOfTodos;
    }
    public static void updateTodo(Todo td) { //edit toàn bộ các cột
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(td);
            System.out.println("Update todo sussess");
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
    }
    public static void deleteTodo(int id) {

        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();

            // Delete a user object
            Todo td = (Todo)session.get(Todo.class, id);
            if (td != null) {
                session.delete(td);
                System.err.println("Delete success");
            }
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
    }
    
    
    
    
    public static List < Tag > getAllTags(int userid) {

        Transaction transaction = null;
        List < Tag > listOfTags = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            System.out.println("Start load all Tag");
            String qr="from Tag where userid =:userid";
            listOfTags= session.createQuery(qr).setParameter("userid", userid).getResultList();
            System.out.println(listOfTags.size());
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        }
        finally{
            session.close();
        }
        return listOfTags;
    }
    
}
