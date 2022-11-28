package com.project.WYW.service;

import com.project.WYW.dao.MypageDao;
import com.project.WYW.domain.UsersVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypageServiceImpl implements MypageService {

    @Autowired
    MypageDao mypageDao;

    @Override
    public int updateUserInfo(UsersVo usersVo)throws Exception{
        return mypageDao.updateUserInfo(usersVo);
    }

    @Override
    public UsersVo emailChk(String email) throws Exception{
        return mypageDao.emailChk(email);
    }
    @Override
    public UsersVo mobileChk(String mobile) throws Exception{
        return mypageDao.mobileChk(mobile);
    }
}
