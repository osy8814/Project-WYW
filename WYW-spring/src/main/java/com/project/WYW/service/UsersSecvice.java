package com.project.WYW.service;

import java.util.List;

import com.project.WYW.domain.Users;
import com.project.WYW.domain.UsersDto;

public interface UsersSecvice {

	int getCount() throws Exception;

	List<UsersDto> getList() throws Exception;

	UsersDto read(String user_id) throws Exception;

	int remove(String user_id, String email, String name) throws Exception;
	
	int singUp(UsersDto usersDto)throws Exception;

    int modify(UsersDto usersDto) throws Exception;
}
