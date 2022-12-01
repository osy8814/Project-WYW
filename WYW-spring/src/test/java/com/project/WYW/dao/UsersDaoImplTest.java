package com.project.WYW.dao;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.WYW.domain.UsersVo;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UsersDaoImplTest {

	@Autowired
	UsersDao usersDao;
	
	@Test
	public void deleteAllTest() throws Exception {
		usersDao.deleteAll();
		assertTrue(usersDao.count()==0);

		UsersVo usersVo = new UsersVo("id1", "name1", "1234", "aaa@aaa.com", "010","1234","1234");
		assertTrue(usersDao.insert(usersVo)==1);
		assertTrue(usersDao.deleteAll()==1);
		assertTrue(usersDao.count()==0);

		assertTrue(usersDao.insert(usersVo)==1);
		usersVo = new UsersVo("id2", "name2", "1234", "bbb@aaa.com", "010","4321","4321");
		assertTrue(usersDao.deleteAll()==1);
		assertTrue(usersDao.count()==0);
	}
	
	@Test
    public void deleteTest() throws Exception {
        usersDao.deleteAll();
        assertTrue(usersDao.count()==0);

		UsersVo usersVo = new UsersVo("id1", "name1", "1234", "aaa@aaa.com", "010","1234","1234");
        assertTrue(usersDao.insert(usersVo)==1);
		System.out.println("list" + usersDao.selectAll());
        String email = usersDao.selectAll().get(0).getEmail();
		System.out.println("getUserId = " + usersVo.getUserId());
		System.out.println("email = " + email);
		System.out.println("getName = " + usersVo.getName());
        assertTrue(usersDao.delete(usersVo.getUserId() ,email, usersVo.getName())==1);
        assertTrue(usersDao.count()==0);

        assertTrue(usersDao.insert(usersVo)==1);
        String name = usersDao.selectAll().get(0).getName();
        assertTrue(usersDao.delete(usersVo.getUserId(), usersVo.getEmail(), name)==1);
        assertTrue(usersDao.count()==0);

        assertTrue(usersDao.insert(usersVo)==1);
        name = usersDao.selectAll().get(0).getName();
        assertTrue(usersDao.delete(usersVo.getUserId(), usersVo.getEmail(), name+"22")==0);
        assertTrue(usersDao.count()==1);
        
        assertTrue(usersDao.delete(usersVo.getUserId(), usersVo.getEmail(), name)==1);
        assertTrue(usersDao.count()==0);
        
    }
	
	@Test
	public void selectAllTest() throws Exception {
		usersDao.deleteAll();
		assertTrue(usersDao.count()==0);
		
		List<UsersVo> list = usersDao.selectAll();
		assertTrue(list.size() == 0);
		
		UsersVo usersVo = new UsersVo("id1", "name1", "1234", "aaa@aaa.com", "010","1234","1234");
		assertTrue(usersDao.insert(usersVo)==1);
		
		list = usersDao.selectAll();
		assertTrue(list.size() == 1);
		
		usersVo = new UsersVo("id2", "name2", "1234", "bbb@aaa.com", "010","4321","4321");
		assertTrue(usersDao.insert(usersVo)==1);
		list = usersDao.selectAll();
		System.out.println("UserList : " + list);
		assertTrue(list.size() == 2);
	}
	
	@Test
    public void selectTest() throws Exception {
        usersDao.deleteAll();
        assertTrue(usersDao.count()==0);

		UsersVo usersVo = new UsersVo("id1", "name1", "1234", "aaa@aaa.com", "010","1234","1234");
        assertTrue(usersDao.insert(usersVo)==1);

        String userId = usersDao.selectAll().get(0).getUserId();
		System.out.println(usersDao.selectAll());
		usersVo.setUserId(userId);
		UsersVo usersVo2 = usersDao.select(userId);
        System.out.println("usersVo : " + usersVo);
        System.out.println("usersVo2 : " + usersVo2);
        assertTrue(usersVo.equals(usersVo2));
    }
	
	@Test
	public void insertTest() throws Exception {
		
		usersDao.deleteAll();
		UsersVo usersVo = new UsersVo("id1", "name1", "1234", "aaa@aaa.com", "010","1234","1234");
		System.out.println("usersVo = " + usersVo);
		assertTrue(usersDao.insert(usersVo)==1);

		//mobile중복
		usersVo = new UsersVo("id1", "name1", "1234", "aaa@aaa.com", "010","1234","1234");
		usersVo.setUserId("id2");
		usersVo.setEmail("bbb@bbb.com");
		assertTrue(usersDao.insert(usersVo)!=1);

		//email중복
		usersVo = new UsersVo("id1", "name1", "1234", "aaa@aaa.com", "010","1234","1234");
		usersVo.setUserId("id2");
		usersVo.setMobile1("010");
		usersVo.setMobile2("4321");
		usersVo.setMobile3("4321");
		assertTrue(usersDao.insert(usersVo)!=1);

		//id중복
		usersVo = new UsersVo("id1", "name1", "1234", "aaa@aaa.com", "010","1234","1234");
		usersVo.setMobile1("010");
		usersVo.setMobile2("4321");
		usersVo.setMobile3("4321");
		usersVo.setEmail("bbb@bbb.com");
		assertTrue(usersDao.insert(usersVo)!=1);

	}
	
	@Test
	public void countTest() throws Exception {
		usersDao.deleteAll();
	    assertTrue(usersDao.count()==0);

		UsersVo usersVo = new UsersVo("id1", "name1", "1234", "aaa@aaa.com", "010","1234","1234");
	    assertTrue(usersDao.insert(usersVo)==1);
	    assertTrue(usersDao.count()==1);

		usersVo = new UsersVo("id2", "name2", "1234", "bbb@aaa.com", "010","4321","4321");
	    assertTrue(usersDao.insert(usersVo)==1);
	    assertTrue(usersDao.count()==2);
	}
	
	@Test
    public void updateTest() throws Exception {
        usersDao.deleteAll();
		UsersVo usersVo = new UsersVo("id1", "name1", "1234", "aaa@aaa.com", "010","1234","1234");
        assertTrue(usersDao.insert(usersVo)==1);

        String user_id = usersDao.selectAll().get(0).getUserId();
        System.out.println("user_id= " + user_id);
        usersVo.setPassword("4321");
        usersVo.setName("name3");
        usersVo.setMobile1("010");
        usersVo.setMobile2("4321");
        usersVo.setMobile3("4321");
        usersVo.setEmail("bbb@aaa.com");

        assertTrue(usersDao.update(usersVo)==1);

		UsersVo usersVo2 = usersDao.select(user_id);
        System.out.println("usersVo : " + usersVo);
        System.out.println("usersVo2 : " + usersVo2);
        assertTrue(usersVo.equals(usersVo2));
    }

	@Test
	public void findIdTest(){
		UsersVo usersVo = new UsersVo();
		usersVo.setName("admin1");
		usersVo.setEmail("admin@admin.com");

		UsersVo findUser = usersDao.findId(usersVo);
		System.out.println("findUser = " + findUser);


	}

}
