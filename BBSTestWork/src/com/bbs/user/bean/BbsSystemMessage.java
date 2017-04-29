package com.bbs.user.bean;

import java.util.Date;

import util.BaseEntity;

public class BbsSystemMessage extends BaseEntity<BbsSystemMessage>{
	/**
	 * 
	 */
	private static final long serialVersionUID = -334397389265739075L;
    private String messageId;

    private String messageNamae;

    private String messageContains;

    private Date cjsj;

    private String seeMessageUser;

    private String delFlag;

    private String res01;

    private String res02;

    private String res03;

    private String res04;

    private String res05;

    private Date res06;
    private String res07;
    public String getMessageId() {
        return messageId;
    }

    public void setMessageId(String messageId) {
        this.messageId = messageId == null ? null : messageId.trim();
    }

    public String getMessageNamae() {
        return messageNamae;
    }

    public void setMessageNamae(String messageNamae) {
        this.messageNamae = messageNamae == null ? null : messageNamae.trim();
    }

    public String getMessageContains() {
        return messageContains;
    }

    public void setMessageContains(String messageContains) {
        this.messageContains = messageContains == null ? null : messageContains.trim();
    }

    public Date getCjsj() {
        return cjsj;
    }

    public void setCjsj(Date cjsj) {
        this.cjsj = cjsj;
    }

    public String getSeeMessageUser() {
        return seeMessageUser;
    }

    public void setSeeMessageUser(String seeMessageUser) {
        this.seeMessageUser = seeMessageUser == null ? null : seeMessageUser.trim();
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

    public Date getRes06() {
        return res06;
    }

    public void setRes06(Date res06) {
        this.res06 = res06;
    }

	public String getRes07() {
		return res07;
	}

	public void setRes07(String res07) {
		this.res07 = res07;
	}
    
}