package com.project.WYW.service;

import com.project.WYW.dto.BoardDto;
import com.project.WYW.model.SearchCondition;

import java.util.*;

public interface BoardService {
   // List<BoardDto> getSearchSelectPage(SearchCondition sc) throws Exception;

    //int searchResultCnt(SearchCondition sc) throws Exception;

    int getCount() throws Exception;
    int remove(Integer bno, String writer) throws Exception;
    int write(BoardDto boardDto) throws Exception;
    List<BoardDto> getList() throws Exception;
    BoardDto read(Integer bno) throws Exception;
    List<BoardDto> getPage(Map map) throws Exception;
    int modify(BoardDto boardDto) throws Exception;

    int getSearchResultCnt(SearchCondition sc) throws Exception;
    List<BoardDto> getSearchResultPage(SearchCondition sc) throws Exception;
}