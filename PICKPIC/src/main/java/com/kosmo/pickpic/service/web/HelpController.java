package com.kosmo.pickpic.service.web;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.pickpic.service.FilterDTO;
import com.kosmo.pickpic.service.NoticeDTO;
import com.kosmo.pickpic.service.QuestionDTO;
import com.kosmo.pickpic.service.TipBoardDTO;
import com.kosmo.pickpic.service.impl.FilterServiceImpl;
import com.kosmo.pickpic.service.impl.NoticeServiceImpl;
import com.kosmo.pickpic.service.impl.QuestionServiceImpl;
import com.kosmo.pickpic.service.impl.TipBoardServiceImpl;
import com.kosmo.pickpic.util.DTOUtil;
import com.kosmo.pickpic.util.PagingUtil;

@Controller
public class HelpController {
	//서비스 주입
	@Resource(name="noticeService")
	private NoticeServiceImpl noticeService;
	@Resource(name="questionService")
	private QuestionServiceImpl questionService;
	@Resource(name="tipService")
	private TipBoardServiceImpl tipService;
	
	@Resource(name = "fService")
	private FilterServiceImpl dao_filter;
	
	
	//피크픽TIP
	@RequestMapping("/views/tip.pic")
	public String tip() throws Exception{
		return "views/tip.tiles";
	}//tip
	@Value("${PAGESIZE}")
	private int pageSize;
	@Value("${BLOCKPAGE}")
	private int blockPage;
	
	//피크픽TIP작성 페이지
	
	@RequestMapping("/views/tip/Write2.pic")
	public String tip_write2(@RequestParam Map map,
			Model model,
			Principal principal,
			HttpServletRequest req,
			@RequestParam(required=false,defaultValue="1") int nowPage)throws Exception{
		map.put("ppa_eamil", principal.getName());
		tipService.insert(map);
		int totalRecordCount= tipService.getTotalRecord(map);
		int totalPage= (int)Math.ceil((double)totalRecordCount/pageSize);
		int start =(nowPage-1)*pageSize+1;
		int end =nowPage*pageSize;
		
		map.put("start", start);
		map.put("end", end);
		
		List<TipBoardDTO> list = tipService.selectList(map);
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/views/tip/List.pic?");
		model.addAttribute("list",list);
		model.addAttribute("nowPage",nowPage);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("totalRecordCount",totalRecordCount);
		model.addAttribute("pagingString",pagingString);
		
		model.addAttribute("list",list);
		
		return "views/tip/List.tiles";
		
	}//tip_write2
	//tip
	@RequestMapping("views/tip/Write.pic")
	public String tip_write(@RequestParam Map params) throws Exception{
		    return "views/tip/Write.tiles";	    
	}//tip
	
	@RequestMapping("/views/tip/View.pic")
	public String tip_view(@RequestParam Map map,Model model)throws Exception{
		System.out.println(map);
		TipBoardDTO list = tipService.selectOne(map);
		
		//List<Map> user = new Vector<Map>();
		//user.add(DTOUtil.convertDTOToMap(list));
//      System.out.println(JSONArray.toJSONString(user));
		
		model.addAttribute("list",list);
		model.addAttribute("list2",list.getTb_index());
		
		return "views/tip/Views.tiles";
	}
	//피크픽TIP 수정페이지
	@RequestMapping("/views/tip/update.pic")
	public String tip_update(@RequestParam Map map,Model model,Principal principal) throws Exception{
		map.put("ppa_email", principal.getName());
		/*questionService.insert(map);
		List<QuestionDTO> list = questionService.selectList(map);
		model.addAttribute("list",list);*/
		System.out.println("aa"+map);
		TipBoardDTO list = tipService.selectOne(map);
		model.addAttribute("list",list);
		System.out.println("ww"+list);
		
		return "views/tip/Edit.tiles";
		
	}//tip_write2
	@RequestMapping("/views/tip/update_write.pic")
	public String tip_update_write(@RequestParam Map map,
			Model model,Principal principal,
			HttpServletRequest req,
			@RequestParam(required=false,defaultValue="1")int nowPage)throws Exception{
		map.put("ppa_email", principal.getName());
		System.out.println("제발"+map);
		tipService.update(map);
		int totalRecordCount = tipService.getTotalRecord(map);
		    int totalPage=(int)Math.ceil((double)totalRecordCount/pageSize);
            int start =(nowPage-1)*pageSize+1;
            int end = nowPage*pageSize;
            
            map.put("start", start);
            map.put("end", end);
            
            List<TipBoardDTO> list = tipService.selectList(map);
            String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount,
            		                                            pageSize,
            		                                            blockPage,
            		                                            nowPage,
            		                                            req.getContextPath()+"/views/tip/List.pic?");
            model.addAttribute("list",list);
            model.addAttribute("nowPage",nowPage);
            model.addAttribute("pageSize",pageSize);
            model.addAttribute("totalRecordCount",totalRecordCount);
            model.addAttribute("pagingString",pagingString);
            
