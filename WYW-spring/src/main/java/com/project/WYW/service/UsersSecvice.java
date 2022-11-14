package com.project.WYW.service;

import java.util.List;

import com.project.WYW.domain.UsersVo;

public interface UsersSecvice {

	int getCount() throws Exception;

	List<UsersVo> getList() throws Exception;

	UsersVo read(String user_id) throws Exception;

	int remove(String user_id, String email, String name) throws Exception;
	
	int singUp(UsersVo vo)throws Exception;

	UsersVo login(String user_id) throws Exception;

    int modify(UsersVo vo) throws Exception;

    UsersVo emailChk(String email) throws Exception;

	UsersVo mobileChk(String mobile) throws Exception;
}
