package com.liberation.lab.service;

import java.util.List;

import com.liberation.lab.model.SystemConfig;

public interface SystemConfigService {

    public void addSystemConfig(SystemConfig u);
    public void updateSystemConfig(SystemConfig u);
    public List<SystemConfig> listSystemConfigs();
    public SystemConfig getSystemConfigById(int id);
    public void removeSystemConfig(int id);
}
