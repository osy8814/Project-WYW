package com.project.WYW.service;

import com.project.WYW.dao.AdminDao;
import com.project.WYW.domain.CategoryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public List<CategoryVo> category()throws Exception{
        return adminDao.category();
    }


}
