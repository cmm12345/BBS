package com.bbs.user.service.systemMessage.impl;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import util.Page;

import com.bbs.user.bean.BbsSystemMessage;
import com.bbs.user.mapping.systemMessage.BbsSystemMessageMapper;
import com.bbs.user.service.systemMessage.BbsSystemMessageService;



@Service("bbsSystemMessageService")
@Transactional  
public  class BbsSystemMessageServiceImpl  implements BbsSystemMessageService {
	
	@Autowired
	private BbsSystemMessageMapper bbsSystemMessageMapper;
	public void insert(BbsSystemMessage bbsSystemMessage) {
		bbsSystemMessageMapper.insert(bbsSystemMessage);
	}
	public Page<BbsSystemMessage> findAll(Page<BbsSystemMessage> page,BbsSystemMessage bbsSystemMessage) {
		bbsSystemMessage.setPage(page);
		page.setList(bbsSystemMessageMapper.selectSystemMessageList(bbsSystemMessage));
		return page;
	}
	public void updateByPrimaryKey(BbsSystemMessage bbsSystemMessage) {
		bbsSystemMessageMapper.updateByPrimaryKey(bbsSystemMessage);
	}
	public  BbsSystemMessage selectByPrimaryId(BbsSystemMessage bbsSystemMessage){
		return bbsSystemMessageMapper.selectByPrimaryId(bbsSystemMessage);
	}
}
