package com.project.WYW.dao;

import java.util.List;

import com.project.WYW.domain.UsersDto;

public interface UsersDao {

	int count() throws Exception;

	List<UsersDto> selectAll() throws Exception;

	UsersDto select(String user_id) throws Exception;

	int deleteAll();

	int delete(String user_id, String email, String name) throws Exception;

	int insert(UsersDto dto) throws Exception;

	int update(UsersDto dto) throws Exception;


}