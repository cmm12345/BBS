package com.bbs.user.service.replyNote.impl;



import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.bbs.user.bean.BbsReplyNote;
import com.bbs.user.mapping.replyNote.BbsReplyNoteMapper;
import com.bbs.user.service.replyNote.ReplyNoteService;



@Service("replyNoteService")
@Transactional  
public  class ReplyNoteServiceImpl  implements ReplyNoteService {
	
	@Autowired
	private BbsReplyNoteMapper bbsReplyNoteMapper;
	public void insert(BbsReplyNote bbsReplyNote) {
		bbsReplyNoteMapper.insert(bbsReplyNote);
	}
	public void update(BbsReplyNote bbsReplyNote) {
		bbsReplyNoteMapper.updateByPrimaryKeySelective(bbsReplyNote);
	}
	public List<BbsReplyNote> findList(BbsReplyNote bbsReplyNote){
		List<BbsReplyNote> list=bbsReplyNoteMapper.findList(bbsReplyNote);
		return list;
	}
	public BbsReplyNote findBbsReplyNoteById(BbsReplyNote bbsReplyNote){
          return 	bbsReplyNoteMapper.findBbsReplyNoteById(bbsReplyNote);	
	}
}
