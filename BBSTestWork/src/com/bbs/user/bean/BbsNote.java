package com.bbs.user.bean;

import java.util.Date;

import util.BaseEntity;

public class BbsNote extends BaseEntity<BbsNote>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -334397389265739075L;
    private String noteId;

    private String userId;

    private String noteName;

    private String bigSectionId;

    private String smallSectionId;

    private String noteContains;

    private Date noteDate;

    private String noteState;

    private String noteBz;

    private String noteDzs;

    private String noteAnswerNum;

    private String noteYnHot;

    private String delFlag;

    private String res01;

    private String res02;

    private String res03;

    private String res04;

    private String res05;
    private String res06;
    private String res07;
    private String res08;
    private String res09;
    private String res10;

    public String getNoteId() {
        return noteId;
    }

    public void setNoteId(String noteId) {
        this.noteId = noteId == null ? null : noteId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getNoteName() {
        return noteName;
    }

    public void setNoteName(String noteName) {
        this.noteName = noteName == null ? null : noteName.trim();
    }

    public String getBigSectionId() {
        return bigSectionId;
    }

    public void setBigSectionId(String bigSectionId) {
        this.bigSectionId = bigSectionId == null ? null : bigSectionId.trim();
    }

    public String getSmallSectionId() {
        return smallSectionId;
    }

    public void setSmallSectionId(String smallSectionId) {
        this.smallSectionId = smallSectionId == null ? null : smallSectionId.trim();
    }

    public String getNoteContains() {
        return noteContains;
    }

    public void setNoteContains(String noteContains) {
        this.noteContains = noteContains == null ? null : noteContains.trim();
    }

    public Date getNoteDate() {
        return noteDate;
    }

    public void setNoteDate(Date noteDate) {
        this.noteDate = noteDate;
    }

    public String getNoteState() {
        return noteState;
    }

    public void setNoteState(String noteState) {
        this.noteState = noteState == null ? null : noteState.trim();
    }

    public String getNoteBz() {
        return noteBz;
    }

    public void setNoteBz(String noteBz) {
        this.noteBz = noteBz == null ? null : noteBz.trim();
    }

    public String getNoteDzs() {
        return noteDzs;
    }

    public void setNoteDzs(String noteDzs) {
        this.noteDzs = noteDzs == null ? null : noteDzs.trim();
    }

    public String getNoteAnswerNum() {
        return noteAnswerNum;
    }

    public void setNoteAnswerNum(String noteAnswerNum) {
        this.noteAnswerNum = noteAnswerNum == null ? null : noteAnswerNum.trim();
    }

    public String getNoteYnHot() {
        return noteYnHot;
    }

    public void setNoteYnHot(String noteYnHot) {
        this.noteYnHot = noteYnHot == null ? null : noteYnHot.trim();
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag == null ? null : delFlag.trim();
    }

    public String getRes01() {
        return res01;
    }

    public void setRes01(String res01) {
        this.res01 = res01 == null ? null : res01.trim();
    }

    public String getRes02() {
        return res02;
    }

    public void setRes02(String res02) {
        this.res02 = res02 == null ? null : res02.trim();
    }

    public String getRes03() {
        return res03;
    }

    public void setRes03(String res03) {
        this.res03 = res03 == null ? null : res03.trim();
    }

    public String getRes04() {
        return res04;
    }

    public void setRes04(String res04) {
        this.res04 = res04 == null ? null : res04.trim();
    }

    public String getRes05() {
        return res05;
    }

    public void setRes05(String res05) {
        this.res05 = res05 == null ? null : res05.trim();
    }

	public String getRes06() {
		return res06;
	}

	public void setRes06(String res06) {
		this.res06 = res06;
	}

	public String getRes07() {
		return res07;
	}

	public void setRes07(String res07) {
		this.res07 = res07;
	}

	public String getRes08() {
		return res08;
	}

	public void setRes08(String res08) {
		this.res08 = res08;
	}

	public String getRes09() {
		return res09;
	}

	public void setRes09(String res09) {
		this.res09 = res09;
	}

	public String getRes10() {
		return res10;
	}

	public void setRes10(String res10) {
		this.res10 = res10;
	}
    
}