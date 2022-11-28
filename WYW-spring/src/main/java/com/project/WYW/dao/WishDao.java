package com.project.WYW.dao;

import com.project.WYW.model.WishVo;

import java.util.List;

public interface WishDao {
    int addWish(WishVo wishVo);

    List<WishVo> getWish(String userId);

    WishVo checkWish(WishVo wishVo);
}
