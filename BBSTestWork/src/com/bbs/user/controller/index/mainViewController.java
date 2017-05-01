package com.bbs.user.controller.index;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbs.user.bean.BbsFile;
import com.bbs.user.bean.BbsNote;
import com.bbs.user.service.file.BbsFileService;
import com.bbs.user.service.note.BbsNoteService;


@Controller
@RequestMapping("/Common")
public class mainViewController {
    @Autowired
	private BbsNoteService bbsNoteService;
	@Autowired
    private BbsFileService bbsFileService;
	/**
	 * 获取所有用户列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/firstView")
	public String getAllUser(HttpServletRequest request){
		return "/index";
	}
	/**
	 * 统计帖子和文件
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/findCensus")
	public String findCensus(HttpServletRequest request){
		BbsNote res01=bbsNoteService.findCensus();
		BbsFile res02=bbsFileService.findCensus();
		String ssString=res01.getRes01()+","+res02.getRes04();
		return ssString;
	}
}
