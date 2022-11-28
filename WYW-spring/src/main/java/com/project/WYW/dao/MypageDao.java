package com.project.WYW.dao;

import com.project.WYW.domain.UsersVo;

public interface MypageDao {
    int updateUserInfo(UsersVo usersVo)throws Exception;

    UsersVo emailChk(String email) throws Exception;

    UsersVo mobileChk(String mobile) throws Exception;
}
