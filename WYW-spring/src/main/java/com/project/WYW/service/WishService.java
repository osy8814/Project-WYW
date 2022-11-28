package com.project.WYW.service;

import com.project.WYW.model.WishVo;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface WishService {

    @Transactional(rollbackFor = RuntimeException.class)
    int addWish(WishVo wishVo);

    List<WishVo> getWishList(String userId);
}
