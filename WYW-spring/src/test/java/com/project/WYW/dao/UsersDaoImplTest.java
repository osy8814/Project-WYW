package com.project.WYW.dao;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.WYW.dao.UsersDao;
import com.project.WYW.domain.UsersDto;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UsersDaoImplTest {

	@Autowired
	UsersDao usersDao;
	
	@Test
	public void deleteAllTest() throws Exception {
		usersDao.deleteAll();
		assertTrue(usersDao.count()==0);

		UsersDto usersDto = new UsersDto("id1", "name1", "1234", "aaa@aaa.com", "010-1234-1234");
		assertTrue(usersDao.insert(usersDto)==1);
		assertTrue(usersDao.deleteAll()==1);
		assertTrue(usersDao.count()==0);
		
		usersDto = new UsersDto("id1", "name1", "1234", "aaa@aaa.com", "010-1234-1234");
		assertTrue(usersDao.insert(usersDto)==1);
		usersDto = new UsersDto("id2", "name2", "1234", "bbb@aaa.com", "010-4321-4321");
		assertTrue(usersDao.deleteAll()==1);
		assertTrue(usersDao.count()==0);
	}
	
	@Test
    public void deleteTest() throws Exception {
        usersDao.deleteAll();
        assertTrue(usersDao.count()==0);

        UsersDto usersDto = new UsersDto("id1", "name1", "1234", "aaa@aaa.com", "010-1234-1234");
        assertTrue(usersDao.insert(usersDto)==1);
        String email = usersDao.selectAll().get(0).getEmail();
        assertTrue(usersDao.delete(usersDto.getUser_id() ,email, usersDto.getName())==1);
        assertTrue(usersDao.count()==0);

        assertTrue(usersDao.insert(usersDto)==1);
        String name = usersDao.selectAll().get(0).getName();
        assertTrue(usersDao.delete(usersDto.getUser_id(), usersDto.getEmail(), name)==1);
        assertTrue(usersDao.count()==0);

        assertTrue(usersDao.insert(usersDto)==1);
        name = usersDao.selectAll().get(0).getName();
        assertTrue(usersDao.delete(usersDto.getUser_id(), usersDto.getEmail(), name+"22")==0);
        assertTrue(usersDao.count()==1);
        
        assertTrue(usersDao.delete(usersDto.getUser_id(), usersDto.getEmail(), name)==1);
        assertTrue(usersDao.count()==0);
        
    }
	
	@Test
	public void selectAllTest() throws Exception {
		usersDao.deleteAll();
		assertTrue(usersDao.count()==0);
		
		List<UsersDto> list = usersDao.selectAll();
		assertTrue(list.size() == 0);
		
		UsersDto usersDto = new UsersDto("id1", "name1", "1234", "aaa@aaa.com", "010-1234-1234");
		assertTrue(usersDao.insert(usersDto)==1);
		
		list = usersDao.selectAll();
		assertTrue(list.size() == 1);
		
		usersDto = new UsersDto("id2", "name2", "1234", "bbb@aaa.com", "010-4321-4321");
		assertTrue(usersDao.insert(usersDto)==1);
		list = usersDao.selectAll();
		System.out.println("UserList : " + list);
		assertTrue(list.size() == 2);
	}
	
	@Test
    public void selectTest() throws Exception {
        usersDao.deleteAll();
        assertTrue(usersDao.count()==0);

		UsersDto usersDto = new UsersDto("id1", "name1", "1234", "aaa@aaa.com", "010-1234-1234");
        assertTrue(usersDao.insert(usersDto)==1);

        String user_id = usersDao.selectAll().get(0).getUser_id();
        usersDto.setUser_id(user_id);
        UsersDto usersDto2 = usersDao.select(user_id);
        System.out.println("usersDto : " + usersDto);
        System.out.println("usersDto2 : " + usersDto2);
        assertTrue(usersDto.equals(usersDto2));
    }
	
	@Test
	public void insertTest() throws Exception {
		
		usersDao.deleteAll();
		UsersDto usersDto = new UsersDto("id1", "name1", "1234", "aaa@aaa.com", "010-1234-1234");
		assertTrue(usersDao.insert(usersDto)==1);

	}
	
	@Test
	public void countTest() throws Exception {
		usersDao.deleteAll();
	    assertTrue(usersDao.count()==0);

		UsersDto usersDto = new UsersDto("id1", "name1", "1234", "aaa@aaa.com", "010-1234-1234");
	    assertTrue(usersDao.insert(usersDto)==1);
	    assertTrue(usersDao.count()==1);

	    usersDto = new UsersDto("id2", "name2", "1234", "bbb@aaa.com", "010-4321-4321");
	    assertTrue(usersDao.insert(usersDto)==1);
	    assertTrue(usersDao.count()==2);
	}
	
	@Test
    public void updateTest() throws Exception {
        usersDao.deleteAll();
		UsersDto usersDto = new UsersDto("id1", "name1", "1234", "aaa@aaa.com", "010-1234-1234");
        assertTrue(usersDao.insert(usersDto)==1);

        String user_id = usersDao.selectAll().get(0).getUser_id();
        System.out.println("user_id= " + user_id);
        usersDto.setPassword("4321");
        usersDto.setName("name3");
        usersDto.setMobile("010-4321-4321");
        usersDto.setEmail("bbb@aaa.com");
        usersDto.setAddress("Korea");
        
        assertTrue(usersDao.update(usersDto)==1);

        UsersDto usersDto2 = usersDao.select(user_id);
        System.out.println("usersDto : " + usersDto);
        System.out.println("usersDto2 : " + usersDto2);
        assertTrue(usersDto.equals(usersDto2));
    }
	 

}
