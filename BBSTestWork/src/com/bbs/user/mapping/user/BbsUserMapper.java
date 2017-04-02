package com.bbs.user.mapping.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bbs.user.bean.BbsUser;


public interface BbsUserMapper {

    void insert(BbsUser bbsUser);

    void insertSelective(BbsUser bbsUser);

    BbsUser selectByPrimaryKey(String userId);
    List<BbsUser> findAll();

    boolean updateByPrimaryKeySelective(BbsUser record);

    void updateByPrimaryKey(BbsUser record);
    /**
     * 根据账号查询用户
     * @param userLoginnumber
     * @return
     */
    BbsUser getUserByNumber(BbsUser bbsUser);
    /**
     * 
     */
    BbsUser getUserByNumberOrLxdh (BbsUser bbsUser);
}