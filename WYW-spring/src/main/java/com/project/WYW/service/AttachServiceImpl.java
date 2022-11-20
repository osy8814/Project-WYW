package com.project.WYW.service;

import com.project.WYW.dao.AttachDao;
import com.project.WYW.model.AttachImageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AttachServiceImpl implements AttachService {

    @Autowired
    AttachDao attachDao;

    @Override
    public List<AttachImageVO> getAttachList(int product_id){

        return attachDao.gatAttachList(product_id);

    }

}
