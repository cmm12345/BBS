package com.bbs.user.service.user;

import java.util.List;


import util.Page;

import com.bbs.user.bean.BbsUser;


public interface BbsUserService {
	void insert(BbsUser bbsUser);
	boolean update(BbsUser bbsUser);
	BbsUser findById(String id);
	BbsUser getUserByNumber(BbsUser user);
	BbsUser getUserByNumberOrLxdh(BbsUser user);
	List<BbsUser> findAll(BbsUser bbsUser);
	Page<BbsUser> findList(Page<BbsUser> page,BbsUser bbsUser);
}
