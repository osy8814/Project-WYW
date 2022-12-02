package com.project.WYW.dao;

import com.project.WYW.dto.QuestionDto;
import com.project.WYW.model.SearchCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class QuestionDaoImpl implements QuestionDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.project.WYW.mapper.questionMapper.";

    public int count() throws Exception {
        return session.selectOne(namespace + "countQuestion");
    } // T selectOne(String statement)

    @Override
    public int deleteAll() {
        return session.delete(namespace + "deleteAllQuestion");
    } // int delete(String statement)

    @Override
    public int delete(Integer bno, String writer) throws Exception {
        Map map = new HashMap();
        map.put("bno", bno);
        map.put("writer", writer);
        return session.delete(namespace + "deleteQuestion", map);
    } // int delete(String statement, Object parameter)

    @Override
    public int deleteAdmin(Integer bno) throws Exception {
        return session.delete(namespace + "deleteQuestionAdmin", bno);
    } // int delete(String statement, Object parameter)


    public int insert(QuestionDto dto) throws Exception {
        return session.insert(namespace + "insertQuestion", dto);
    } // int insert(String statement, Object parameter)


    @Override
    public List<QuestionDto> selectAll() throws Exception {
        return session.selectList(namespace + "selectAllQuestion");
    } // List<E> selectList(String statement)


    public QuestionDto select(Integer bno) throws Exception {
        return session.selectOne(namespace + "selectQuestion", bno);
    } // T selectOne(String statement, Object parameter)


    @Override
    public List<QuestionDto> selectPage(Map map) throws Exception {
        return session.selectList(namespace + "selectPageQuestion", map);
    } // List<E> selectList(String statement, Object parameter)

    @Override
    public int update(QuestionDto dto) throws Exception {
        return session.update(namespace + "updateQuestion", dto);
    } // int update(String statement, Object parameter)

    @Override
    public int increaseViewCnt(Integer bno) throws Exception {
        return session.update(namespace + "increaseViewCntQuestion", bno);
    } // int update(String statement, Object parameter)

    @Override
    public int searchResultCnt(SearchCondition sc) throws Exception {
        return session.selectOne(namespace + "searchResultCntQuestion", sc);
    } // T selectOne(String statement, Object parameter)

    @Override
    public int updateCommentCnt(Integer bno, int cnt) {
        Map map = new HashMap();
        map.put("cnt", cnt);
        map.put("bno", bno);
        return session.update(namespace + "updateCommentCntQuestion", map);
    }

    @Override
    public List<QuestionDto> searchSelectPage(SearchCondition sc) throws Exception {
        return session.selectList(namespace + "searchSelectPageQuestion", sc);
    } // List<E> selectList(String statement, Object parameter)


}