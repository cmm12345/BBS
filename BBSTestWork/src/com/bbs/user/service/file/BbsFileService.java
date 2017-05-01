package com.bbs.user.service.file;



import java.util.List;

import util.Page;

import com.bbs.user.bean.BbsFile;


public interface BbsFileService {
	void insert(BbsFile bbsFile);
	void update(BbsFile bbsFile);
	Page<BbsFile> findAll(Page<BbsFile> page,BbsFile bbsFile);
	List<BbsFile> findHotFileList(BbsFile bbsFile);
	BbsFile getFileById(BbsFile bbsFile);
	BbsFile findCensus();
}
