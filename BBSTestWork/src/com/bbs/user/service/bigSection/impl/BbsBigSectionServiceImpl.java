package com.bbs.user.service.bigSection.impl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import util.Page;

import com.bbs.user.bean.BbsBigSection;
import com.bbs.user.mapping.bigSection.BbsBigSectionMapper;
import com.bbs.user.service.bigSection.BbsBigSectionService;



@Service("bbsBigSectionService")
@Transactional  
public  class BbsBigSectionServiceImpl  implements BbsBigSectionService {
	
	@Autowired
	private BbsBigSectionMapper bbsBigSectionMapper;
	public void insert(BbsBigSection bbsBigSection) {
		bbsBigSectionMapper.insert(bbsBigSection);
	}
	public void update(BbsBigSection bbsBigSection) {
		 bbsBigSectionMapper.updateByPrimaryKeySelective(bbsBigSection);
	}
	public Page<BbsBigSection> findAll(Page<BbsBigSection> page,BbsBigSection bbsBigSection) {
		bbsBigSection.setPage(page);
		page.setList(bbsBigSectionMapper.selectBigSectionList(bbsBigSection));
		return page;
	}
	public List<BbsBigSection> findList(BbsBigSection bbsBigSection){
		List<BbsBigSection> list=bbsBigSectionMapper.findList(bbsBigSection);
		return list;
	}
	
}
