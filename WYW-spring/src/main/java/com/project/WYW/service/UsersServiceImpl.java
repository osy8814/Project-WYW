package com.project.WYW.service;

import java.util.List;

import com.project.WYW.domain.UsersDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.project.WYW.dao.UsersDao;

@Service
@RequiredArgsConstructor
public class UsersServiceImpl implements UsersSecvice {

	final UsersDao usersDao;
	
	@Override
	public int getCount() throws Exception{
		return usersDao.count();
	}
	
	@Override
	public List<UsersDto> getList() throws Exception{
		return usersDao.selectAll();
	}
	
	@Override
	public UsersDto read(String user_id) throws Exception{
		return usersDao.select(user_id);
	}
	
	@Override
	public int remove(String user_id, String email, String name) throws Exception{
		return usersDao.delete(user_id, email, name);
	}
	
	@Override
	public int singUp(UsersDto usersDto) throws Exception{
		return usersDao.insert(usersDto);
	}

	@Override
	public UsersDto login(String user_id) throws Exception{
		return usersDao.login(user_id);
	}
	
	@Override
	public int modify(UsersDto usersDto) throws Exception{
		return usersDao.update(usersDto);
	}

	@Override
	public UsersDto emailChk(String email) throws Exception{
		return usersDao.emailChk(email);
	}
	@Override
	public UsersDto mobileChk(String mobile) throws Exception{
		return usersDao.mobileChk(mobile);
	}
}
