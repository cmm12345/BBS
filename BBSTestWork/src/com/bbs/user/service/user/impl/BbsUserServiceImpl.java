package com.bbs.user.service.user.impl;

import java.util.List;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import util.Page;

import com.bbs.user.bean.BbsUser;
import com.bbs.user.mapping.user.BbsUserMapper;
import com.bbs.user.service.user.BbsUserService;



@Service
@Transactional  
public class BbsUserServiceImpl implements BbsUserService {
	
	@Resource
	private BbsUserMapper bbsUserMapper;


	public List<BbsUser> findAll(BbsUser bbsUser) {
		List<BbsUser> findAllList = bbsUserMapper.findAllUser(bbsUser);
		return findAllList;
	}
	/**
	 * 根据登录账号查询用户
	 */
	public BbsUser getUserByNumber(BbsUser user){
		BbsUser bbsUser=bbsUserMapper.getUserByNumber(user);
		return bbsUser;
	}
	/**
	 * 根据账号或电话号码查询用户
	 */
	public BbsUser getUserByNumberOrLxdh(BbsUser user){
		BbsUser bbsUser=bbsUserMapper.getUserByNumberOrLxdh(user);
		return bbsUser;
	}

	public BbsUser findById(String id) {
		
		BbsUser user = bbsUserMapper.selectByPrimaryKey(id);
		return user;
	}

	public void insert(BbsUser bbsUser) {
		bbsUserMapper.insert(bbsUser);
	}

	public boolean update(BbsUser bbsUser) {

		return bbsUserMapper.updateByPrimaryKeySelective(bbsUser);
	}
	public Page<BbsUser> findList(Page<BbsUser> page,BbsUser bbsUser) {
		bbsUser.setPage(page);
		page.setList(bbsUserMapper.findAllUser(bbsUser));
		return page;
	}
	

}
