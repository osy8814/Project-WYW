package com.project.WYW.service;

import java.util.List;

import com.project.WYW.domain.UsersVo;
import com.project.WYW.model.Pagehandler;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.WYW.dao.UsersDao;

@Service
@RequiredArgsConstructor
public class UsersServiceImpl implements UsersSecvice {

	@Autowired
	UsersDao usersDao;
	
	@Override
	public int getCount(Pagehandler pagehandler) throws Exception{
		return usersDao.count(pagehandler);
	}
	
	@Override
	public List<UsersVo> getList(Pagehandler pagehandler) throws Exception{
		return usersDao.selectAll(pagehandler);
	}
	
	@Override
	public UsersVo read(String userId) throws Exception{
		return usersDao.select(userId);
	}
	
	@Override
	public int remove(String userId, String email, String name) throws Exception{
		return usersDao.delete(userId, email, name);
	}
	
	@Override
	public int singUp(UsersVo vo) throws Exception{
		return usersDao.insert(vo);
	}

	@Override
	public UsersVo login(String userId) throws Exception{
		return usersDao.login(userId);
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

	@Override
	public String findId(UsersVo usersVo){
		UsersVo findUser = usersDao.findId(usersVo);
		if(findUser==null){
			return null;
		}
		String userId = findUser.getUserId();
		return userId;
	}

	@Override
	public String findPwd(UsersVo usersVo){
		UsersVo findUser = usersDao.findPwd(usersVo);
		if(findUser==null){
			return null;
		}
		String userPassword = findUser.getPassword();
		return userPassword;
	}

}
