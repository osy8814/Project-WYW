package com.project.WYW.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.WYW.domain.UsersVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class UsersDaoImpl implements UsersDao {

	final int FAIL = 0;
	@Autowired
	private SqlSession session;
	private static String namespace="com.project.WYW.dao.usersMapper.";
	
	@Override
	public int count() throws Exception{
		return session.selectOne(namespace + "count");
	}
	
	@Override
	public List<UsersVo> selectAll() throws Exception{
		return session.selectList(namespace + "selectAll");
	}
	
	@Override
	public UsersVo select(String userId) throws Exception{
		return session.selectOne(namespace+"select", userId);
	}

	@Override
	public UsersVo login(String userId) throws Exception{
		return session.selectOne(namespace+"select", userId);
	}

	
	@Override
	public int deleteAll() {
        return session.delete(namespace+"deleteAll");
    }
	
	@Override
	public int delete(String userId, String email, String name) throws Exception {
        Map map = new HashMap();
        map.put("user_id", userId);
        map.put("email", email);
        map.put("name", name);
		int rowCnt;

		try {
		rowCnt = session.delete(namespace+"delete", map);

		}catch(Exception e){
			e.printStackTrace();
			return FAIL;
		}
        return rowCnt;
    }
	
	@Override
	public int insert(UsersVo vo) throws Exception {
		int rowCnt;

		try {
			rowCnt = session.insert(namespace+"insert", vo);
		}catch(Exception e){
			e.printStackTrace();
			return FAIL;
		}
        return rowCnt;
    }

	@Override
    public int update(UsersVo vo) throws Exception {
		int rowCnt;

		try {
			rowCnt = session.update(namespace+"update", vo);
		}catch(Exception e){
			e.printStackTrace();
			return FAIL;
		}
        return rowCnt;
    }

	@Override
	public UsersVo emailChk(String email) throws Exception{
		return session.selectOne(namespace+"emailChk", email);
	}

	@Override
	public UsersVo mobileChk(String mobile) throws Exception{
		return session.selectOne(namespace+"mobileChk", mobile);
	}
}
