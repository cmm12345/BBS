package com.bbs.user.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import util.BaseEntity;
public class BbsUser extends BaseEntity<BbsUser> {
    /**
	 * 
	 */
	private static final long serialVersionUID = -334397389265739075L;

	private String userId;

    private String userName;

    private String userLoginnumber;

    private String userPassword;
    private Date userBornDate;

    private String userPicture;

    private String userAddress;

    private String userLxdh;

    private String userEmail;

    private String userPoint;

    private String delFlag;

    private Date userRegisterDate;

    private String userQuestionOne;

    private String userQuestionTwo;

    private String userQuestionThree;

    private String questionOneAnswer;

    private String questionTwoAnswer;

    private String questionThreeAnswer;

    private String userState;

    private String userYnVip;

    private String userRole;

    private Date userYnVipEnddate;

    private String res01;

    private String res02;

    private String res03;

    private String res04;

    private String res05;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserLoginnumber() {
        return userLoginnumber;
    }

    public void setUserLoginnumber(String userLoginnumber) {
        this.userLoginnumber = userLoginnumber == null ? null : userLoginnumber.trim();
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

    public Date getUserBornDate() {
        return userBornDate;
    }

    public void setUserBornDate(String userBornDate) throws ParseException {
    	 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        this.userBornDate = sdf.parse(userBornDate);
    }

    public String getUserPicture() {
        return userPicture;
    }

    public void setUserPicture(String userPicture) {
        this.userPicture = userPicture == null ? null : userPicture.trim();
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress == null ? null : userAddress.trim();
    }

    public String getUserLxdh() {
        return userLxdh;
    }

    public void setUserLxdh(String userLxdh) {
        this.userLxdh = userLxdh == null ? null : userLxdh.trim();
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail == null ? null : userEmail.trim();
    }

    public String getUserPoint() {
        return userPoint;
    }

    public void setUserPoint(String userPoint) {
        this.userPoint = userPoint == null ? null : userPoint.trim();
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag == null ? null : delFlag.trim();
    }

    public Date getUserRegisterDate() {
        return userRegisterDate;
    }

    public void setUserRegisterDate(Date userRegisterDate) {
        this.userRegisterDate = userRegisterDate;
    }

    public String getUserQuestionOne() {
        return userQuestionOne;
    }

    public void setUserQuestionOne(String userQuestionOne) {
        this.userQuestionOne = userQuestionOne == null ? null : userQuestionOne.trim();
    }

    public String getUserQuestionTwo() {
        return userQuestionTwo;
    }

    public void setUserQuestionTwo(String userQuestionTwo) {
        this.userQuestionTwo = userQuestionTwo == null ? null : userQuestionTwo.trim();
    }

    public String getUserQuestionThree() {
        return userQuestionThree;
    }

    public void setUserQuestionThree(String userQuestionThree) {
        this.userQuestionThree = userQuestionThree == null ? null : userQuestionThree.trim();
    }

    public String getQuestionOneAnswer() {
        return questionOneAnswer;
    }

    public void setQuestionOneAnswer(String questionOneAnswer) {
        this.questionOneAnswer = questionOneAnswer == null ? null : questionOneAnswer.trim();
    }

    public String getQuestionTwoAnswer() {
        return questionTwoAnswer;
    }

    public void setQuestionTwoAnswer(String questionTwoAnswer) {
        this.questionTwoAnswer = questionTwoAnswer == null ? null : questionTwoAnswer.trim();
    }

    public String getQuestionThreeAnswer() {
        return questionThreeAnswer;
    }

    public void setQuestionThreeAnswer(String questionThreeAnswer) {
        this.questionThreeAnswer = questionThreeAnswer == null ? null : questionThreeAnswer.trim();
    }

    public String getUserState() {
        return userState;
    }

    public void setUserState(String userState) {
        this.userState = userState == null ? null : userState.trim();
    }

    public String getUserYnVip() {
        return userYnVip;
    }

    public void setUserYnVip(String userYnVip) {
        this.userYnVip = userYnVip == null ? null : userYnVip.trim();
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole == null ? null : userRole.trim();
    }

    public Date getUserYnVipEnddate() {
        return userYnVipEnddate;
    }

    public void setUserYnVipEnddate(Date userYnVipEnddate) {
        this.userYnVipEnddate = userYnVipEnddate;
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

	public BbsUser() {
		super();
	}

	public BbsUser(String userId, String userName, String userLoginnumber,
			String userPassword, Date userBornDate, String userPicture,
			String userAddress, String userLxdh, String userEmail,
			String userPoint, String delFlag, Date userRegisterDate,
			String userQuestionOne, String userQuestionTwo,
			String userQuestionThree, String questionOneAnswer,
			String questionTwoAnswer, String questionThreeAnswer,
			String userState, String userYnVip, String userRole,
			Date userYnVipEnddate, String res01, String res02, String res03,
			String res04, String res05) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userLoginnumber = userLoginnumber;
		this.userPassword = userPassword;
		this.userBornDate = userBornDate;
		this.userPicture = userPicture;
		this.userAddress = userAddress;
		this.userLxdh = userLxdh;
		this.userEmail = userEmail;
		this.userPoint = userPoint;
		this.delFlag = delFlag;
		this.userRegisterDate = userRegisterDate;
		this.userQuestionOne = userQuestionOne;
		this.userQuestionTwo = userQuestionTwo;
		this.userQuestionThree = userQuestionThree;
		this.questionOneAnswer = questionOneAnswer;
		this.questionTwoAnswer = questionTwoAnswer;
		this.questionThreeAnswer = questionThreeAnswer;
		this.userState = userState;
		this.userYnVip = userYnVip;
		this.userRole = userRole;
		this.userYnVipEnddate = userYnVipEnddate;
		this.res01 = res01;
		this.res02 = res02;
		this.res03 = res03;
		this.res04 = res04;
		this.res05 = res05;
	}
    
}