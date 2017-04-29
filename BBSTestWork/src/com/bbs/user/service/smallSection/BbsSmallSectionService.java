package com.bbs.user.service.smallSection;

import java.util.List;

import util.Page;



import com.bbs.user.bean.BbsSmallSection;


public interface BbsSmallSectionService {
	void insert(BbsSmallSection bbsSmallSection);
	void update(BbsSmallSection bbsSmallSection);
	Page<BbsSmallSection> findAll(Page<BbsSmallSection> page,BbsSmallSection bbsSmallSection);
	List<BbsSmallSection> findList(BbsSmallSection bbsSmallSection);
	BbsSmallSection selectSmallSectionById(BbsSmallSection bbsSmallSection);
}
