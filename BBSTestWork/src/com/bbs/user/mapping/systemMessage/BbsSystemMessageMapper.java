package com.bbs.user.mapping.systemMessage;

import java.util.List;

import com.bbs.user.bean.BbsSystemMessage;

public interface BbsSystemMessageMapper {
    int updateByPrimaryKey(BbsSystemMessage bbsSystemMessage);

    int insert(BbsSystemMessage record);

    BbsSystemMessage selectByPrimaryId(BbsSystemMessage bbsSystemMessage);
    List<BbsSystemMessage> selectSystemMessageList(BbsSystemMessage bbsSystemMessage);
    
}