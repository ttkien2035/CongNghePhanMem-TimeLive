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
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

/**
 *
 * @author ASUS
 */
public class TodoDAO {
    public static int getTotalTodo(){
        Transaction transaction = null;
        List < Todo > listOfTodosList = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            System.out.println("Start load all Todo");
            String qr="from Todo ";
            listOfTodosList = session.createQuery(qr).getResultList();
            System.out.println(listOfTodosList.size());
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
        if(listOfTodosList==null){
            return 0;
        }
        else{
            return listOfTodosList.size();
        }
    }
    public static List< Todo > getAllTodo(){
        Transaction transaction = null;
        List < Todo > listOfTodosList = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            System.out.println("Start load all Todo");
            String qr="from Todo ";
            listOfTodosList = session.createQuery(qr).getResultList();
            System.out.println(listOfTodosList.size());
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
        return listOfTodosList;
    }
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


    public List<Object[]> statisticTodoGroupByTag(Users user, Date date){
        List<Object[]> resultList = null;

        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();

        try {

            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<Object[]> criteriaQuery = builder.createQuery(Object[].class);
            Root<Todo> root = criteriaQuery.from(Todo.class);
            criteriaQuery.multiselect(root.get("tag"),builder.count(root.get("tag")));
            criteriaQuery.groupBy(root.get("tag"));

            System.out.println(date.toString());
            System.out.println(user.getFullname());

            Predicate eqUser = builder.equal(root.get("users"), user);
            Predicate eqDate = builder.equal(root.get("datetodo"), date);

            criteriaQuery.where(builder.and(eqUser, eqDate));
            Query<Object[]> query = session.createQuery(criteriaQuery);
            System.out.println(user.getFullname());

            resultList = query.getResultList();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

        return resultList;
    }

    public List<Object[]> statisticTodoDone(Users user, Date date){
        List<Object[]> resultList = null;

        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();

        try {

            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<Object[]> criteriaQuery = builder.createQuery(Object[].class);
            Root<Todo> root = criteriaQuery.from(Todo.class);
            criteriaQuery.multiselect(root.get("done"),builder.count(root.get("done")));
            criteriaQuery.groupBy(root.get("done"));

            Predicate eqUser = builder.equal(root.get("users"), user);
            Predicate eqDate = builder.equal(root.get("datetodo"), date);

            criteriaQuery.where(builder.and(eqUser, eqDate));

            Query<Object[]> query = session.createQuery(criteriaQuery);

            resultList = query.getResultList();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

        return resultList;
    }

    @SuppressWarnings("unchecked")
    public List<Object[]> statisticWeekly(Users user, Date dbegin, Date dend) {
        Transaction transaction = null;
        List<Object[]> listResult = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();

        String query = "select datetodo, done, count(done) from Todo where users=:user and datetodo >= :dbegin and datetodo <= :dend group by datetodo, done";
        try {
            transaction = session.beginTransaction();

            Query<Object[]> queryObj = session.createQuery(query).setParameter("user", user)
                    .setParameter("dbegin", dbegin)
                    .setParameter("dend", dend);
            /*
             * listResult = session.createSQLQuery(query) .setParameter("user", user)
             * .setParameter("dbegin", dbegin) .setParameter("dend", dend) .getResultList();
             */

            listResult = queryObj.getResultList();

            System.out.println("__________________________________________________");
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        System.out.println(listResult);
        return listResult;
    }
    
}
