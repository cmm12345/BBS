package com.bbs.user.mapping.bigSection;

import java.util.List;

import com.bbs.user.bean.BbsBigSection;
public interface BbsBigSectionMapper {
    int deleteByPrimaryKey(String bigSectionId);

    int insert(BbsBigSection record);

    int insertSelective(BbsBigSection record);

    List<BbsBigSection> selectBigSectionList(BbsBigSection bbsBigSection);

    int updateByPrimaryKeySelective(BbsBigSection record);

    int updateByPrimaryKey(BbsBigSection record);
}