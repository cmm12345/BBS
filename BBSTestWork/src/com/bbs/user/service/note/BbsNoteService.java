package com.bbs.user.service.note;

import java.util.List;


import util.Page;

import com.bbs.user.bean.BbsNote;


public interface BbsNoteService {
	void insert(BbsNote bbsNote);
	void update(BbsNote bbsNote);
	Page<BbsNote> findAll(Page<BbsNote> page,BbsNote bbsNote);
    List<BbsNote> findList(BbsNote bbsNote);
    List<BbsNote> findHotList(BbsNote bbsNote);
    BbsNote findNoteById(BbsNote bbsNote);
}
