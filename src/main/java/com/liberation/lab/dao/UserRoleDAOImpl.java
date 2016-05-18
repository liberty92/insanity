package com.liberation.lab.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.liberation.lab.model.User;
import com.liberation.lab.model.UserRole;

public class UserRoleDAOImpl implements UserRoleDAO {

	private static final Logger logger = LoggerFactory.getLogger(UserRoleDAOImpl.class);

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}

	@Override
	public void addUserRole(UserRole ur) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(ur);
		logger.info("UserRole saved successfully, UserRole Details=" + ur);
	}

	@Override
	public void updateUserRole(UserRole ur) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(ur);
		logger.info("UserRole updated successfully, UserRole Details=" + ur);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserRole> listUserRoles() {
		Session session = this.sessionFactory.getCurrentSession();
		List<UserRole> userRolesList = session.createQuery("from UserRole").list();
		for (UserRole ur : userRolesList) {
			logger.info("UserRole List::" + ur);
		}
		return userRolesList;
	}

	@Override
	public List<String> listUserRolesById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		List<String> userRolesList = session.createQuery("select userRole from UserRole where userId =:id")
				.setParameter("id", id).list();
		for (String ur : userRolesList) {
			logger.info("UserRole List::" + ur);
		}
		return userRolesList;
	}

	@Override
	public UserRole getUserRoleById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		UserRole ur = (UserRole) session.get(UserRole.class, new Integer(id));
		logger.info("UserRole loaded successfully, UserRole details=" + ur);
		return ur;
	}

	@Override
	public void removeUserRole(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		UserRole ur = (UserRole) session.load(UserRole.class, new Integer(id));
		if (null != ur) {
			session.delete(ur);
		}
		logger.info("UserRole deleted successfully, person details=" + ur);
	}

	@Override
	public void removeUserRoleByUserId(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		List<UserRole> userRolesList = session.createQuery("from UserRole where userId =:id").setParameter("id", id).list();
		for (UserRole ur : userRolesList) {
			session.delete(ur);
			logger.info("UserRole List::" + ur);
		}
	}
}
