package com.bbs.user.controller.file;


import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
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
import com.bbs.user.service.file.BbsFileService;
import com.bbs.user.service.replyNote.ReplyNoteService;

@Controller
@RequestMapping("/file")
public class BbsFileController {

	@Autowired
	private BbsFileService bbsFileService;
	@Autowired
	private ReplyNoteService replyNoteService;
	/**
	 * 获取所有文件列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/findFileList")
	public String getAllUser(HttpServletRequest request,HttpServletResponse response,BbsFile bbsFile){
		Page<BbsFile> findAll = bbsFileService.findAll(new Page<BbsFile>(request, response), bbsFile);
		request.setAttribute("page", findAll);
		return "/Common/filePageListIframe";
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
	public String findNoteById(HttpServletRequest request,HttpServletResponse response,BbsFile bbsFile){
		BbsFile bbsFile2 = bbsFileService.getFileById(bbsFile);
		BbsReplyNote bbsReplyNote=new BbsReplyNote();
		bbsReplyNote.setNoteId(bbsFile2.getFileId());
		bbsReplyNote.setDelFlag("0");
		bbsReplyNote.setRes01("1");
		List<BbsReplyNote> bbsReplyNoteList=replyNoteService.findList(bbsReplyNote);
		request.setAttribute("replyNoteList", bbsReplyNoteList);
		request.setAttribute("file", bbsFile2);
		return "Common/fileDetail";
	}
	
	
	@RequestMapping("/downloadFile")
	public ResponseEntity<byte[]> download(@RequestParam("fileName") String fileName) throws IOException{
	 RequestAttributes ra=RequestContextHolder.getRequestAttributes();
	 HttpServletRequest request=((ServletRequestAttributes)ra).getRequest();
	String path=request.getServletContext().getRealPath(fileName);
	File file=new File(path);
	HttpHeaders headers=new HttpHeaders();
	String fileName2=new String(fileName.substring(7, fileName.length()).getBytes("UTF-8"),"iso-8859-1");//为了解决中文名称乱码问题
	headers.setContentDispositionFormData("attachment",fileName2);
	headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
	headers,HttpStatus.CREATED);
	}
	
	
	/**
	 * 编辑
	 * @param request
	 * @return
	 */
	@RequestMapping("/update")
	public String update(HttpServletRequest request,HttpServletResponse response,BbsFile bbsFile){
		bbsFile.setDelFlag("0");
		Page<BbsFile> findAll = bbsFileService.findAll(new Page<BbsFile>(request, response), bbsFile);
		request.setAttribute("page", findAll);
		return "/admin/file";
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
