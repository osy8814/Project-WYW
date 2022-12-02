package com.project.WYW.dao;


import com.project.WYW.dto.QuestionDto;
import com.project.WYW.model.SearchCondition;

import java.util.List;
import java.util.Map;

public interface QuestionDao {

    int count() throws Exception // T selectOne(String statement)
    ;

    int deleteAll() // int delete(String statement)
    ;

    int delete(Integer bno, String writer) throws Exception // int delete(String statement, Object parameter)
    ;

    int deleteAdmin(Integer bno) throws Exception // int delete(String statement, Object parameter)
    ;

    int insert(QuestionDto dto) throws Exception // int insert(String statement, Object parameter)
    ;

    List<QuestionDto> selectAll() throws Exception // List<E> selectList(String statement)
    ;

    QuestionDto select(Integer bno) throws Exception // T selectOne(String statement, Object parameter)
    ;

    List<QuestionDto> selectPage(Map map) throws Exception // List<E> selectList(String statement, Object parameter)
    ;

    int update(QuestionDto dto) throws Exception // int update(String statement, Object parameter)
    ;

    int increaseViewCnt(Integer bno) throws Exception // int update(String statement, Object parameter)
    ;


    List<QuestionDto> searchSelectPage(SearchCondition sc) throws Exception;
    int searchResultCnt(SearchCondition sc) throws Exception;


    int updateCommentCnt(Integer bno, int cnt);





}
