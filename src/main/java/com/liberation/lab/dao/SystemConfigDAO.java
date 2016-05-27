package com.liberation.lab.dao;

import java.util.List;

import com.liberation.lab.model.SystemConfig;

public interface SystemConfigDAO {

    public void addSystemConfig(SystemConfig u);
    public void updateSystemConfig(SystemConfig u);
    public List<SystemConfig> listSystemConfigs();
    public SystemConfig getSystemConfigById(int id);
    public void removeSystemConfig(int id);
}
