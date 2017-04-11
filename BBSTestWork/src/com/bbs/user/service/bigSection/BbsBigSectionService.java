package com.bbs.user.service.bigSection;

import java.util.List;

import util.Page;

import com.bbs.user.bean.BbsBigSection;


public interface BbsBigSectionService {
	void insert(BbsBigSection bbsBigSection);
	void update(BbsBigSection bbsBigSection);
	Page<BbsBigSection> findAll(Page<BbsBigSection> page,BbsBigSection bbsBigSection);
    List<BbsBigSection> findList(BbsBigSection bbsBigSection);
}
