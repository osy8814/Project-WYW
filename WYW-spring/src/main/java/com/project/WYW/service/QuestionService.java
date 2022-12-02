package com.project.WYW.service;

import com.project.WYW.dto.QuestionDto;
import com.project.WYW.model.SearchCondition;

import java.util.List;
import java.util.Map;

public interface QuestionService {

    int getCount() throws Exception;
    int remove(Integer bno, String writer) throws Exception;

    int removeAdmin(Integer bno) throws Exception;
    int write(QuestionDto questionDto) throws Exception;
    List<QuestionDto> getList() throws Exception;
    QuestionDto read(Integer bno) throws Exception;
    List<QuestionDto> getPage(Map map) throws Exception;
    int modify(QuestionDto questionDto) throws Exception;

    int getSearchResultCnt(SearchCondition sc) throws Exception;
    List<QuestionDto> getSearchResultPage(SearchCondition sc) throws Exception;


}