package com.kosmo.pickpic;

import java.net.URLEncoder;
import java.security.Principal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scripting.config.LangNamespaceHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.pickpic.service.FilterDTO;
import com.kosmo.pickpic.service.NoticeDTO;
import com.kosmo.pickpic.service.PickpicAccountDTO;
import com.kosmo.pickpic.service.impl.AdminServiceImpl;
import com.kosmo.pickpic.service.QuestionDTO;
import com.kosmo.pickpic.service.impl.NoticeServiceImpl;
import com.kosmo.pickpic.service.impl.PickRoadBoardServiceImpl;
import com.kosmo.pickpic.service.impl.PickpicAccountServiceImpl;
import com.kosmo.pickpic.service.impl.QuestionServiceImpl;
import com.kosmo.pickpic.util.DTOUtil;
import com.kosmo.pickpic.util.PagingUtil;

@Controller
public class AdminController {
	//서비스 주입
	@Resource(name="noticeService")
	private NoticeServiceImpl noticeService;
	
	@Resource(name="adminService")
	private AdminServiceImpl adminService;

	@Resource(name="questionService")
	private QuestionServiceImpl questionService;
	
	
	
	
	//HOME
	@RequestMapping(value = "/admin/home.pic")
	public String home(@RequestParam Map map, Model model) throws Exception{
		model.addAllAttributes(adminService.dashBoardTop());
		model.addAttribute("user",adminService.dashBoardUser());
		model.addAttribute("filter",adminService.filterAll());
		model.addAttribute("place", adminService.pickPlaceAll());
		model.addAttribute("road", adminService.pickRoadAll());
		return "admin/admin_home.admin";
	}//home
	
	//회원관리
	@RequestMapping(value = "/admin/users.pic")
	public String users(Model model) throws Exception {
		List<PickpicAccountDTO> beforeUser = adminService.pickPicAccountAll();
		List<PickpicAccountDTO> AfterUser = new Vector<PickpicAccountDTO>();
		
		for(PickpicAccountDTO record : beforeUser) {
			record.setLh_ld(DTOUtil.getStringDate(record.getLh_ld(), "yyyy-MM-dd HH:mm:ss", "yy/MM/dd"));
			AfterUser.add(record);
		}
		
		model.addAttribute("user", AfterUser);
		model.addAttribute("total", AfterUser.size());
		return "admin/admin_users.admin";
	}//users
	
	//유저 상세보기 aJax
	@ResponseBody
    @RequestMapping(value="/admin/userDetail.do",produces="text/html; charset=UTF-8")
    public String userDetail(@RequestParam Map map) throws Exception{
       
       List<Map> user = new Vector<Map>();  
       user.add(DTOUtil.convertDTOToMap(adminService.oneUser(map)));
       
       System.out.println(JSONArray.toJSONString(user));
       
       return JSONArray.toJSONString(user);
    }
	
//	//유저관리 게시판 페이징
//	@ResponseBody
//	@RequestMapping(value="/admin/userPaging.do", produces="text/html; charset=UTF-8")
//	public String userPaging(@RequestParam Map map) throws Exception{
//		
//		System.out.println("nowPage : " + map.get("nowPage").toString());
//		//페이징을 위한 로직 시작]
//		//전체 레코드수
//		int totalRecordCount= adminService.userTotal();		
//		//전체 페이지수]
//		int totalPage=(int)Math.ceil((double)totalRecordCount/10);		
//		//시작 및 끝 ROWNUM구하기]
//		int nowPage = Integer.parseInt(map.get("nowPage").toString());
//		int start =(nowPage-1)*10+1;
//		int end   =nowPage*10;
//		map.put("start",start);
//		map.put("end", end);
//		
//		List<PickpicAccountDTO> user = adminService.selectUser(map);
//		Map record = new HashMap();
//		
//		List<Map> list = new Vector<Map>();
//		for(PickpicAccountDTO dto : user) {
//			record = DTOUtil.convertDTOToMap(dto);
//			list.add(record);
//		}
//		
//		record.put("list", list);
//		record.put("nowPage", nowPage);
//		record.put("pageSize", 10);
//		record.put("totalRecordCount", totalRecordCount);
//
//		List<Map> paging = new Vector<Map>();
//		paging.add(record);
//		
//		System.out.println(JSONArray.toJSONString(paging));
//		return JSONArray.toJSONString(paging);
//	}
	
	
	//픽플레이스관리
	@RequestMapping(value = "/admin/pickPlace.pic")
	public String attraction(@RequestParam Map map) throws Exception{
		return "admin/admin_pickPlace.admin";
	}//pickPlace
	
	//필터관리
	@RequestMapping(value = "/admin/filter.pic")
	public String filter(Model model) throws Exception{
		List<FilterDTO> BeforefilterList = adminService.filterAll();
		List<FilterDTO> AfterfilterList = new Vector<FilterDTO>();
		
		 for(FilterDTO record : BeforefilterList) {
			 AfterfilterList.add(DTOUtil.reName(record));
		 }
		
		model.addAttribute("filter", AfterfilterList);
		model.addAttribute("total", AfterfilterList.size());
		
		return "admin/admin_filter.admin";
	}//filter
	
