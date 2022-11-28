package com.project.WYW.service;

import com.project.WYW.domain.UsersVo;

public interface MypageService {
    int updateUserInfo(UsersVo usersVo)throws Exception;

    UsersVo emailChk(String email) throws Exception;

    UsersVo mobileChk(String mobile) throws Exception;
}
