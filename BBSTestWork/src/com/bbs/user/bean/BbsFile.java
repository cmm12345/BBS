package com.bbs.user.bean;

import java.util.Date;

import util.BaseEntity;

public class BbsFile extends BaseEntity<BbsFile>{
	/**
	 * 
	 */
	private static final long serialVersionUID = -334397389265739075L;
    private String fileId;

    private String userId;

    private String fileName;

    private String fileUrl;

    private String fileDescript;

    private String fileType;

    private Date cjsj;

    private String filePoint;

    private String delFlag;

    private String res01;

    private String res02;

    private String res03;

    private String res04;

    private String res05;

    private Date res06;

    public String getFileId() {
        return fileId;
    }

    public void setFileId(String fileId) {
        this.fileId = fileId == null ? null : fileId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName == null ? null : fileName.trim();
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl == null ? null : fileUrl.trim();
    }

    public String getFileDescript() {
        return fileDescript;
    }

    public void setFileDescript(String fileDescript) {
        this.fileDescript = fileDescript == null ? null : fileDescript.trim();
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType == null ? null : fileType.trim();
    }

    public Date getCjsj() {
        return cjsj;
    }

    public void setCjsj(Date cjsj) {
        this.cjsj = cjsj;
    }

    public String getFilePoint() {
        return filePoint;
    }

    public void setFilePoint(String filePoint) {
        this.filePoint = filePoint == null ? null : filePoint.trim();
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
}