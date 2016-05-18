package com.liberation.lab.service;

import java.util.List;

import com.liberation.lab.model.UserRole;

public interface UserRoleService {

    public void addUserRole(UserRole u);
    public void updateUserRole(UserRole u);
    public List<UserRole> listUserRoles();
    public List<String> listUserRolesById(int id);
    public UserRole getUserRoleById(int id);
    public void removeUserRole(int id);
    public void removeUserRoleByUserId(int id);
}
