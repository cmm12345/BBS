package com.bbs.user.service.file.impl;





import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import util.Page;

import com.bbs.user.bean.BbsFile;
import com.bbs.user.mapping.file.BbsFileMapper;
import com.bbs.user.service.file.BbsFileService;



@Service("bbsFileService")
@Transactional  
public  class BbsFileServiceImpl  implements BbsFileService {
	
	@Autowired
	private BbsFileMapper bbsFileMapper;
	public void insert(BbsFile bbsFile) {
		bbsFileMapper.insert(bbsFile);
	}
	public void update(BbsFile bbsFile) {
		bbsFileMapper.updateByPrimaryKeySelective(bbsFile);
	}
	public BbsFile getFileById(BbsFile bbsFile) {
		return bbsFileMapper.selectByPrimaryKey(bbsFile);
	}
	public Page<BbsFile> findAll(Page<BbsFile> page,BbsFile bbsFile) {
		bbsFile.setPage(page);
		page.setList(bbsFileMapper.selectFileList(bbsFile));
		return page;
	}
	public List<BbsFile> findHotFileList(BbsFile bbsFile){
		return bbsFileMapper.findHotFileList(bbsFile);
	}
}
