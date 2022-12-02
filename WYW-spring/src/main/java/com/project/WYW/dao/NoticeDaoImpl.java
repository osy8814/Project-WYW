package com.project.WYW.dao;


import com.project.WYW.dto.NoticeDto;
import com.project.WYW.model.SearchCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class NoticeDaoImpl implements NoticeDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.project.WYW.mapper.noticeMapper.";

    public int count() throws Exception {
        return session.selectOne(namespace+"countNotice");
    } // T selectOne(String statement)

    @Override
    public int deleteAll() {
        return session.delete(namespace+"deleteAllNotice");
    } // int delete(String statement)

    @Override
    public int delete(Integer bno, String writer) throws Exception {
        Map map = new HashMap();
        map.put("bno", bno);
        map.put("writer", writer);
        return session.delete(namespace+"deleteNotice", map);
    } // int delete(String statement, Object parameter)

    public int insert(NoticeDto dto) throws Exception {
        return session.insert(namespace+"insertNotice", dto);
    }

    @Override
    public List<NoticeDto> selectAll() throws Exception {
        return session.selectList(namespace+"selectAllNotice");
    } // List<E> selectList(String statement)

    public NoticeDto select(Integer bno) throws Exception {
        return session.selectOne(namespace + "selectNotice", bno);
    } // T selectOne(String statement, Object parameter)

    @Override
    public List<NoticeDto> selectPage(Map map) throws Exception {
        return session.selectList(namespace+"selectPageNotice", map);
    } // List<E> selectList(String statement, Object parameter)

    @Override
    public int update(NoticeDto dto) throws Exception {
        return session.update(namespace+"updateNotice", dto);
    } // int update(String statement, Object parameter)

    @Override
    public int increaseViewCnt(Integer bno) throws Exception {
        return session.update(namespace+"increaseViewCntNotice", bno);
    } // int update(String statement, Object parameter)

    @Override
    public int searchResultCnt(SearchCondition sc) throws Exception {
        System.out.println("sc in searchResultCnt() = " + sc);
        System.out.println("session = " + session);
        return session.selectOne(namespace+"searchResultCntNotice", sc);
    } // T selectOne(String statement, Object parameter)

    @Override
    public int updateCommentCnt(Integer bno, int cnt) {
        Map map = new HashMap();
        map.put("cnt",cnt);
        map.put("bno",bno);
        return  session.update(namespace+"updateCommentCntNotice",map);
    }

    @Override
    public List<NoticeDto> searchSelectPage(SearchCondition sc) throws Exception {
        return session.selectList(namespace+"searchSelectPageNotice", sc);
    } // List<E> selectList(String statement, Object parameter)
}