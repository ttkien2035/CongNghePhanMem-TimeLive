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
public class UserDAO {
    public static int getTotalUsers(){
        Transaction transaction = null;
        List < Users > listOfUsersList = null;
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        try  {
            // start a transaction
            transaction = session.beginTransaction();
            // get an user object
            System.out.println("Start load all Users");
            String qr="from Users ";
            listOfUsersList = session.createQuery(qr).getResultList();
            System.out.println(listOfUsersList.size());
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
        if(listOfUsersList==null){
            return 0;
        }
        else{
            return listOfUsersList.size();
        }
    }
    public static void saveUser(Users user) {
        Transaction transaction = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

                transaction = session.beginTransaction();

                session.save(user);

                transaction.commit();

        } catch (Exception e) {
                if (transaction != null) {
                        transaction.rollback();
                }

                e.printStackTrace();
        }
    }

    public static Users login(String email, String password) {
        Transaction transaction = null;
        Users user = null;
        String query = "from Users U where U.email = :user_email";
        System.out.println("Start check login");
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
                transaction = session.beginTransaction();
                user = (Users)session.createQuery(query).setParameter("user_email", email).getSingleResult();
                System.out.println(user.toString());
                if (user != null && user.getPass().equals(password)) {
                    System.out.println("Check sussess");
                        return user;
                }

                transaction.commit();
        }
        return null;
    }
    public static Users loginAdmin(String email, String password) {
        Transaction transaction = null;
        Users user = null;
        String query = "from Users U where U.email = :user_email";
        System.out.println("Start check login");
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
                transaction = session.beginTransaction();
                user = (Users)session.createQuery(query).setParameter("user_email", email).getSingleResult();
                System.out.println(user.toString());
                if (user != null && user.getPass().equals(password)&& user.getType().equals("admin")) {
                    System.out.println("Check sussess");
                        return user;
                }

                transaction.commit();
        }
        return null;
    }

    public static Users existUser(String email) {
        Transaction transaction = null;
        Users user = null;
        String query = "from Users U where U.email = :user_email";

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
                transaction = session.beginTransaction();
                user = (Users)session.createQuery(query).setParameter("user_email", email).uniqueResult();

                if (user != null) {
                        return user;
                }

                transaction.commit();
        }

        return null;
    }

    public static void resetPassword(String email, String password) {
        Transaction transaction = null;
        String query = "update Users set pass = :password where email = :email";

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

                transaction = session.beginTransaction();
                session.createQuery(query).setParameter("password", password).setParameter("email", email).executeUpdate();
                transaction.commit();

        } catch (Exception e) {
                if (transaction != null) {
                        transaction.rollback();
                }
                e.printStackTrace();
        }
    }

    public static void updateUser(Users user) {
        Transaction transaction = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

                transaction = session.beginTransaction();

                session.update(user);

                transaction.commit();

        } catch (Exception e) {
                if (transaction != null) {
                        transaction.rollback();
                }
                e.printStackTrace();
        }
    }

    public static void deleteUser(int id) {
        Transaction transaction = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

                transaction = session.beginTransaction();

                Users user = session.get(Users.class, id);
                if (user != null) {
                        session.delete(user);
                        System.out.println("User is deleted");
                }

                transaction.commit();

        } catch (Exception e) {
                if (transaction != null) {
                        transaction.rollback();
                }
                e.printStackTrace();
        }
    }

    public static Users getUser(int id) {
        Transaction transaction = null;
        Users user = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

                transaction = session.beginTransaction();

                user = session.get(Users.class, id);

                transaction.commit();

        } catch (Exception e) {
                if (transaction != null) {
                        transaction.rollback();
                }
                e.printStackTrace();
        }
        return user;
    }

    @SuppressWarnings("unchecked")
    public static List<Todo> getTodosByUser(int id) {
        Transaction transaction = null;
        List<Todo> listOfTodo = null;
        String query = "select U.todos from Users U where U.userid = :user_id";
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
                transaction = session.beginTransaction();
                listOfTodo = session.createQuery(query).setParameter("user_id", id).getResultList();
                transaction.commit();
        } catch (Exception e) {
                if (transaction != null) {
                        transaction.rollback();
                }
                e.printStackTrace();
        }
        return listOfTodo;
    }

    @SuppressWarnings("unchecked")
    public static List<Tag> getTagsByUser(int id) {
        Transaction transaction = null;
        List<Tag> listOfTag = null;
        String query = "select U.tags from Users U where U.userid = :user_id";
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
                transaction = session.beginTransaction();
                listOfTag = session.createQuery(query).setParameter("user_id", id).getResultList();
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
    public static List<Users> getAllUser() {
        Transaction transaction = null;
        List <Users> listOfUser = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

                transaction = session.beginTransaction();

                listOfUser = session.createQuery("from Users").getResultList();

                transaction.commit();

        } catch (Exception e) {
                if (transaction != null) {
                        transaction.rollback();
                }
                e.printStackTrace();
        }
        return listOfUser;

    }
    public static List<Users> getAllUserTypeUser() {
        Transaction transaction = null;
        List <Users> listOfUser = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

                transaction = session.beginTransaction();

                listOfUser = session.createQuery("from Users u where u.type='user'").getResultList();

                transaction.commit();

        } catch (Exception e) {
                if (transaction != null) {
                        transaction.rollback();
                }
                e.printStackTrace();
        }
        return listOfUser;
    }
}
