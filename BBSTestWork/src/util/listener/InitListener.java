package util.listener;





import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

import com.bbs.user.bean.BbsBigSection;
import com.bbs.user.service.bigSection.BbsBigSectionService;

public class InitListener implements ServletContextListener{
	@Autowired
	private BbsBigSectionService bbsBigSectionService;
	@Override
	public void contextInitialized(ServletContextEvent event) {
		
		/*//初始化大板块
		BbsBigSection bbsBigSection=new BbsBigSection();
		bbsBigSection.setDelFlag("0");
		List<BbsBigSection> bigSectionList=bbsBigSectionService.findList(bbsBigSection);
		 event.getServletContext().setAttribute("bigSectionList",bigSectionList);*/
		/*//初始化小版块
		BbsSmallSection bbsSmallSection=new BbsSmallSection();
		bbsSmallSection.setDelFlag("0");
		 Page<BbsSmallSection> smallSectionPage=new BbsSmallSectionServiceImpl().findAll(null,bbsSmallSection);
		 event.getServletContext().setAttribute("smallSectionPage",smallSectionPage);*/
	}

	
	@Override
	public void contextDestroyed(ServletContextEvent paramServletContextEvent) {
		// TODO Auto-generated method stub
		
	}



}
