package com.bbs.user.controller.file;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import util.Page;

import com.bbs.user.bean.BbsFile;
import com.bbs.user.bean.BbsReplyNote;
import com.bbs.user.bean.BbsSystemMessage;
import com.bbs.user.bean.BbsUser;
import com.bbs.user.service.file.BbsFileService;
import com.bbs.user.service.replyNote.ReplyNoteService;
import com.bbs.user.service.systemMessage.BbsSystemMessageService;
import com.bbs.user.service.user.BbsUserService;

@Controller
@RequestMapping("/file")
public class BbsFileController {

	@Autowired
	private BbsFileService bbsFileService;
	@Autowired
	private BbsUserService bbsUserService;
	@Autowired
	private ReplyNoteService replyNoteService;
	@Autowired
	private BbsSystemMessageService bbsSystemMessageService;
	/**
	 * 获取所有文件列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/findFileList")
	public String getAllUser(HttpServletRequest request,HttpServletResponse response,BbsFile bbsFile,String isAdmin){
		if("isAdmin".equals(isAdmin)){
		bbsFile.setRes02("1");
		}
		if("isHead".equals(isAdmin)){
			bbsFile.setRes04("1");
			}
		Page<BbsFile> findAll = bbsFileService.findAll(new Page<BbsFile>(request, response), bbsFile);
		request.setAttribute("page", findAll);
		request.setAttribute("isAdmin", isAdmin);
		if(StringUtils.isEmpty(isAdmin)||"isHead".equals(isAdmin)){
		   return "/Common/filePageListIframe";
		}else{
		   return "/admin/fileList";
		}
	}
	
	
	/**
	 * 获取所有文件列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/findHotFileList")
	public String findHotFileList(HttpServletRequest request,HttpServletResponse response,BbsFile bbsFile){
		List<BbsFile> findAll = bbsFileService.findHotFileList(bbsFile);
		request.setAttribute("fileList", findAll);
		return "/Common/fileHotListIframe";
	}
	
	/**
	 * 查看文件信息
	 * @param request
	 * @return
	 */
	@RequestMapping("/findFileById")
	public String findNoteById(HttpServletRequest request,HttpServletResponse response,BbsFile bbsFile,String state){
		BbsFile bbsFile2 = bbsFileService.getFileById(bbsFile);
		BbsReplyNote bbsReplyNote=new BbsReplyNote();
		bbsReplyNote.setRes02(bbsFile2.getFileId());
		bbsReplyNote.setDelFlag("0");
		bbsReplyNote.setRes01("1");
		List<BbsReplyNote> bbsReplyNoteList=replyNoteService.findList(bbsReplyNote);
		request.setAttribute("replyNoteList", bbsReplyNoteList);
		request.setAttribute("file", bbsFile2);
		request.setAttribute("state", state);
		return "Common/fileDetail";
	}
	
	
	@RequestMapping("/downloadFile")
	public ResponseEntity<byte[]> download(@RequestParam("fileName") String fileName,@RequestParam("userId") String userId,@RequestParam("filePoint") String filePoint,@RequestParam("userPoint") String userPoint,@RequestParam("fileId") String fileId,@RequestParam("res01") String res01) throws IOException{
	 RequestAttributes ra=RequestContextHolder.getRequestAttributes();
	 HttpServletRequest request=((ServletRequestAttributes)ra).getRequest();
	String path=request.getServletContext().getRealPath(fileName);
	File file=new File(path);
	HttpHeaders headers=new HttpHeaders();
	if(file.exists()){
	String fileName2=new String(fileName.substring(7, fileName.length()).getBytes("UTF-8"),"iso-8859-1");//为了解决中文名称乱码问题
	headers.setContentDispositionFormData("attachment",fileName2);
	headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	
	BbsFile bbsFile=new BbsFile();
	bbsFile.setFileId(fileId);
	bbsFile.setRes01(String.valueOf(Integer.parseInt(res01)+1));
	bbsFileService.update(bbsFile);
	BbsUser bbsUser3=bbsUserService.findById(userId);
	BbsUser bbsUser=new BbsUser();
	if(bbsUser3.getUserYnVip().equals("1")){
		if(bbsUser3.getUserYnVipEnddate().getTime()<new Date().getTime()){
			bbsUser.setUserId(userId);
			bbsUser.setUserPoint(String.valueOf(Integer.parseInt(userPoint)-Integer.parseInt(filePoint)));
			bbsUserService.update(bbsUser);
		}
	}else{
		bbsUser.setUserId(userId);
		bbsUser.setUserPoint(String.valueOf(Integer.parseInt(userPoint)-Integer.parseInt(filePoint)));
		bbsUserService.update(bbsUser);
	}
	bbsUser.setDelFlag("0");
	BbsUser bbsUser2=bbsUserService.findById(userId);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	bbsUser.setRes02(sdf.format(bbsUser2.getUserBornDate()));
	request.getSession().removeAttribute("user");
	request.getSession().setAttribute("user", bbsUser2);
	}else{
		request.setAttribute("message","下载的文件不存在！");
	}
	return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
	headers,HttpStatus.CREATED);
	}
	
	
	/**
	 * 编辑
	 * @param request
	 * @return
	 */
	@RequestMapping("/update")
	public void update(HttpServletRequest request,HttpServletResponse response,BbsFile bbsFile,String toolStyle,String reasonStr){
		String str="";
		if(toolStyle.equals("update")){
			BbsUser bbsUser=bbsUserService.findById(bbsFile.getUserId());
			if(bbsFile.getFilePoint()=="0"){
				bbsUser.setUserPoint(String.valueOf(Integer.parseInt(bbsUser.getUserPoint())+2));
				str="您上传的文件:"+bbsFile.getFileName()+"被管理员审核通过,您的账户积分增加2分";	
			}else{
				bbsUser.setUserPoint(String.valueOf(Integer.parseInt(bbsUser.getUserPoint())+Integer.parseInt(bbsFile.getFilePoint())));
	            str="您上传的文件:"+bbsFile.getFileName()+"被管理员审核通过,您的账户积分增加"+bbsFile.getFilePoint()+"分";
			}
		    bbsFile.setRes02("1");
		    bbsUserService.update(bbsUser);
			}
			if(toolStyle.equals("delete")){
				bbsFile.setDelFlag("1");
			}
			if(toolStyle.equals("return")){
				 str="您上传的文件:"+bbsFile.getFileName()+"被管理员退回,退回原因是"+reasonStr;
				 bbsFile.setRes02("2");
			}
		    bbsFileService.update(bbsFile);
			if(StringUtils.isNotEmpty(str)){
				BbsSystemMessage bbsSystemMessage=new BbsSystemMessage();
				bbsSystemMessage.setCjsj(new Date());
				bbsSystemMessage.setMessageContains(str);
				bbsSystemMessage.setDelFlag("0");
				bbsSystemMessage.setMessageNamae("账号变动信息");
				bbsSystemMessage.setRes01(bbsFile.getUserId());
				bbsSystemMessage.setRes02("0");
				bbsSystemMessage.setRes03("0");
				bbsSystemMessageService.insert(bbsSystemMessage);
			}
	}
	/**
	 *上传文件
	 * @param request
	 * @return
	 */
	@RequestMapping("/uploadFile")
	public String insert(@RequestParam(value="upload",required=false)MultipartFile file,HttpServletRequest request,HttpServletResponse response,BbsFile bbsFile){
		  String path=request.getSession().getServletContext().getRealPath("/upload");
		  String fileName=file.getOriginalFilename();
		  File targetFile=new File(path,fileName);
			if(!targetFile.exists()){
			  targetFile.mkdirs();
			   }
			try{
			  file.transferTo(targetFile);
			}catch(Exception e){
			  e.printStackTrace();
			}
	    bbsFile.setFileUrl("upload/"+fileName);
	    bbsFile.setFileType("1");
		bbsFile.setDelFlag("0");
		bbsFile.setCjsj(new Date());
		bbsFile.setRes01("0");//下载次数
		bbsFile.setFilePoint("0");
		bbsFile.setRes02("0");//审核结果0：未审核，1：审核通过，2：审核不通过
		bbsFile.setRes03("0");//评论次数
		bbsFileService.insert(bbsFile);
		 request.setAttribute("bbsFile",bbsFile);
		 RequestAttributes ra=RequestContextHolder.getRequestAttributes();
		 HttpServletRequest request2=((ServletRequestAttributes)ra).getRequest();
		 BbsUser bbsUser2=bbsUserService.findById(bbsFile.getUserId());
		 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		 bbsUser2.setRes02(sdf.format(bbsUser2.getUserBornDate()));
		 request2.getSession().removeAttribute("user");
		 request2.getSession().setAttribute("user", bbsUser2);
		return "/Common/uploadFile";
	}
	/**
	 *删除大版块
	 * @param request
	 * @return
	 */
	@RequestMapping("/delete")
	public void delete(HttpServletRequest request,HttpServletResponse response,BbsFile bbsFile){
		bbsFile.setDelFlag("1");
		bbsFileService.update(bbsFile);
	}
	
	
	
	
}
