package com.bbs.user.mapping.replyNote;

import java.util.List;

import com.bbs.user.bean.BbsReplyNote;

public interface BbsReplyNoteMapper {

    int insert(BbsReplyNote record);

    int updateByPrimaryKeySelective(BbsReplyNote record);
    List<BbsReplyNote> findList(BbsReplyNote record);
}