package com.kosmo.pickpic.service.web;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.pickpic.service.NoticeDTO;
import com.kosmo.pickpic.service.QuestionDTO;
import com.kosmo.pickpic.service.impl.NoticeServiceImpl;
import com.kosmo.pickpic.service.impl.QuestionServiceImpl;
import com.kosmo.pickpic.util.PagingUtil;

@Controller
public class HelpController {
	//서비스 주입
	@Resource(name="noticeService")
	private NoticeServiceImpl noticeService;
	@Resource(name="questionService")
	private QuestionServiceImpl questionService;
	
	//픽크픽TIP
	@RequestMapping("/help/tip.pic")
	public String tip() throws Exception{
		return "help/tip.tiles";
	}//tip
	@Value("${PAGESIZE}")
	private int pageSize;
	@Value("${BLOCKPAGE}")
	private int blockPage;
	
	//공지사항
	@RequestMapping(value= "/help/notice/List.pic")
	public String notice(Model model, @RequestParam Map map,
			HttpServletRequest req,
			@RequestParam(required=false,defaultValue="1") int nowPage
			) throws Exception{
		int totalRecordCount= noticeService.getTotalRecord(map);		
		int totalPage=(int)Math.ceil((double)totalRecordCount/pageSize)	;		
		int start =(nowPage-1)*pageSize+1;
		int end   =nowPage*pageSize;
	   System.out.println(totalRecordCount);
	   System.out.println(totalPage);
	   System.out.println(start );
	   System.out.println( end  );
	   
		map.put("start",start);
		map.put("end", end);
		List<NoticeDTO> list= noticeService.selectList(map);
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/help/notice/List.pic?");
		model.addAttribute("list", list);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalRecordCount", totalRecordCount);		
		model.addAttribute("pagingString", pagingString);
		return "help/notice/List.tiles";
	}//notice
	
	//공지사항 상세 페이지
	
	@RequestMapping(value= "/help/notice/View.pic")
	public String notice_View(@RequestParam Map map,Model model) throws Exception{
		NoticeDTO list= noticeService.selectOne(map);
		model.addAttribute("list", list);
		return "help/notice/View.tiles";
	}
	
	//문의사항
	@RequestMapping("/help/qna/List.pic")///문의하기로 넘어가는 컨트롤러
	public String qna_list(@RequestParam Map map,Model model) throws Exception{
		System.out.println("map : " + map.toString());
		List<QuestionDTO> list = questionService.selectList(map);
	    
		

		model.addAttribute("list",list);
		return "help/qna/List.tiles";
	}
	//문의사항 작성페이지
	
	@RequestMapping("/help/qna/Write2.pic")
	public String qna_write2(@RequestParam Map map,Model model,Principal principal) throws Exception {
		map.put("ppa_email", principal.getName());
		
		
		questionService.insert(map);
		
		List<QuestionDTO> list = questionService.selectList(map);
		
	
			
		
		model.addAttribute("list",list);
		return "help/qna/List.tiles";
	}//qna_wirite2
	
	
	
	//qna
	@RequestMapping("/help/qna/Write.pic")
	public String qna_write(@RequestParam Map params) throws Exception{
		return "help/qna/Write.tiles";
	}//qna

	//초보자가이드
	@RequestMapping("/help/guide.pic")
	public String guide() throws Exception{
		return "help/guide.tiles";
	}//guide
}//helpController
