package com.project.WYW.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.WYW.dao.UsersDao;
import com.project.WYW.domain.UsersDto;

@Service
public class UsersServiceImpl implements UsersSecvice {

	@Autowired
	UsersDao usersDao;
	
	@Override
	public int getCount() throws Exception{
		return usersDao.count();
	}
	
	@Override
	public List<UsersDto> getList() throws Exception{
		return usersDao.selectAll();
	}
	
	@Override
	public UsersDto read(String user_id)throws Exception{
		return usersDao.select(user_id);
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int remove(String user_id, String email, String name)throws Exception{
		return usersDao.delete(user_id, email, name);
	}
	
	@Override
	public int insert(UsersDto usersDto)throws Exception{
		return usersDao.insert(usersDto);
	}
	
	@Override
	public int modify(UsersDto usersDto)throws Exception{
		return usersDao.update(usersDto);
	}
}
