package com.kosmo.pickpic;

import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.scripting.config.LangNamespaceHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.kosmo.pickpic.service.NoticeDTO;
import com.kosmo.pickpic.service.QuestionDTO;
import com.kosmo.pickpic.service.impl.NoticeServiceImpl;
import com.kosmo.pickpic.service.impl.PickpicAccountServiceImpl;
import com.kosmo.pickpic.service.impl.QuestionServiceImpl;
import com.kosmo.pickpic.service.web.PagingUtil;

@Controller
public class AdminController {
	//서비스 주입
	@Resource(name="noticeService")
	private NoticeServiceImpl noticeService;
	
	@Resource(name="questionService")
	private QuestionServiceImpl questionService;
	
	
	//HOME
	@RequestMapping(value = "/admin/home.pic")
	public String home(@RequestParam Map map) {
		map.put("admin", "HOME");
		return "admin/admin_home.admin";
	}//home
	
	//회원관리
	@RequestMapping(value = "/admin/users.pic")
	public String users(@RequestParam Map map) {
		map.put("admin", "회원관리");
		return "admin/admin_users.admin";
	}//users
	
	//픽플레이스관리
	@RequestMapping(value = "/admin/pickPlace.pic")
	public String attraction(@RequestParam Map map) {
		map.put("admin", "픽플레이스관리");
		return "admin/admin_pickPlace.admin";
	}//pickPlace
	
	//필터관리
	@RequestMapping(value = "/admin/filter.pic")
	public String filter(@RequestParam Map map) {
		map.put("admin", "필터관리");
		return "admin/admin_filter.admin";
	}//filter
	
	//픽로드관리
	@RequestMapping(value = "/admin/pickRoad.pic")
	public String route(@RequestParam Map map) {
		map.put("admin", "픽로드관리");
		return "admin/admin_pickRoad.admin";
	}//pickRoad
	
	//앨범다운관리
	@RequestMapping(value = "/admin/albumDown.pic")
	public String albumDown(@RequestParam Map map) {
		map.put("admin", "앨범다운관리");
		return "admin/admin_albumDown.admin";
	}//albumDown
	
	//문의 관리
	@RequestMapping(value = "/admin/qna.pic")
	public String qna(@RequestParam Map map) {
		List<QuestionDTO> list = questionService.selectList(map);
		
		map.put("admin", "문의관리");
		return "admin/admin_qna.admin";
	}//qna
	
	//신고함
	@RequestMapping(value = "/admin/report.pic")
	public String report(@RequestParam Map map) {
		map.put("admin", "게시물신고함");
		return "admin/admin_report.admin";
	}//report
	@Value("${PAGESIZE}")
	private int pageSize;
	@Value("${BLOCKPAGE}")
	private int blockPage;
	//공지사항 List폼 뿌려주기
	@RequestMapping(value = "/admin/notice.pic")
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
	
		
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/admin/notice.pic?");
		model.addAttribute("list", list);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalRecordCount", totalRecordCount);		
		model.addAttribute("pagingString", pagingString);
		
		return "admin/admin_notice.admin";
	}///////////////list()

	
	@RequestMapping(value= "/admin/admin_notice.pic")
	public String notice_View(@RequestParam Map map,Model model) throws Exception{
		NoticeDTO list= noticeService.selectOne(map);
		model.addAttribute("list", list);
		return "/admin/admin_notice.admin";
	}
	
	@RequestMapping(value="/admin/admin_view.pic")
		public String notice_view(Model model, @RequestParam Map map,
				HttpServletRequest req,
				@RequestParam(required=false,defaultValue="1") int nowPage
				) throws Exception{
			int totalRecordCount= noticeService.getTotalRecord(map);		
			int totalPage=(int)Math.ceil((double)totalRecordCount/pageSize)	;		
			int start =(nowPage-1)*pageSize+1;
			int end   =nowPage*pageSize;
		  
		   
			map.put("start",start);
			map.put("end", end);
			List<NoticeDTO> list= noticeService.selectList(map);
		
		
			String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/admin/notice.pic?");
			model.addAttribute("list", list);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("totalRecordCount", totalRecordCount);		
			model.addAttribute("pagingString", pagingString);
			
		 NoticeDTO list2 = noticeService.selectOne(map);
		 model.addAttribute("list2", list2);
		return "/admin/admin_notice.admin";
	}
	
	//등록처리
	@RequestMapping(value="/admin/admin_notice.pic",method=RequestMethod.POST)
	public String writeOk(@RequestParam Map map,HttpSession session) throws Exception{
		
		//map.put("id",session.getAttribute("id"));
		noticeService.insert(map);
	
		return "forward:notice.pic";
	}
	//수정
	@RequestMapping("/admin/admin_edit.pic")
	public String edit(Model model, @RequestParam Map map,
			HttpServletRequest req,
			@RequestParam(required=false,defaultValue="1") int nowPage) throws Exception{
		int totalRecordCount= noticeService.getTotalRecord(map);		
		int totalPage=(int)Math.ceil((double)totalRecordCount/pageSize)	;		
		int start =(nowPage-1)*pageSize+1;
		int end   =nowPage*pageSize;
	    
	    
		map.put("start",start);
		map.put("end", end);
		List<NoticeDTO> list= noticeService.selectList(map);
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/admin/notice.pic?");
		model.addAttribute("list", list);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalRecordCount", totalRecordCount);		
		model.addAttribute("pagingString", pagingString);
       
		 
		if(req.getMethod().equals("GET")) {//수정폼으로 이동
			//서비스 호출]
			NoticeDTO list2=noticeService.selectOne(map);
			
			//데이타 저장]
			model.addAttribute("list2", list2);
			//수정 폼으로 이동]
			
			return "/admin/admin_edit.pic";
		}
		
	
		int a = noticeService.update(map);
		list= noticeService.selectList(map);
		model.addAttribute("list", list);
		
		model.addAttribute("a", a);
		return "/admin/admin_notice.admin";
	}
	
	@RequestMapping("/admin/admin_delete.pic")
	public String delete(@RequestParam Map map,Model model) throws Exception{
		//서비스 호출]
		System.out.println(map);
		
		//int sucFail=noticeService.delete(map);	
		//데이타 저장]
		//List<NoticeDTO> list= noticeService.selectList(map);
		System.out.println("여기로 옵니다");
		System.out.println("a 입니다::"+map.get("a"));
		//model.addAttribute("SUCFAIL", sucFail);
		//뷰정보 반환]
		System.out.println("나는 뜰것이당:::"+map.get("n_index"));
		return "/admin/admin_notice.admin";
	}
	
	
	
	
	//ETC
	//휴지통
	@RequestMapping(value = "/admin/recyclebin.pic")
	public String recyclebin(@RequestParam Map map) {
		map.put("admin", "휴지통");
		return "admin/admin_recyclebin.admin";
	}//recyclebin

	
}//AdminController