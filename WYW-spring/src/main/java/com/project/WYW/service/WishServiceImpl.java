package com.project.WYW.service;

import com.project.WYW.dao.WishDao;
import com.project.WYW.model.AttachImageVO;
import com.project.WYW.model.WishVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class WishServiceImpl implements WishService {

    @Autowired
    WishDao wishDao;

    @Autowired
    AttachService attachService;

    @Transactional(rollbackFor = RuntimeException.class)
    @Override
    public int addWish(WishVo wishVo) {
        WishVo checkWish = wishDao.checkWish(wishVo);
        //장바구니에 있으면 해당상품이 있으면 2리턴
        if (checkWish != null) {
            return 2;
        }
        // 장바구니 등록 & 에러 시 0반환
        try {
            return wishDao.addWish(wishVo);
        } catch (Exception e) {
            return 0;
        }
    }

    @Override
    public List<WishVo> getWishList(String userId) {
        List<WishVo> wish = wishDao.getWish(userId);

        for (WishVo wishVo : wish) {

            int productId = wishVo.getProduct_id();

            List<AttachImageVO> imageVOList = attachService.getAttachList(productId);

            wishVo.setImageVOList(imageVOList);
        }
        return wish;
    }

    @Override
    public int deleteWish(Integer wishId){
        return wishDao.deleteWish(wishId);
    }
}
