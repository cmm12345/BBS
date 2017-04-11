package com.bbs.user.mapping.smallSection;

import java.util.List;

import com.bbs.user.bean.BbsSmallSection;

public interface BbsSmallSectionMapper {

    int insert(BbsSmallSection record);
    List<BbsSmallSection> selectSmallSectionList(BbsSmallSection bbsSmallSection);
    List<BbsSmallSection> findList(BbsSmallSection bbsSmallSection);
    int updateByPrimaryKeySelective(BbsSmallSection record);
}