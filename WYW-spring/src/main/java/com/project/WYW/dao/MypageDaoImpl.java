package com.project.WYW.dao;

import com.project.WYW.domain.UsersVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDaoImpl implements MypageDao {

    final int FAIL = 0;
    @Autowired
    private SqlSession session;

    private static String namespace = "com.project.WYW.mapper.mypageMapper.";

    @Override
    public int updateUserInfo(UsersVo usersVo)throws Exception{
        return session.update(namespace+"update",usersVo);
    }

    @Override
    public UsersVo emailChk(String email) throws Exception {
        return session.selectOne(namespace + "emailChk", email);
    }

    @Override
    public UsersVo mobileChk(String mobile) throws Exception {
        return session.selectOne(namespace + "mobileChk", mobile);
    }

}
