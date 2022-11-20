package com.project.WYW.dao;

import com.project.WYW.model.AttachImageVO;

import java.util.List;

public interface AttachDao {
    List<AttachImageVO> gatAttachList(int id);
}
