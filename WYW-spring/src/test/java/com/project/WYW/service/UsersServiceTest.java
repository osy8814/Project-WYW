package com.project.WYW.service;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.WYW.dao.UsersDao;
import com.project.WYW.domain.UsersVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UsersServiceTest {

	@Autowired
	UsersSecvice usersSecvice;
	
	@Autowired
	UsersDao usersDao;
	
	@Test
	public void getListTest() throws Exception{
		usersDao.deleteAll();
		for (int i = 1; i <= 20; i++) {
			UsersVo usersVo = new UsersVo("id"+i, "name1", "1234", "aaa"+i+"@aaa.com", "010","1234","123"+i);
			usersSecvice.singUp(usersVo);
		}
		assertTrue(usersSecvice.getList().size()==20);
	}
	
	@Test
	public void insertTest()throws Exception{
		usersDao.deleteAll();
		assertTrue(usersSecvice.getList().size()==0);
		
		UsersVo usersVo = new UsersVo("id1", "name1", "1234", "aaa@aaa.com", "010","1234","1234");
		assertTrue(usersSecvice.singUp(usersVo)==1);
		
		String userId = usersDao.selectAll().get(0).getUserId();
		String email = usersDao.selectAll().get(0).getEmail();
	
		usersVo.setUserId(userId);
		usersVo.setEmail(email);
		UsersVo usersVo2 = usersSecvice.read(userId);
		
		assertTrue(usersVo.equals(usersVo2));
	}
	
	@Test
	public void modifyTest() throws Exception{
		usersDao.deleteAll();
		UsersVo usersVo = new UsersVo("id1", "name1", "1234", "aaa@aaa.com", "010","1234","1234");
		assertTrue(usersSecvice.singUp(usersVo)==1);
		
		UsersVo usersVo2 = new UsersVo("id2", "name2", "1234", "bbb@aaa.com", "010","1234","4321");
		assertTrue(usersSecvice.singUp(usersVo2)==1);

		assertTrue(usersSecvice.getList().size()==2);
		
		usersVo.setPassword("4321");
		assertTrue(usersSecvice.modify(usersVo)==1);
		assertTrue(usersSecvice.read(usersVo.getUserId()).equals(usersVo));

	}

	@Test
	public void removeTest() throws Exception {
		usersDao.deleteAll();
		
		UsersVo usersVo = new UsersVo("id1", "name1", "1234", "aaa@aaa.com", "010","1234","1234");
		assertTrue(usersSecvice.singUp(usersVo)==1);
		assertTrue(usersDao.selectAll().size()==1);
		
		String user_id = usersDao.selectAll().get(0).getUserId();
		String email = usersDao.selectAll().get(0).getEmail();
		String name = usersDao.selectAll().get(0).getName();
		
		UsersVo usersVo2 = new UsersVo("id2", "name1", "1234", "bbb@aaa.com", "010","4321","4321");
				
		assertTrue(usersSecvice.singUp(usersVo2)==1);
		assertTrue(usersSecvice.getCount()==2);
		
		assertTrue(usersSecvice.remove(user_id, email, name)==1);
		assertTrue(usersSecvice.getCount()==1);
	
		assertTrue(usersSecvice.remove(user_id, "bbb@aaa.com", "name1")!=1);
		assertTrue(usersSecvice.remove("id2", "bbb@aaa.com", "name1")==1);
		assertTrue(usersSecvice.getCount()==0);
	
	}
	
	

}
