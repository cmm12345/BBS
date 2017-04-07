package com.bbs.user.service.bigSection.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import util.Page;

import com.bbs.user.bean.BbsBigSection;
import com.bbs.user.mapping.bigSection.BbsBigSectionMapper;
import com.bbs.user.service.bigSection.BbsBigSectionService;



@Service
@Transactional  
public  class BbsBigSectionServiceImpl  implements BbsBigSectionService {
	
	@Resource
	private BbsBigSectionMapper bbsBigSectionMapper;



	public BbsBigSection findById(BbsBigSection bbsBigSection) {
		List<BbsBigSection> bbsBigSectionList =bbsBigSectionMapper.selectBigSectionList(bbsBigSection);
		if(bbsBigSectionList!=null&&bbsBigSectionList.size()>0){
		 bbsBigSection = bbsBigSectionList.get(0);
		}
		return bbsBigSection;
	}

	public void insert(BbsBigSection bbsBigSection) {
		bbsBigSectionMapper.insert(bbsBigSection);
	}
	public void deleteByPrimaryKey(String bigSectionId) {
		bbsBigSectionMapper.deleteByPrimaryKey(bigSectionId);
	}
	
	public void update(BbsBigSection bbsBigSection) {
		 bbsBigSectionMapper.updateByPrimaryKeySelective(bbsBigSection);
	}
	public Page<BbsBigSection> findAll(Page<BbsBigSection> page,BbsBigSection bbsBigSection) {
		bbsBigSection.setPage(page);
		page.setList(bbsBigSectionMapper.selectBigSectionList(bbsBigSection));
		return page;
	}
}
