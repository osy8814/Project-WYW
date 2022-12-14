package com.project.WYW.dto;

import com.project.WYW.domain.ReplyQnaVo;
import com.project.WYW.domain.ReplyVo;

import java.util.List;

public class ReplyQnaPageDto {

    List<ReplyQnaDto> List;

    PageDto pageInfo;

    public List<ReplyQnaDto> getList() {
        return List;
    }

    public void setList(List<ReplyQnaDto> list) {
        List = list;
    }

    public PageDto getPageInfo() {
        return pageInfo;
    }

    public void setPageInfo(PageDto pageInfo) {
        this.pageInfo = pageInfo;
    }

    @Override
    public String toString() {
        return "ReplyQnaPageDto{" +
                "List=" + List +
                ", pageInfo=" + pageInfo +
                '}';
    }
}