	//유저 상세보기 aJax
	@ResponseBody
	@RequestMapping(value="/admin/filterDetail.do",produces="text/html; charset=UTF-8")
	public String filterDetail(@RequestParam Map map) throws Exception{
		FilterDTO filter = adminService.oneFilter(map);
		filter = DTOUtil.reName(filter);
		
		List<Map> user = new Vector<Map>();  
		user.add(DTOUtil.convertDTOToMap(filter));
		
		return JSONArray.toJSONString(user);
	}
	
	//픽로드관리
	@RequestMapping(value = "/admin/pickRoad.pic")
	public String route(@RequestParam Map map,Model model) throws Exception{
		
	  //System.out.println("안녕"+map.toString());
	  List<Map> recode = adminService.pickPicAccountRoadAll();
	  //System.out.println("전부 가져와보기"+recode.toString());
	  model.addAttribute("recode",recode);
		
		
	  return "admin/admin_pickRoad.admin";
	}//pickRoad
	
	
	@RequestMapping(value="/admin/pickRoad.do")
	public String route_delete(@RequestParam Map map,Map map2,Model model) throws Exception{
		System.out.println("hihihi");
		//System.out.println("dd"+ map.toString());
	
		String prb_index = map.get("prb_index").toString().replaceAll("\"", "").replace("[", "").replace("]","");
		//System.out.println("prb_index"+prb_index);
		String[] text = prb_index.split(",");
		for(int i=0;i<text.length;i++) {
			map2.put("prb_index",text[i]);
			System.out.println("map2"+map2.toString());
			adminService.delete2(map2);
			adminService.delete(map2);
		}
		
		List<Map> recode = adminService.pickPicAccountRoadAll();
		//System.out.println("전부 가져와보기"+recode.toString());
		  model.addAttribute("recode",recode);
		return "admin/admin_pickRoad.admin"; 
	}//삭제 후 리스트 다시 뿌려주기
	/*//픽로드관리 - 삭제 -Ajax 처리
	@ResponseBody
	@RequestMapping(value="/admin/pickRoad.do",produces="text/html; charset=UTF-8")
	public String route_delete(@RequestParam Map map,Map map2) throws Exception{
		//위 델리트 먼자 하면 좋을꺼 같다
		String prb_index = map.get("prb_index").toString().replaceAll("\"", "").replace("[", "").replace("]","");
		System.out.println("prb_index"+prb_index);
		String[] text = prb_index.split(",");
		for(int i=0;i<text.length;i++) {
			map2.put("prb_index",text[i]);
			//adminService.delete2(map2);
			//adminService.delete(map2);
		}
		//다시 값 가져오기
		//[{name=김길동, postDate=2019-04-22, title=n}, {name=김길동, postDate=2019-03-25, title=25}, {name=김길동, postDate=2019-03-18, title=213123}, {name=김길동, postDate=2019-03-18, title=213}, {name=김길동, postDate=2019-03-14, title=21312321312}]
		List<Map> recode = adminService.pickPicAccountRoadAll();
		System.out.println("recode"+recode.toString());
		String recodeSTR = recode.toString().replace("PRB", "\"PRB").replace("PPA", "\"PPA").replace("=","\":\"").replace(",","\",").replace("}","\"}").replace("[", "").replace("]","").replace("}\",", "},");
		String[] test = recodeSTR.split("},");
		String test2= "";
		for(int i=0;i<test.length;i++) {
			System.out.println(i+" 번방 "+test[i]);
			test2 = test[i];
		}
		
		System.out.println("recodeSTR+ "+recodeSTR);
		
		
		
		 * {
		 * "PRB_INDEX":"146",
		 *  "PRB_RECOMMEND":"0",
		 *   "PPA_ID":"2ZORUAF7I0JW", "PRB_TITLE":"안녕", "PRB_END_DATE":"2019-05-20 00:00:00.0", "PRB_POST_DATE":"2019-05-20 01:58:40.0", "PRB_START_DATE":"2019-05-20 00:00:00.0", "PRB_VIEW":"0", "PRB_ID":"JBQP0FPUMQVL", "PPA_EMAIL":"admin", "PRB_CONTENT":"안녕"}, {"PRB_INDEX":"145", "PRB_RECOMMEND":"0", "PPA_ID":"2ZORUAF7I0JW", "PRB_TITLE":"안녕", "PRB_END_DATE":"2019-05-20 00:00:00.0", "PRB_POST_DATE":"2019-05-20 01:47:43.0", "PRB_START_DATE":"2019-05-20 00:00:00.0", "PRB_VIEW":"0", "PRB_ID":"P206W7MKUWI0", "PPA_EMAIL":"admin", "PRB_CONTENT":"안녕"}, {"PRB_INDEX":"144", "PRB_RECOMMEND":"0", "PPA_ID":"2ZORUAF7I0JW", "PRB_TITLE":"hello", "PRB_END_DATE":"2019-05-20 00:00:00.0", "PRB_POST_DATE":"2019-05-20 01:47:25.0", "PRB_START_DATE":"2019-05-20 00:00:00.0", "PRB_VIEW":"0", "PRB_ID":"PBENSTD2JI93", "PPA_EMAIL":"admin", "PRB_CONTENT":"hello"}, {"PRB_INDEX":"143", "PRB_RECOMMEND":"0", "PPA_ID":"2ZORUAF7I0JW", "PRB_TITLE":"hi", "PRB_END_DATE":"2019-05-20 00:00:00.0", "PRB_POST_DATE":"2019-05-20 01:39:40.0", "PRB_START_DATE":"2019-05-20 00:00:00.0", "PRB_VIEW":"0", "PRB_ID":"W5A7TT3BFC9E", "PPA_EMAIL":"admin", "PRB_CONTENT":"hi"}
		 * 		{
		 * "readcount":"17975",
		 *  "addr1":"서울특별시 마포구 독막로3길 6",
		 *   "contentid":"849533",
		 *    "firstimage2":"http",
		 *     "title":"감싸롱",
		 *      "areacode":"1",
		 *       "createdtime":"20091030120628",
		 *        "mapy":"37.5486052210",
		 *         "contenttypeid":"39",
		 *          "mapx":"126.9165993920",
		 *           "zipcode":"04047",
		 *            "cat2":"A0502",
		 *             "cat3":"A05020900",
		 *              "modifiedtime":"20190208105326",
		 *               "cat1":"A05",
		 *                "mlevel":"6",
		 *                 "sigungucode":"13",
		 *                  "tel":"02-337-9378",
		 *                   "firstimage":"http://tong.visitkorea.or.kr/cms/resource/94/2025294_image2_1.jpg"
		 *                   }
		 * 
		 * 
		 
		//String ab = "{\"hi\":\"HI\", \"Qi\":\"QI\"}";
		JSONParser jsonparser = new JSONParser();
		JSONObject jsonobject = (JSONObject) jsonparser.parse(test2);
		
		System.out.println("jsonobject"+ jsonobject.toJSONString());
		System.out.println("jsonobject"+ jsonobject.toString());
		System.out.println("jsonobject"+ jsonobject);
		String[] recode_split = recode.toString().split("=");
		
		for(int i=0;i<recode_split.length;i++) {
			System.out.println("???"+recode_split[i] +i+"번방");
			//StringBuffer a= recode.toString();	
		}
		
		 String Test = "[{\"TV\":\"3d tv\"}]";
		   try {
	            mArray = new JSONArray(Test);
	        } catch (JsonGenerationException e) {
	            e.printStackTrace();
	        }
		//여기서 에러 
		 
		return "[{\"url\":\"'http://192.168.0.52:9080/SpringNoMavenProj/Images/1.png',text:'1번 이미지'\"},"
		+ "{url:'http://192.168.0.52:9080/SpringNoMavenProj/Images/2.png',text:'2번 이미지'},"
		+ "{url:'http://192.168.0.52:9080/SpringNoMavenProj/Images/3.png',text:'3번 이미지'},"
		+ "{url:'http://192.168.0.52:9080/SpringNoMavenProj/Images/4.png',text:'4번 이미지'},"
		+ "{url:'http://192.168.0.52:9080/SpringNoMavenProj/Images/5.png',text:'5번 이미지'},"
		+ "{url:'http://192.168.0.52:9080/SpringNoMavenProj/Images/6.png',text:'6번 이미지'},"
		+ "{url:'http://192.168.0.52:9080/SpringNoMavenProj/Images/7.png',text:'7번 이미지'},"
		+ "{url:'http://192.168.0.52:9080/SpringNoMavenProj/Images/8.png',text:'8번 이미지'},"
		+ "{url:'http://192.168.0.52:9080/SpringNoMavenProj/Images/9.png',text:'9번 이미지'},"
		+ "{url:'http://192.168.0.52:9080/SpringNoMavenProj/Images/10.png',text:'10번 이미지'}]";
		
		//
		System.out.println("recode :::::"+JSONArray.toJSONString(recode));
		return JSONArray.toJSONString(recode);//파싱이 저절로 오류가 난다 
		//return "[{\"hi\":\"hi\"}]";
		 
	}//pickRoad
		*/
	
	//앨범다운관리
	@RequestMapping(value = "/admin/albumDown.pic")
	public String albumDown(@RequestParam Map map) {
		return "admin/admin_albumDown.admin";
	}//albumDown
	
	//문의 관리
	@RequestMapping(value = "/admin/qna.pic")
	public String qna(@RequestParam Map map,Model model) {
		List<QuestionDTO> list = questionService.selectList(map);
		
		model.addAttribute("list",list);
		
		map.put("admin", "문의관리");
		
		return "admin/admin_qna.admin";
	}//qna
	
	//신고함
	@RequestMapping(value = "/admin/report.pic")
	public String report(@RequestParam Map map) {
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
		String text = map.get("n_index").toString();
		String text2[] = text.split(",");
		System.out.println(text2[0]);
		System.out.println(text2);
		System.out.println(text2.length);
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
		return "admin/admin_recyclebin.admin";
	}//recyclebin

	
}//AdminController