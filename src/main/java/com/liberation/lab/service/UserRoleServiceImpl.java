package com.liberation.lab.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.liberation.lab.dao.UserRoleDAO;
import com.liberation.lab.model.UserRole;

public class UserRoleServiceImpl implements UserRoleService{

    private UserRoleDAO userRoleDAO;
    
    public void setUserRoleDAO(UserRoleDAO userRoleDAO) {
        this.userRoleDAO = userRoleDAO;
    }
 
    @Override
    @Transactional
    public void addUserRole(UserRole ur) {
        this.userRoleDAO.addUserRole(ur);
    }
 
    @Override
    @Transactional
    public void updateUserRole(UserRole ur) {
        this.userRoleDAO.updateUserRole(ur);
    }
 
    @Override
    @Transactional
    public List<UserRole> listUserRoles() {
        return this.userRoleDAO.listUserRoles();
    }
 
    @Override
    @Transactional
    public List<String> listUserRolesById(int id) {
        return this.userRoleDAO.listUserRolesById(id);
    }
 
    @Override
    @Transactional
    public UserRole getUserRoleById(int id) {
        return this.userRoleDAO.getUserRoleById(id);
    }
 
    @Override
    @Transactional
    public void removeUserRole(int id) {
        this.userRoleDAO.removeUserRole(id);
    }
 
    @Override
    @Transactional
    public void removeUserRoleByUserId(int id) {
        this.userRoleDAO.removeUserRoleByUserId(id);
    }
}
