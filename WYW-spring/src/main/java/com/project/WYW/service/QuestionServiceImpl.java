package com.project.WYW.service;


import com.project.WYW.dao.QuestionDao;
import com.project.WYW.dto.QuestionDto;
import com.project.WYW.model.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    QuestionDao questionDao;

    @Override
    public int getCount() throws Exception {
        return questionDao.count();
    }

    @Override
    public int remove(Integer bno, String writer) throws Exception {
        return questionDao.delete(bno, writer);
    }
    @Override
    public int removeAdmin(Integer bno) throws Exception {
        return questionDao.deleteAdmin(bno);
    }

    @Override
    public int write(QuestionDto questionDto) throws Exception {
        return questionDao.insert(questionDto);
    }  // QuestionDto

    @Override
    public List<QuestionDto> getList() throws Exception {
        return questionDao.selectAll();
    }


    @Override
    public QuestionDto read(Integer bno) throws Exception {
        QuestionDto questionDto = questionDao.select(bno);
        questionDao.increaseViewCnt(bno);

        return questionDto;
    }

    @Override
    public List<QuestionDto> getPage(Map map) throws Exception {
        return questionDao.selectPage(map);
    }

    @Override
    public int modify(QuestionDto questionDto) throws Exception {
        return questionDao.update(questionDto);
    }

    @Override
    public int getSearchResultCnt(SearchCondition sc) throws Exception {
        return questionDao.searchResultCnt(sc);
    }

    @Override
    public List<QuestionDto> getSearchResultPage(SearchCondition sc) throws Exception {
        return questionDao.searchSelectPage(sc);
    }



}