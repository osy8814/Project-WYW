package com.project.WYW.service;

import com.project.WYW.model.AttachImageVO;

import java.util.List;

public interface AttachService {
    List<AttachImageVO> getAttachList(int product_id);
}
