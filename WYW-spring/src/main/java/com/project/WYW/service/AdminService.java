package com.project.WYW.service;

import com.project.WYW.domain.CategoryVo;

import java.util.List;

public interface AdminService {
    List<CategoryVo> category()throws Exception;
}
