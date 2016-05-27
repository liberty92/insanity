package com.liberation.lab.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.liberation.lab.dao.SystemConfigDAO;
import com.liberation.lab.model.SystemConfig;

public class SystemConfigServiceImpl implements SystemConfigService{

    private SystemConfigDAO systemConfigDAO;
    
    public void setSystemConfigDAO(SystemConfigDAO systemConfigDAO) {
        this.systemConfigDAO = systemConfigDAO;
    }
 
    @Override
    @Transactional
    public void addSystemConfig(SystemConfig u) {
        this.systemConfigDAO.addSystemConfig(u);
    }
 
    @Override
    @Transactional
    public void updateSystemConfig(SystemConfig u) {
        this.systemConfigDAO.updateSystemConfig(u);
    }
 
    @Override
    @Transactional
    public List<SystemConfig> listSystemConfigs() {
        return this.systemConfigDAO.listSystemConfigs();
    }
 
    @Override
    @Transactional
    public SystemConfig getSystemConfigById(int id) {
        return this.systemConfigDAO.getSystemConfigById(id);
    }
 
    @Override
    @Transactional
    public void removeSystemConfig(int id) {
        this.systemConfigDAO.removeSystemConfig(id);
    } 
}
