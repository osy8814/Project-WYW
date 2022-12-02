package com.project.WYW.dao;

import com.project.WYW.dto.NoticeDto;
import com.project.WYW.model.SearchCondition;

import java.util.List;
import java.util.Map;

public interface NoticeDao {
    int count() throws Exception // T selectOne(String statement)
    ;

    int deleteAll() // int delete(String statement)
    ;

    int delete(Integer bno, String writer) throws Exception // int delete(String statement, Object parameter)
    ;

    int insert(NoticeDto dto) throws Exception // int insert(String statement, Object parameter)
    ;

    List<NoticeDto> selectAll() throws Exception // List<E> selectList(String statement)
    ;

    NoticeDto select(Integer bno) throws Exception // T selectOne(String statement, Object parameter)
    ;

    List<NoticeDto> selectPage(Map map) throws Exception // List<E> selectList(String statement, Object parameter)
    ;

    int update(NoticeDto dto) throws Exception // int update(String statement, Object parameter)
    ;

    int increaseViewCnt(Integer bno) throws Exception // int update(String statement, Object parameter)
    ;


    List<NoticeDto> searchSelectPage(SearchCondition sc) throws Exception;
    int searchResultCnt(SearchCondition sc) throws Exception;


    int updateCommentCnt(Integer bno, int cnt);
}
