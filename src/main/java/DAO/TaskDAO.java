/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Hibernate.HibernateUtil;
import Model.Task;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
public class TaskDAO {
     public static Task getTask(int id) {

        Transaction transaction = null;
        Task td = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            td = (Task) session.get(Task.class, id);
            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        return td;
    }
    
  
    
    public static void saveTask(Task todo) {
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
    public static void updateTask(Task td) { //edit toàn bộ các cột
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(td);
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
    public static void deleteTask(int id) {

        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();

            // Delete a user object
            Task td = (Task)session.get(Task.class, id);
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
    public static List < Task > getAllTasks(int userid) {

        Transaction transaction = null;
        List < Task > listOfTasks = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            System.out.println("Start load");
            String qr="from Task t where userid =:userid and t.done=false  ";
            listOfTasks= session.createQuery(qr).setParameter("userid", userid).getResultList();
            System.out.println(listOfTasks.size());
            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        return listOfTasks;
    }
    public static List < Task > getAllTasksNoId() {

        Transaction transaction = null;
        List < Task > listOfTasks = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            System.out.println("Start load");
            String qr="from Task t order by t.users.id";
            listOfTasks= session.createQuery(qr).getResultList();
            System.out.println(listOfTasks.size());
            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        return listOfTasks;
    }
    public static List < Task > getAllDoneTasks(int userid) {

        Transaction transaction = null;
        List < Task > listOfTasks = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            System.out.println("Start load");
            String qr="from Task t where userid =:userid and t.done=true  ";
            listOfTasks= session.createQuery(qr).setParameter("userid", userid).getResultList();
            System.out.println(listOfTasks.size());
            // commit transaction
            transaction.commit();session.close();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }
        return listOfTasks;
    }
    
    public static int SoTask()
    {
        int count=99;
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            Number c = (Number) session.createQuery("select count(*) from Task").uniqueResult();
            count=c.intValue();
            session.close();
        } 
        catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }      
        return count;
    }
    public static int SoTaskNotDone()
    {
        int count=99;
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            Number c = (Number) session.createQuery("select count(*) from Task t where t.done=false").uniqueResult();
            count=c.intValue();
            session.close();
        } 
        catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }      
        return count;
    }
    public static int SoTaskDone()
    {
        int count=99;
        Transaction transaction = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            // start a transaction
            transaction = session.beginTransaction();
            Number c = (Number) session.createQuery("select count(*) from Task t where t.done=true").uniqueResult();
            count=c.intValue();
            session.close();
        } 
        catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();session.close();
            }
        }      
        return count;
    }
    public static String returnDate(Date date)
    {
        if(date == null)
        {
            return "...";
        }
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");          
        return df.format(date);
    }
    public static String returnDone(Boolean a)
    {
        if(a)
        {
            return "Yes";
        }        
        return "No";
    }
}
