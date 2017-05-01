package com.bbs.user.mapping.note;

import java.util.List;

import com.bbs.user.bean.BbsNote;

public interface BbsNoteMapper {

    int insert(BbsNote record);
    BbsNote selectByPrimaryKey(BbsNote record);
    int updateByPrimaryKeySelective(BbsNote record);
    List<BbsNote> selectNoteList(BbsNote record);
    List<BbsNote> findList(BbsNote record);
    List<BbsNote> findHotList(BbsNote record);
    BbsNote findCensus();
}