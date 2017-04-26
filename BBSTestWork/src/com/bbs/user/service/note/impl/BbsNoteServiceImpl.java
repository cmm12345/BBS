package com.bbs.user.service.note.impl;



import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import util.Page;

import com.bbs.user.bean.BbsNote;
import com.bbs.user.mapping.note.BbsNoteMapper;
import com.bbs.user.service.note.BbsNoteService;



@Service("bbsNoteService")
@Transactional  
public  class BbsNoteServiceImpl  implements BbsNoteService {
	
	@Autowired
	private BbsNoteMapper bbsNoteMapper;
	public void insert(BbsNote bbsNote) {
		bbsNoteMapper.insert(bbsNote);
	}
	public void update(BbsNote bbsNote) {
		bbsNoteMapper.updateByPrimaryKeySelective(bbsNote);
	}
	public Page<BbsNote> findAll(Page<BbsNote> page,BbsNote bbsNote) {
		bbsNote.setPage(page);
		page.setList(bbsNoteMapper.selectNoteList(bbsNote));
		return page;
	}
	public List<BbsNote> findList(BbsNote bbsNote){
		List<BbsNote> list=bbsNoteMapper.findList(bbsNote);
		return list;
	}
	public List<BbsNote> findHotList(BbsNote bbsNote){
		List<BbsNote> list=bbsNoteMapper.findHotList(bbsNote);
		return list;
	}
	public BbsNote findNoteById(BbsNote bbsNote){
		bbsNote=bbsNoteMapper.selectByPrimaryKey(bbsNote);
		return bbsNote;
	}
}
