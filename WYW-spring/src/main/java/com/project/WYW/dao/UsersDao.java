package com.project.WYW.dao;

import com.project.WYW.domain.Users;
import com.project.WYW.domain.UsersDto;


import java.util.List;


public interface UsersDao {

	int count() throws Exception;

	List<UsersDto> selectAll() throws Exception;

	UsersDto select(String userId) throws Exception;

	int deleteAll();

	int delete(String user_id, String email, String name) throws Exception;

	int insert(UsersDto dto) throws Exception;

	int update(UsersDto dto) throws Exception;
}
