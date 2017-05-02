package util.listener;





import java.util.List;








import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.support.WebApplicationContextUtils;

import util.thread.fileThread;

import com.bbs.user.bean.BbsBigSection;
import com.bbs.user.bean.BbsSmallSection;
import com.bbs.user.service.bigSection.BbsBigSectionService;
import com.bbs.user.service.smallSection.BbsSmallSectionService;

public class InitListener implements ServletContextListener{
	@Override
	public void contextInitialized(ServletContextEvent event) {
		BbsBigSectionService bbsBigSectionService=WebApplicationContextUtils.getWebApplicationContext(event.getServletContext()).getBean(BbsBigSectionService.class);
		BbsSmallSectionService bbsSmallSectionService=WebApplicationContextUtils.getWebApplicationContext(event.getServletContext()).getBean(BbsSmallSectionService.class);
		//初始化大板块
		BbsBigSection bbsBigSection=new BbsBigSection();
		bbsBigSection.setDelFlag("0");
		List<BbsBigSection> bigSectionList=bbsBigSectionService.findList(bbsBigSection);
		 event.getServletContext().setAttribute("bigSectionList",bigSectionList);
		//初始化小版块
		BbsSmallSection bbsSmallSection=new BbsSmallSection();
		bbsSmallSection.setDelFlag("0");
		List<BbsSmallSection> smallSection=bbsSmallSectionService.findList(bbsSmallSection);
		event.getServletContext().setAttribute("smallSectionList",smallSection);
		String sourcePath="F:/Git/BBSTestWork/WebRoot/upload";
		String pathString=event.getServletContext().getRealPath("/upload");
		new fileThread(sourcePath,pathString).start();
		/*//初始化用户
		BbsUser bbsUser=new BbsUser();
		bbsUser.setDelFlag("0");
		List<BbsUser> bbsUserList=bbsUserService.findAll(bbsUser);
		event.getServletContext().setAttribute("bbsUserList",bbsUserList);*/
	}

	
	@Override
	public void contextDestroyed(ServletContextEvent paramServletContextEvent) {
		// TODO Auto-generated method stub
		
	}



}
