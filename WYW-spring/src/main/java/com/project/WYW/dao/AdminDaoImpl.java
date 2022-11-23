package com.project.WYW.dao;

import com.project.WYW.domain.CategoryVo;
import com.project.WYW.domain.ProductsViewVo;
import com.project.WYW.domain.ProductsVo;
import com.project.WYW.model.AttachImageVO;
import com.project.WYW.model.Pagehandler;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class AdminDaoImpl implements AdminDao {

    @Autowired
    private SqlSession session;

    final int FAIL = 0;

    private static String namespace = "com.project.WYW.mapper.adminMapper.";

    @Override
    public List<CategoryVo> category() throws Exception {

        return session.selectList(namespace + "category");
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public int regProduct(ProductsVo productsVo) throws Exception {

        int rowCnt = session.insert(namespace + "regProduct", productsVo);

        if (productsVo.getImageVOList() != null) {
            rowCnt = regProductImage(productsVo);
            if(rowCnt==FAIL){
                throw new RuntimeException("이미지 저장에 실패하였습니다.");
            }
        }

        return rowCnt;


    }

    @Override
    public List<ProductsVo> productsList() throws Exception {
        return session.selectList(namespace + "productsList");
    }

    @Override
    public List<ProductsViewVo> productsViewList(Pagehandler pagehandler) throws Exception {
        return session.selectList(namespace + "productsViewList", pagehandler);
    }

    @Override
    public int productsGetTotal(Pagehandler pagehandler) throws Exception {
        return session.selectOne(namespace + "productsGetTotal", pagehandler);
    }

    @Override
    public ProductsViewVo readProduct(Integer id) throws Exception {
        return session.selectOne(namespace + "productsView", id);
    }

    @Override
    public int deleteProduct(Integer id) throws Exception {

        int rowCnt;

        try {
            rowCnt = session.delete(namespace + "deleteProduct", id);
            return rowCnt;
        } catch (Exception e) {
            e.printStackTrace();
            rowCnt = FAIL;
        }
        return rowCnt;
    }

    @Transactional(rollbackFor = RuntimeException.class)
    @Override
    public int modifiyProduct(ProductsVo productsVo) throws Exception {

        int rowCnt = session.update(namespace + "modifiyProduct", productsVo);
        System.out.println(productsVo.getImageVOList() != null);
        if (productsVo.getImageVOList() != null) {
            session.delete(namespace + "deleteImageAll", productsVo.getId());

            rowCnt = regProductImage(productsVo);
            if (rowCnt == FAIL) {
                throw new RuntimeException("이미지 저장에 실패하였습니다.");
            }
        }
        return rowCnt;
    }

    @Override
    public int deleteAllProducts() throws Exception {
        return session.delete(namespace + "deleteAllProduct");
    }

    @Override
    public int imgReg(AttachImageVO attachImageVO) throws Exception {
        System.out.println("attachImageVO = " + attachImageVO);
        int rowCnt;
        try {
            rowCnt = session.insert(namespace + "imageReg", attachImageVO);
            return rowCnt;
        } catch (Exception e) {
            e.printStackTrace();
            rowCnt = FAIL;
        }
        return rowCnt;
    }

    @Override
    public int deleteImageAll(Integer product_id) throws Exception {
        return session.delete(namespace + "deleteImageAll", product_id);
    }

    @Override
    public List<AttachImageVO> getAttachInfo(Integer product_id) {
        return session.selectList(namespace + "getAttachInfo", product_id);
    }

    public int regProductImage(ProductsVo productsVo) {
        int rowCnt=0;
        for (int i = 0; i < productsVo.getImageVOList().size(); i++) {

            AttachImageVO attachImageVO = productsVo.getImageVOList().get(i);
            attachImageVO.setProduct_id(productsVo.getId());

            if (attachImageVO.getFile_name().split(",").length > 1) {

                String[] uploadPathList = attachImageVO.getUpload_path().split(",");
                String[] uuidList = attachImageVO.getUuid().split(",");
                String[] fileNameList = attachImageVO.getFile_name().split(",");

                for (int j = 0; j < uploadPathList.length; j++) {
                    attachImageVO.setUpload_path(uploadPathList[j]);
                    attachImageVO.setUuid(uuidList[j]);
                    attachImageVO.setFile_name(fileNameList[j]);

                    System.out.println("attachImageVO 리스트로 저장 = " + attachImageVO);
                    rowCnt = session.insert(namespace + "imageReg", attachImageVO);
                }
            } else {
                System.out.println("attachImageVO = " + attachImageVO);
                rowCnt = session.insert(namespace + "imageReg", attachImageVO);

            }

        }
        return rowCnt;
    }


}
