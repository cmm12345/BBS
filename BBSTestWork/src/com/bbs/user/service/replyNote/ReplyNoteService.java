package com.bbs.user.service.replyNote;

import java.util.List;



import com.bbs.user.bean.BbsReplyNote;


public interface ReplyNoteService {
	void insert(BbsReplyNote bbsReplyNote);
	void update(BbsReplyNote bbsReplyNote);
    List<BbsReplyNote> findList(BbsReplyNote bbsReplyNote);
    BbsReplyNote findBbsReplyNoteById(BbsReplyNote bbsReplyNote);
}
