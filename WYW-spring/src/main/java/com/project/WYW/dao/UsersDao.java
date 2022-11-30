package com.project.WYW.dao;

import com.project.WYW.domain.UsersVo;


import java.util.List;


public interface UsersDao {

	int count() throws Exception;

	List<UsersVo> selectAll() throws Exception;

	UsersVo select(String userId) throws Exception;

    UsersVo login(String userId) throws Exception;

    int deleteAll();

	int delete(String user_id, String email, String name) throws Exception;

	int insert(UsersVo dto) throws Exception;

	int update(UsersVo dto) throws Exception;


	int modifyUserInfo(UsersVo usersVo);

	UsersVo emailChk(String email) throws Exception;

	UsersVo mobileChk(String mobile) throws Exception;
}
