package com.project.WYW.service;

import java.util.List;

import com.project.WYW.domain.UsersVo;
import com.project.WYW.model.Pagehandler;

public interface UsersSecvice {

	int getCount(Pagehandler pagehandler) throws Exception;

	List<UsersVo> getList(Pagehandler pagehandler) throws Exception;

	UsersVo read(String userId) throws Exception;

	int remove(String userId, String email, String name) throws Exception;
	
	int singUp(UsersVo vo) throws Exception;

	UsersVo login(String userId) throws Exception;

    int modify(UsersVo vo) throws Exception;

    UsersVo emailChk(String email) throws Exception;

	UsersVo mobileChk(String mobile) throws Exception;

    String findId(UsersVo usersVo);

	String findPwd(UsersVo usersVo);
}
