package com.bbs.user.mapping.file;

import java.util.List;

import com.bbs.user.bean.BbsFile;

public interface BbsFileMapper {

    int insert(BbsFile record);
    BbsFile selectByPrimaryKey(BbsFile record);
    List<BbsFile> selectFileList(BbsFile record);
    int updateByPrimaryKeySelective(BbsFile record);
    List<BbsFile> findHotFileList(BbsFile record);
}