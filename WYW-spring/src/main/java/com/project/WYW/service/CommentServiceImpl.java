package com.project.WYW.service;

import com.project.WYW.dao.BoardDao;
import com.project.WYW.dao.CommentDao;
import com.project.WYW.dto.CommentDto;
import com.project.WYW.model.CommentSearchCondition;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    BoardDao boardDao;
    CommentDao commentDao;

//    @Autowired
    public CommentServiceImpl(CommentDao commentDao, BoardDao boardDao) {
        this.commentDao = commentDao;
        this.boardDao = boardDao;
    }

    @Override
    public int getCount(Integer bno) throws Exception {
        return commentDao.count(bno);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int remove(Integer cno, Integer bno, String commenter) throws Exception {
        int rowCnt = commentDao.delete(cno, commenter);
        if(rowCnt!=1){
            throw new Exception("Comment delete fail");
        }

        boardDao.updateCommentCnt(bno, -1);

        return rowCnt;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int write(CommentDto commentDto) throws Exception {
        boardDao.updateCommentCnt(commentDto.getBno(), 1);
        return commentDao.insert(commentDto);
    }

    @Override
    public List<CommentDto> getList(Integer bno, CommentSearchCondition csc) throws Exception {
        return commentDao.selectAll(bno,csc);
    }

    @Override
    public CommentDto read(Integer cno) throws Exception {
        return commentDao.select(cno);
    }

    @Override
    public int modify(CommentDto commentDto) throws Exception {
        return commentDao.update(commentDto);
    }


}