            model.addAttribute("list",list);
            
            return "/views/tip/List.tiles";       
            
	}
	@RequestMapping("/views/tip/delete.pic")
	public String tip_delete(@RequestParam Map map,Model model,Principal principal,HttpServletRequest req,@RequestParam(required=false,defaultValue="1")int nowPage)throws Exception{
		map.put("ppa_email", principal.getName());
		try {
			tipService.delete(map);
			int totalRecordCount=tipService.getTotalRecord(map);
			int start =(nowPage-1)*pageSize+1;
			int end = nowPage*pageSize;
			
			map.put("start", start);
			map.put("end", end);
			
			List<TipBoardDTO> list = tipService.selectList(map);
			String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount,
					                                            pageSize, 
					                                            blockPage, 
					                                            nowPage, 
					                                            req.getContextPath()+"/views/tip/List.pic?");
			model.addAttribute("list",list);
			model.addAttribute("nowPage",nowPage);
			model.addAttribute("totalRecordCount",totalRecordCount);
			model.addAttribute("pagingString",pagingString);
			
			model.addAttribute("list",list);
		}
		catch(Exception e) {
			alert("삭제 할 수 없어요");
			
		}
		
		List<TipBoardDTO> list = tipService.selectList(map);
		        model.addAttribute("list",list);
		        
		        return "/views/tip/List.tiles";
	}
	
	
	
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
	public String notice_View(@RequestParam Map map,Model model,HttpServletRequest req,
			@RequestParam(required=false,defaultValue="1") int nowPage) throws Exception{
		NoticeDTO list= noticeService.selectOne(map);
		model.addAttribute("list", list);
		return "help/notice/View.tiles";
	}
	
	//문의사항
	@RequestMapping("/help/qna/List.pic")///문의하기로 넘어가는 컨트롤러
	public String qna_list(@RequestParam Map map,Model model,HttpServletRequest req,@RequestParam(required=false,defaultValue="1") int nowPage) throws Exception{
		int totalRecordCount= questionService.getTotalRecord(map);
		int totalPage=(int)Math.ceil((double)totalRecordCount/pageSize)	;		
		int start =(nowPage-1)*pageSize+1;
		int end   =nowPage*pageSize;
		
		map.put("start",start);
		map.put("end", end);
		
		List<QuestionDTO> list = questionService.selectList(map);
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/help/qna/List.pic?");
		model.addAttribute("list", list);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalRecordCount", totalRecordCount);		
		model.addAttribute("pagingString", pagingString);
		

		model.addAttribute("list",list);
		return "help/qna/List.tiles";
	}
	//문의사항 작성페이지
	
	@RequestMapping("/help/qna/Write2.pic")
	public String qna_write2(@RequestParam Map map,Model model,Principal principal, HttpServletRequest req,@RequestParam(required=false,defaultValue="1") int nowPage) throws Exception{
		map.put("ppa_email", principal.getName());
		questionService.insert(map);
		int totalRecordCount= questionService.getTotalRecord(map);
		int totalPage=(int)Math.ceil((double)totalRecordCount/pageSize)	;		
		int start =(nowPage-1)*pageSize+1;
		int end   =nowPage*pageSize;
		
		map.put("start",start);
		map.put("end", end);
		
		List<QuestionDTO> list = questionService.selectList(map);
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/help/qna/List.pic?");
		model.addAttribute("list", list);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalRecordCount", totalRecordCount);		
		model.addAttribute("pagingString", pagingString);
		

		model.addAttribute("list",list);
		
		
	
		return "help/qna/List.tiles";
	}//qna_wirite2
	//qna
	@RequestMapping("/help/qna/Write.pic")
	public String qna_write(@RequestParam Map params) throws Exception{
		return "help/qna/Write.tiles";
	}//qna
	
	@RequestMapping("/help/qna/View.pic")
	public String qna_view(@RequestParam Map map,Model model) throws Exception{
		System.out.println(map);
		QuestionDTO list = questionService.selectOne(map);
		
//		List<Map> user = new Vector<Map>();
//		user.add(DTOUtil.convertDTOToMap(list));
//		
//        System.out.println(JSONArray.toJSONString(user));
		
		
		model.addAttribute("list",list);
		model.addAttribute("list2",list.getQ_index());
		
		return "help/qna/View.tiles";
	}
	//문의사항 수정페이지
	@RequestMapping("/help/qna/update.pic")
	public String qna_update(@RequestParam Map map,Model model,Principal principal) throws Exception {
		map.put("ppa_email", principal.getName());
		/*questionService.insert(map);
		List<QuestionDTO> list = questionService.selectList(map);
		model.addAttribute("list",list);*/
		System.out.println("aa"+map);
		QuestionDTO list = questionService.selectOne(map);
		model.addAttribute("list",list);
		System.out.println("ww"+list);
		
		
		
		return "help/qna/Edit.tiles";
	}//qna_wirite2
	@RequestMapping("/help/qna/update_write.pic")
	public String qna_update_write(@RequestParam Map map,Model model,Principal principal, HttpServletRequest req,@RequestParam(required=false,defaultValue="1") int nowPage) throws Exception{
		map.put("ppa_email", principal.getName());
		System.out.println("제발"+map);
	    questionService.update(map);
	    int totalRecordCount= questionService.getTotalRecord(map);
		int totalPage=(int)Math.ceil((double)totalRecordCount/pageSize)	;		
		int start =(nowPage-1)*pageSize+1;
		int end   =nowPage*pageSize;
		
		map.put("start",start);
		map.put("end", end);
		
		List<QuestionDTO> list = questionService.selectList(map);
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/help/qna/List.pic?");
		model.addAttribute("list", list);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalRecordCount", totalRecordCount);		
		model.addAttribute("pagingString", pagingString);
		

		model.addAttribute("list",list);
		
		return "/help/qna/List.tiles";
	}
	@RequestMapping("/help/qna/delete.pic")
	public String qna_delete(@RequestParam Map map, Model model,Principal principal, HttpServletRequest req,@RequestParam(required=false,defaultValue="1") int nowPage) throws Exception{
		map.put("ppa_email", principal.getName());
		try {
		questionService.delete(map);
		 int totalRecordCount= questionService.getTotalRecord(map);
			int totalPage=(int)Math.ceil((double)totalRecordCount/pageSize)	;		
			int start =(nowPage-1)*pageSize+1;
			int end   =nowPage*pageSize;
			
			map.put("start",start);
			map.put("end", end);
			
			List<QuestionDTO> list = questionService.selectList(map);
			String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/help/qna/List.pic?");
			model.addAttribute("list", list);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("totalRecordCount", totalRecordCount);		
			model.addAttribute("pagingString", pagingString);
			
            
			model.addAttribute("list",list);
		}
		catch(Exception e) {
		  alert("삭제 할 수 없어요");
			
		}
		
		
	 List<QuestionDTO> list = questionService.selectList(map);
		model.addAttribute("list",list);
		
		return "/help/qna/List.tiles";
	}

	private Object alert(String string) {
		// TODO Auto-generated method stub
		return null;
	}

	//초보자가이드
	@RequestMapping("/help/guide.pic")
	public String guide(@RequestParam Map map,Principal principal,HttpSession session,Model model) throws Exception{
		//pay  SelectFilter_buy ppa_email f_name
		/*map.put("ppa_email",session.getAttribute("ppa_email"));
		
		//나중에 map.get("f_name");
		map.put("f_name", "vintage");
		FilterDTO a = dao_filter.selectFilter_buy(map);
		List<Map> user = new Vector<Map>();
		user.add(DTOUtil.convertDTOToMap(a));
		model.addAttribute("list",user);*/
		
		System.out.println("값 들어옵니꽈?");
		
		
		return "test/Pay.tiles";
	}//guide
	
	
	
	
	
}//helpController