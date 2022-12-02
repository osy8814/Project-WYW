package com.project.WYW.service;

import com.project.WYW.dao.NoticeDao;
import com.project.WYW.dto.NoticeDto;
import com.project.WYW.model.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	NoticeDao noticeDao;

	@Override
	public int getCount() throws Exception {
		return noticeDao.count();
	}

	@Override
	public int remove(Integer bno, String writer) throws Exception {
		return noticeDao.delete(bno, writer);
	}


	@Override
	public int write(NoticeDto noticeDto) throws Exception {
		return noticeDao.insert(noticeDto);
	}


	@Override
	public List<NoticeDto> getList() throws Exception {
		return noticeDao.selectAll();
	}

	@Override
	public NoticeDto read(Integer bno) throws Exception {
		NoticeDto noticeDto = noticeDao.select(bno);
		noticeDao.increaseViewCnt(bno);

		return noticeDto;
	}

	@Override
	public List<NoticeDto> getPage(Map map) throws Exception {
		return noticeDao.selectPage(map);
	}

	@Override
	public int modify(NoticeDto noticeDto) throws Exception {
		return noticeDao.update(noticeDto);
	}

	@Override
	public int getSearchResultCnt(SearchCondition sc) throws Exception {
		return noticeDao.searchResultCnt(sc);
	}

	@Override
	public List<NoticeDto> getSearchResultPage(SearchCondition sc) throws Exception {
		return noticeDao.searchSelectPage(sc);
	}
}
