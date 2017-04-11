package com.bbs.user.mapping.bigSection;

import java.util.List;

import com.bbs.user.bean.BbsBigSection;
public interface BbsBigSectionMapper {

    int insert(BbsBigSection record);

    List<BbsBigSection> selectBigSectionList(BbsBigSection bbsBigSection);
    List<BbsBigSection> findList(BbsBigSection bbsBigSection);
    int updateByPrimaryKeySelective(BbsBigSection record);
}