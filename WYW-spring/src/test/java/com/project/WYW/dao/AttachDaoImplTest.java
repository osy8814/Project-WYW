package com.project.WYW.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class AttachDaoImplTest {

    @Autowired
    AttachDao attachDao;

    @Autowired

    @Test
    public void gatAttachList() throws Exception{

        int product_id = 49;

        System.out.println("이미지 정보 = " + attachDao.gatAttachList(product_id));

    }
}