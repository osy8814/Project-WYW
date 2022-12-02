package com.project.WYW.service;

import com.project.WYW.dto.NoticeDto;
import com.project.WYW.model.SearchCondition;

import java.util.List;
import java.util.Map;

public interface NoticeService {
    // List<BoardDto> getSearchSelectPage(SearchCondition sc) throws Exception;

    //int searchResultCnt(SearchCondition sc) throws Exception;

    int getCount() throws Exception;
    int remove(Integer bno, String writer) throws Exception;
    int write(NoticeDto noticeDto) throws Exception;
    List<NoticeDto> getList() throws Exception;
    NoticeDto read(Integer bno) throws Exception;
    List<NoticeDto> getPage(Map map) throws Exception;
    int modify(NoticeDto noticeDto) throws Exception;

    int getSearchResultCnt(SearchCondition sc) throws Exception;
    List<NoticeDto> getSearchResultPage(SearchCondition sc) throws Exception;
}