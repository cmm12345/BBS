package com.bbs.user.bean;

import java.util.Date;

import util.BaseEntity;

public class BbsSmallSection extends BaseEntity<BbsSmallSection>{
	private static final long serialVersionUID = -334397389265739075L;
    private String smallSectionId;

    private String bigSectionId;

    private String smallSectionName;

    private Date cjsj;

    private String smallSectionDescript;

    private String delFlag;

    private String res01;

    private String res02;

    private String res03;

    private String res04;

    private String res05;

    private Date res06;

    private String userid;

    private String username;

    private String bigSectionName;

    public String getSmallSectionId() {
        return smallSectionId;
    }

    public void setSmallSectionId(String smallSectionId) {
        this.smallSectionId = smallSectionId == null ? null : smallSectionId.trim();
    }

    public String getBigSectionId() {
        return bigSectionId;
    }

    public void setBigSectionId(String bigSectionId) {
        this.bigSectionId = bigSectionId == null ? null : bigSectionId.trim();
    }

    public String getSmallSectionName() {
        return smallSectionName;
    }

    public void setSmallSectionName(String smallSectionName) {
        this.smallSectionName = smallSectionName == null ? null : smallSectionName.trim();
    }

    public Date getCjsj() {
        return cjsj;
    }

    public void setCjsj(Date cjsj) {
        this.cjsj = cjsj;
    }

    public String getSmallSectionDescript() {
        return smallSectionDescript;
    }

    public void setSmallSectionDescript(String smallSectionDescript) {
        this.smallSectionDescript = smallSectionDescript == null ? null : smallSectionDescript.trim();
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

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getBigSectionName() {
        return bigSectionName;
    }

    public void setBigSectionName(String bigSectionName) {
        this.bigSectionName = bigSectionName == null ? null : bigSectionName.trim();
    }

	public BbsSmallSection() {
		super();
	}

	public BbsSmallSection(String smallSectionId, String bigSectionId,
			String smallSectionName, Date cjsj, String smallSectionDescript,
			String delFlag, String res01, String res02, String res03,
			String res04, String res05, Date res06, String userid,
			String username, String bigSectionName) {
		super();
		this.smallSectionId = smallSectionId;
		this.bigSectionId = bigSectionId;
		this.smallSectionName = smallSectionName;
		this.cjsj = cjsj;
		this.smallSectionDescript = smallSectionDescript;
		this.delFlag = delFlag;
		this.res01 = res01;
		this.res02 = res02;
		this.res03 = res03;
		this.res04 = res04;
		this.res05 = res05;
		this.res06 = res06;
		this.userid = userid;
		this.username = username;
		this.bigSectionName = bigSectionName;
	}
    
}