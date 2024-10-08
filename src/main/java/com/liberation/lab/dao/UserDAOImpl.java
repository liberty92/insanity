package com.liberation.lab.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.liberation.lab.model.User;

public class UserDAOImpl implements UserDAO {

    private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);
    
    private SessionFactory sessionFactory;
     
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }
 
    @Override
    public void addUser(User u) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(u);
        logger.info("User saved successfully, User Details="+u);
    }
 
    @Override
    public void updateUser(User u) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(u);
        logger.info("User updated successfully, User Details="+u);
    }
 
    @SuppressWarnings("unchecked")
    @Override
    public List<User> listUsers() {
        Session session = this.sessionFactory.getCurrentSession();
        List<User> usersList = session.createQuery("from User").list();
        for(User u : usersList){
            logger.info("User List::"+u);
        }
        return usersList;
    }
 
    @Override
    public User getUserById(int id) {
        Session session = this.sessionFactory.getCurrentSession();      
        User u = (User) session.get(User.class, new Integer(id));
        logger.info("User loaded successfully, User details="+u);
        return u;
    }
    @Override
    public User getUserByUsername(String username) {
        Session session = this.sessionFactory.getCurrentSession();  
        Query query = session.createQuery("from User where username =:username")
                .setParameter("username", username);
        User u = (User) query.uniqueResult();
        logger.info("User loaded successfully, User details="+u);
        return u;
    }
 
    @Override
    public void removeUser(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User u = (User) session.load(User.class, new Integer(id));
        if(null != u){
            session.delete(u);
        }
        logger.info("User deleted successfully, person details="+u);
    }
}
