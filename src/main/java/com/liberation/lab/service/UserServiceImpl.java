package com.liberation.lab.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.liberation.lab.dao.UserDAO;
import com.liberation.lab.model.User;

public class UserServiceImpl implements UserService{

    private UserDAO userDAO;
    
    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }
 
    @Override
    @Transactional
    public void addUser(User u) {
        this.userDAO.addUser(u);
    }
 
    @Override
    @Transactional
    public void updateUser(User u) {
        this.userDAO.updateUser(u);
    }
 
    @Override
    @Transactional
    public List<User> listUsers() {
        return this.userDAO.listUsers();
    }
 
    @Override
    @Transactional
    public User getUserById(int id) {
        return this.userDAO.getUserById(id);
    }
 
    @Override
    @Transactional
    public void removeUser(int id) {
        this.userDAO.removeUser(id);
    }

	@Override
	@Transactional
	public User getUserByUsername(String username) {
		return this.userDAO.getUserByUsername(username);
	}
}
