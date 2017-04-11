package com.bbs.user.service.smallSection.impl;

import java.util.List;

import javax.annotation.Resource;



import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import util.Page;

import com.bbs.user.bean.BbsSmallSection;
import com.bbs.user.mapping.smallSection.BbsSmallSectionMapper;
import com.bbs.user.service.smallSection.BbsSmallSectionService;



@Service("bbsSmallSectionService")
@Transactional  
public  class BbsSmallSectionServiceImpl  implements BbsSmallSectionService {
	
	@Resource
	private BbsSmallSectionMapper bbsSmallSectionMapper;
	public void insert(BbsSmallSection bbsSmallSection) {
		bbsSmallSectionMapper.insert(bbsSmallSection);
	}
	public void update(BbsSmallSection bbsSmallSection) {
		bbsSmallSectionMapper.updateByPrimaryKeySelective(bbsSmallSection);
	}
	public Page<BbsSmallSection> findAll(Page<BbsSmallSection> page,BbsSmallSection bbsSmallSection) {
		bbsSmallSection.setPage(page);
		page.setList(bbsSmallSectionMapper.findList(bbsSmallSection));
		return page;
	}
	public List<BbsSmallSection> findList(BbsSmallSection bbsSmallSection) {
		List<BbsSmallSection> list=bbsSmallSectionMapper.selectSmallSectionList(bbsSmallSection);
		return list;
	}
}
