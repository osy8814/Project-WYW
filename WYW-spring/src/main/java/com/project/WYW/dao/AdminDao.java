package com.project.WYW.dao;

import com.project.WYW.domain.CategoryVo;

import java.util.List;

public interface AdminDao {
    List<CategoryVo> category() throws Exception;
}
