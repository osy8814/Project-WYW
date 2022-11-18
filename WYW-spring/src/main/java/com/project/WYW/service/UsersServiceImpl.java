package com.project.WYW.service;

import java.util.List;

import com.project.WYW.domain.UsersVo;
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
	public List<UsersVo> getList() throws Exception{
		return usersDao.selectAll();
	}
	
	@Override
	public UsersVo read(String user_id) throws Exception{
		return usersDao.select(user_id);
	}
	
	@Override
	public int remove(String user_id, String email, String name) throws Exception{
		return usersDao.delete(user_id, email, name);
	}
	
	@Override
	public int singUp(UsersVo vo) throws Exception{
		return usersDao.insert(vo);
	}

	@Override
	public UsersVo login(String user_id) throws Exception{
		return usersDao.login(user_id);
	}
	
	@Override
	public int modify(UsersVo vo) throws Exception{
		return usersDao.update(vo);
	}

	@Override
	public UsersVo emailChk(String email) throws Exception{
		return usersDao.emailChk(email);
	}
	@Override
	public UsersVo mobileChk(String mobile) throws Exception{
		return usersDao.mobileChk(mobile);
	}

}
