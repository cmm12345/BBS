package com.bbs.user.service.systemMessage;



import util.Page;

import com.bbs.user.bean.BbsSystemMessage;


public interface BbsSystemMessageService {
	void insert(BbsSystemMessage bbsSystemMessage);
	Page<BbsSystemMessage> findAll(Page<BbsSystemMessage> page,BbsSystemMessage bbsSystemMessage);
	void updateByPrimaryKey(BbsSystemMessage bbsSystemMessage);
	BbsSystemMessage selectByPrimaryId(BbsSystemMessage bbsSystemMessage);
	
}
