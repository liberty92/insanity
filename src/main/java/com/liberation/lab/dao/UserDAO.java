package com.liberation.lab.dao;

import java.util.List;

import com.liberation.lab.model.User;

public interface UserDAO {

    public void addUser(User u);
    public void updateUser(User u);
    public List<User> listUsers();
    public User getUserById(int id);
    public User getUserByUsername(String username);
    public void removeUser(int id);
}
