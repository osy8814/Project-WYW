package com.project.WYW.dto;

import com.project.WYW.domain.ReplyVo;
import com.project.WYW.model.PageVo;

import java.util.List;

public class ReplyPageDto {

    List<ReplyVo> List;

    PageDto pageInfo;

    public java.util.List<ReplyVo> getList() {
        return List;
    }

    public void setList(java.util.List<ReplyVo> list) {
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
        return "ReplyPageDto{" +
                "List=" + List +
                ", pageInfo=" + pageInfo +
                '}';
    }
}
