package com.liberation.lab.dao;

import java.util.List;

import com.liberation.lab.model.UserRole;

public interface UserRoleDAO {

    public void addUserRole(UserRole u);
    public void updateUserRole(UserRole a);
    public List<UserRole> listUserRoles();
    public List<String> listUserRolesById(int id);
    public UserRole getUserRoleById(int id);
    public void removeUserRole(int id);
    public void removeUserRoleByUserId(int id);
}
