package com.kosmo.pickpic.service.web;

import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONAware;
import org.json.simple.JSONObject;
import org.json.simple.JSONStreamAware;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.mvc.method.annotation.JsonViewRequestBodyAdvice;
import org.springframework.web.servlet.mvc.method.annotation.JsonViewResponseBodyAdvice;

import com.amazonaws.services.appstream.model.Application;
import com.amazonaws.services.devicefarm.model.Upload;
import com.kosmo.pickpic.service.FilterDTO;
import com.kosmo.pickpic.service.PickRoadBoardDTO;
import com.kosmo.pickpic.service.PickRoadBoardService;
import com.kosmo.pickpic.service.impl.FilterDAO;
import com.kosmo.pickpic.service.impl.FilterServiceImpl;
import com.kosmo.pickpic.service.impl.PickPlaceBoardServiceImpl;
import com.kosmo.pickpic.service.PickpicAccountDTO;
import com.kosmo.pickpic.service.impl.AdminServiceImpl;
import com.kosmo.pickpic.service.impl.PickRoadBoardDAO;
import com.kosmo.pickpic.service.impl.PickRoadBoardServiceImpl;
import com.kosmo.pickpic.util.DTOUtil;
import com.kosmo.pickpic.util.FileUpDownUtils;

import io.netty.handler.codec.http.multipart.FileUpload;



@Controller
public class FriendsController {
	// 서비스 주입
	@Resource(name="prbService")
	private PickRoadBoardServiceImpl prbService;
	
	@Resource(name = "fService")
	private FilterServiceImpl dao_filter;
	
	@Resource(name="adminService")
	private AdminServiceImpl adminService;
	
	@Resource(name="ppbService")
	private PickPlaceBoardServiceImpl ppb_service;
	
	
	
	
	
	//픽플레이스 리스트 페이지
	@RequestMapping("/friends/place_filter.pic")
	public String place_list(@RequestParam Map map, Model model,Principal principal) throws Exception {
		//여기서 작업 시작
		map.put("ppa_email",principal.getName());
		
		List<Map> list = ppb_service.selectList(map);
		model.addAttribute("list",list);
		
		
		System.out.println("왜2개임?"+list.toString());
		System.out.println("사이즈는?"+list.size());
		
		
		
		return "friends/place_filter.tiles";
		//return "friends/place.tiles";//나중에 이걸로 바꾸자
	}// place
	// 픽플레이스
	@RequestMapping("/friends/place.pic")
	public String place(@RequestParam Map map, Model model,Principal principal) throws Exception {
		//여기서 작업 시작
		map.put("ppa_email",principal.getName());
		List<Map> list_filter=dao_filter.albumDownFilterName(map);
		model.addAttribute("list_filter", list_filter);
		
		return "friends/place_map.tiles";
		//return "friends/place.tiles";//나중에 이걸로 바꾸자
	}// place
	//맵에서 작성 페이지로 이동합니다. 값을 가지고 이동만!
	@RequestMapping("/friends/place_write.pic")
	public String place_write(@RequestParam Map map, Model model,Principal principal) throws Exception {
		//여기서 작업 시작
		map.put("ppa_email",principal.getName());
		List<Map> list_filter=dao_filter.albumDownFilterName(map);
		model.addAttribute("list_filter", list_filter);
		
		System.out.println(map.toString());
		model.addAttribute("ppb_latitude",map.get("ppb_latitude"));
		model.addAttribute("ppb_longitude",map.get("ppb_longitude"));
		model.addAttribute("ppb_addr1",map.get("ppb_addr1"));

		return "friends/place_write.tiles";//작성 완료 후 다시 리스트로 
	}// place
	
	//이제 DB에 저장하고 리스트 페이지로 이동 file 저장
	@RequestMapping("/friends/file.pic")
	public String place_list(@RequestParam Map map,HttpServletRequest req,Principal principal,Model model) throws Exception {
			
			System.out.println(map.toString());
            //파일 객체 생성
			String path = req.getServletContext().getRealPath("/resources/update/"+map.get("ppb_image_path"));
            File file = new File("C:\\Users\\KSM16\\Downloads\\"+map.get("ppb_image_path"));
            File file2 = new File(path);
            BufferedImage bi = null;
            try {
                bi = ImageIO.read(file);
                ImageIO.write(bi, "jpg", file2);
            }catch (IOException e) {}
            
            map.put("ppa_email", principal.getName());
            map.put("ppb_image_path", "/resources/update/"+map.get("ppb_image_path"));
            map.put("f_name",map.get("f_name").toString().toLowerCase());
            map.put("ppb_latitude", map.get("ppb_latitude").toString().substring(0,9));
            map.put("ppb_longitude", map.get("ppb_longitude").toString().substring(0,9));
            
            //이제 인설트 문 만들자
            int a = ppb_service.insert(map);
            if(a == 1) {
            	System.out.println("인설트 성공");
            }
            
            
            for(int i=0;i< 9999;i++) {
            	System.out.println("");
            }
            List<Map> list = ppb_service.selectList(map);
    		model.addAttribute("list",list);
    		
            
            
            
         ///   return "friends/place_filter.tiles";
            return "home.tiles";
            
		//return "friends/place_write.tiles";
	}// place

	
	
	// 필터정보
	@RequestMapping("/friends/filter.pic")
	public String filter(@RequestParam Map map,Model model) throws Exception {
		
		//filter 테이블 전부 가져오기
		List<Map> list = dao_filter.filterList();
		model.addAttribute("list",list);
		
		System.out.println(list.toString());
		return "friends/filter.tiles";
	}//filter
	
	//Pay test
	@RequestMapping("/pay/pay.pic")
	public String pay(@RequestParam Map map,Principal principal,HttpSession session,Model model) throws Exception{
		//pay  SelectFilter_buy ppa_email f_name
		//HttpSecurity sec 넣으면 에러
		//http.antMatcher("/d").authorizeRequests().antMatchers("").permitAll().and().headers().frameOptions().disable();
		map.put("ppa_email",session.getAttribute("ppa_email"));
		
		
		FilterDTO a = dao_filter.selectFilter_buy(map);
		List<Map> user = new Vector<Map>();
		user.add(DTOUtil.convertDTOToMap(a));
		model.addAttribute("list",user);
		return "test/Pay.tiles";
	}//pay
	
	
	@RequestMapping("/pay/pay_insert.pic")
	public String pay_test(@RequestParam Map map,Model model,HttpSession session) throws Exception{//3가지 컬럼을 만들어서 넣는다   테스트용
		map.put("ppa_email", session.getAttribute("ppa_email"));
		System.out.println("map+"+map.toString());
		System.out.println("들어옵니다");
		
		int a = dao_filter.addPayment(map);
		
		if(a == 1) {
			System.out.println("인설트 성공");
		}
		
		return "home.tiles";//
	}//md
	
	
	
	//Map 이동
	@RequestMapping("/friends/map.pic")
	public String map(@RequestParam Map map,Model model,HttpSession session) throws Exception{//3가지 컬럼을 만들어서 넣는다   테스트용
	
		return "friends/map.tiles";//
	}//map
	

		
	
	//ajax 처리 /tourapi/download_csv.pic
	@ResponseBody
	@RequestMapping(value="/tourapi/download_csv.do",produces="text/html; charset=UTF-8")
	public String tourapi(@RequestParam Map map,Model model,HttpSession session) throws Exception{
	String key = "A2dHFUxH72X%2BT%2Br66B8tkGckWP9SAktj5ZoV43XBB2OH2T5TA6r8W9VN%2FL%2F1nIc5I3SpAuLm%2FtBIpLVGb2jfvg%3D%3D";
	
	String addr ="http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?"
		+ "ServiceKey="+key
		
		+ "&contentTypeId="+map.get("contenttypeid") // 파라미터로 받자
		+ "&areaCode="+map.get("areacode") 	 // 파라미터로 받자
		+ "&sigunguCode="
		+ "&cat1=&cat2=&cat3="
		+ "&listYN=Y"
		+ "&MobileOS=ETC"
		+ "&MobileApp=TourAPI3.0_Guide&arrange=A"
		+"&_type=json"                  // 나중 에 제이슨타입으로 결과를 받아보자
		+ "&numOfRows="+map.get("numOfRows")  // 파라미터로 받자  총 갯수
		+ "&pageNo=1"; 
			
			
//			System.out.println("hi"+map.get("contenttypeid"));
//			System.out.println("hi"+map.get("areacode"));
//			System.out.println("hi"+map.get("numOfRows"));
			
			//&MobileOS=AND&MobileApp=appName
			/*  서비스 인증키 
				컨텐츠 아이디
				영역 코드
				시구군 코드
				대 중 소 분류
				목록 구분 (Y=목록 , N=개수)
				IOS AND WIN ETC ETC 를 써보자
				//서비스명 = 어플명
				정렬구분 (A= 제목순, B= 조회순 , C=수정일순,D=생성일순)
				numOfRows  총 페이지 수 
				pageNo=1 첫 페이지부터 ㄱ
			 */
				URL url = new URL(addr);//jsp로 보낼 textdata
				//System.out.println("url::::"+url.toString());
				InputStream in = url.openStream();
				//System.out.println("inininin"+in);
				StringBuffer result = new StringBuffer();
				BufferedReader reader = new BufferedReader(new InputStreamReader(in,"utf-8"));
				String data;
				while((data=reader.readLine())!=null) {
					result.append(data);
					System.out.println("나오냐?:"+result.toString()+"\r\n");
				}
				reader.close();
				in.close();
				System.out.println("스트링하곤 다른거냐?"+result.getClass().getSimpleName());
				//ajax 가 아니라 오류나나보다?  
				JSONParser jsonparser = new JSONParser();
				//System.out.println("hello"+result.toString());  response가 달려있는 객체
				JSONObject jsonobject = (JSONObject) jsonparser.parse(result.toString());
				//System.out.println("jsonobject:"+jsonobject);
				
				JSONObject json = (JSONObject) jsonobject.get("response");
				
				json = (JSONObject) json.get("body");
				json = (JSONObject) json.get("items");
				JSONArray list = (JSONArray) json.get("item");
				//System.out.println("list1:"+list);//여기까진 문제가 없는듯 하다
			
				System.out.println("json 오브젝트냐?"+json.getClass().getSimpleName());
				/*BufferedWriter fw = new BufferedWriter(
						new OutputStreamWriter(
							new FileOutputStream(session.getServletContext().getRealPath("/resources/update")+File.separator+".csv"),"MS949"));
									//+File.separator+map.get("contenttype")+"_"+map.get("areacode")+".csv"),"MS949"));
				[ {"name" : "geon"}, {"age" : 30}, {"sex" : "male"}]

				
				fw.flush();
				fw.close();*/
				//return jsonobject.toJSONString();
				//System.out.println("JSONArray.toJSONString(list)::::"+JSONArray.toJSONString(list));//여기도 문제가 없다
				//,{mapy : \"37.485307\"}, {mapx : \"126.882129\"}
				//return 	"[{\"mapy\" : \"37.481868\",\"mapx\" : \"126.883202\"}]"; 
				System.out.println("list 타입이 뭐냐?"+list.getClass().getSimpleName());
				System.out.println("list 내용물은?1"+list.toJSONString());
				System.out.println("list 내용물은?STR::"+list.toString());
				
				return JSONArray.toJSONString(list);
				
				//return json.toJSONString();
				//return "friends/map.tiles";
			}//map
			
	
	
		//UI 작업 때문에 일부러 남겨둠 ! 
		@RequestMapping("/friends/test.pic")
		public String user_UI() throws Exception{
		
			
			return "friends/user_end.tiles";//
		}//map
		
		
		@ResponseBody
		@RequestMapping(value="/mb/d.do",produces="text/html; charset=UTF-8")
		//@RequestMapping("/mb/d.do")
		public String ttest(@RequestParam Map map,Model model,HttpSession session) throws Exception{
			
			System.out.println("들어옵니꽈?"+map.toString());
			PickpicAccountDTO oneUser = adminService.oneUser(map);
			
			List<Map> user = new Vector<Map>();	
			Map record = new HashMap();
			record.put("ppa_email", oneUser.getPpa_email());
			record.put("ppa_nickname", oneUser.getPpa_nickname());
			record.put("ppa_join_date", oneUser.getPpa_join_date().toString().substring(0, 10));
			record.put("ppa_type", oneUser.getPpa_type());
			record.put("ppa_profile_path", oneUser.getPpa_profile_path());
			user.add(record);
			System.out.println("list::"+user.toString());
			System.out.println(JSONArray.toJSONString(user));
			
			return JSONArray.toJSONString(user);
			
		}
		
		
		
		
		@RequestMapping("/friends/write.pic")
		public String write(@RequestParam Map map,Model model) throws Exception{
		
			//System.out.println("이건 찍히나요?"+map.size());
			//JSONObject
			//JSONParser
			//JSONAware
			//JSONStreamAware
			//JSONArray
			//JSONValue
			//JsonViewRequestBodyAdvice
			//JsonViewResponseBodyAdvice
			//.stringify()
			/*System.out.println("테스트 값0004534 : "+map.get("test"));
			
			System.out.println("인풋 값 : "+map.get("title1"));*/
			
			/*
			 * {
			 * readcount:18777,
			 * addr2:(수유동),
			 * addr1:서울특별시 강북구 노해로 13,
			 * contentid:1052741,
			 * firstimage2:http://tong.visitkorea.or.kr/cms/resource/34/1181034_image3_1.jpg,4
			 * title:가문,
			 * areacode:1,
			 * createdtime:20100630171221,
			 * mapy:37.6368246468,
			 * contenttypeid:39,
			 * mapx:127.0226983297,
			 * zipcode:01080,
			 * cat2:A0502,
			 * cat3:A05020400,
			 * modifiedtime:20181107095026,
			 * cat1:A05,
			 * mlevel:6,
			 * sigungucode:3,
			 * tel:02-990-0107,
			 * firstimage:http://tong.visitkorea.or.kr/cms/resource/34/1181034_image2_1.jpg}
			 */
			
			
			
			String[] a;
			List<Map<String,String>> TitleList = new Vector<Map<String,String>>();
			for(int j=1;j < map.size()+1;j++) {
				Map<String,String> TitleList2 = new HashMap<String, String>();
				String test = map.get("title"+j).toString();
				test=test.replace("{","").replace("}","");
				String[] test2=test.split(",");
				List<String> list = new Vector<String>();
				for(int i=0;i < test2.length;i++) {
					if(!(i==4 || i==test2.length-1)) {
						String[] test3=test2[i].split(":");
						String item = "\""+test3[0]+"\""+":"+"\""+test3[1]+"\"";
						list.add(item);					
					}
					else {
						int end=test2[i].indexOf(":");
						String item="\""+test2[i].substring(0,end)+"\""+":"+"\""+test2[i].substring(end+1)+"\"";
						list.add(item);	
					}
				}
				String jsonString=list.toString().replace("[","{").replace("]","}");
				System.out.println("jsonString::::"+ jsonString);
				System.out.println("jsonString::::"+ jsonString.toString());
				System.out.println("jsonString::::"+ jsonString.getClass().getSimpleName());
				
				
				
				JSONParser jsonparser = new JSONParser();
				JSONObject jsonobject = (JSONObject) jsonparser.parse(jsonString);
				//System.out.println("55555:"+jsonobject.get("addr1"));
				//System.out.println("뭘까요?"+jsonobject.get("title").toString());
				TitleList2.put("prp_title",jsonobject.get("title").toString());
				TitleList2.put("addr",jsonobject.get("addr1").toString());
				TitleList2.put("prp_contentid",jsonobject.get("contentid").toString());
				
				if(jsonobject.get("firstimage") != null) {
					TitleList2.put("prp_image_path",jsonobject.get("firstimage").toString());
					//System.out.println("이미지 원이다");
				}else if(jsonobject.get("firstimage2") != null) {
					TitleList2.put("prp_image_path",jsonobject.get("firstimage2").toString());
					System.out.println("이미지 투다");
				}else {
					TitleList2.put("prp_image_path", "/pickpic/resources/images/main_image6.jpg");
				}
				TitleList.add(TitleList2);
				
			}
			
			/*int count = 1;
			for(Map map :  TitleList) {
				map.set("count", count);
				serv.insert(map);
				count++;
			}
			*/
			//jsList
			model.addAttribute("data",TitleList);
			//.addAttribute("addr1",Addr1List);
			
			
			//return "friends/map";
			return "friends/mapWrite.tiles";
		}
	
		
		
		
		//notice 작성 완료 후 뿌려줄 페이지
		@RequestMapping("/friends/route.pic")
		public String textarea(@RequestParam Map map, ServletRequest request,Principal principal,Model model) throws Exception{
			System.out.println("noInsert"+map.get("noInsert"));
			if(map.get("noInsert") == null) {
				System.out.println("맵에 뭐가 ? : " + map.toString());
				
				List<Map<String, String>> placeList = new Vector<Map<String, String>>();
				Map<String, String> placeMap = new HashMap<String, String>();
				
				Map<String, String> boardMap = new HashMap<String, String>();
				placeMap.put("ppa_email",principal.getName());
				String[] strArr = map.toString().split(",");
				boolean flag = false;
				for(String str :  strArr) {
					//System.out.println(str);
					if(str.split("=").length == 3) {
						flag = true;
						placeMap = new HashMap<String, String>();
						placeMap.put(str.split("=")[1].substring(1),str.split("=")[2]);
						continue;
					}///if
					if(flag) {
						if(str.split("=")[1].endsWith("}")) {
							flag= false;
							placeMap.put(str.split("=")[0].trim(), str.split("=")[1].substring(0, str.split("=")[1].length()-1));
							
							placeList.add(placeMap); continue;}
						else {
							placeMap.put(str.split("=")[0].trim(), str.split("=")[1]);continue;}
					}//flag true
					
					if(str.split("=")[1].endsWith("}")){
						boardMap.put(str.split("=")[0].trim(), str.split("=")[1].substring(0, str.split("=")[1].length()-1));
					}else {
						if(str.split("=")[0].trim().equals("prb_start_date")) {
							boardMap.put(str.split("=")[0].trim(), str.split("=")[1].split(" - ")[0]);
							boardMap.put("prb_end_date", str.split("=")[1].split(" - ")[1]);
							continue;
						}//start
							boardMap.put(str.split("=")[0].trim(), str.split("=")[1]);
					}//else
				}//for
				
					boardMap.put("ppa_email",principal.getName());
				//System.out.println("여기도 들어옵니꽈?"+principal.getName());
				//System.out.println(" placeMap : "+ placeMap.toString());
				
				//System.out.println(" placeList : " + placeList.toString());
				
				//System.out.println(" boardMap : " + boardMap.toString());
				
				//System.out.println("placeMap   ddddddd" + placeMap.get("prp_title"));
				
				//System.out.println("placeList: " + placeList.toString());
				
				int prp_order = 1;
				prbService.pickroadBoardInsert(boardMap);
				for(Map mb : placeList) {
					mb.put("prp_order", prp_order);
					prbService.pickRoadPlaceInsert(mb);
					prp_order++;
				}
			
			
				List<Map> recode = prbService.pickRoadBoardSelectAll(null);
				System.out.println("사이즈"+recode.size());
				model.addAttribute("recode",recode);
				System.out.println("첫 쿼리문 성공 ~~"+recode.toString());
				return "friends/user_end.tiles";
			}//if 끝
			
			
			List<Map> recode = prbService.pickRoadBoardSelectAll(null);
			System.out.println("null 값이 아닐 때"+recode.toString());
			model.addAttribute("recode",recode);
			/*
			 {
		o	  PRB_INDEX=21,                        색인
		o	  PRB_RECOMMEND=0,                     추천수
			  PPA_ID=2ZORUAF7I0JW,                 사용자 고유번호 
		o	  PRB_TITLE=qqq,                       제목
			  PRB_END_DATE=2019-05-13 00:00:00.0,  끝나는 날짜
		o	  PRB_POST_DATE=2019-05-13 05:30:23.0, 등록일
			  PRB_START_DATE=2019-05-13 00:00:00.0, 시작 날짜
		o	  PRB_VIEW=0, 						       조회수
			  PRB_ID=WD0QW6GGM1E4,                 픽로드 고유번호
		o	  PRB_CONTENT=qqqq},                   내용
		o	  PRP_IMAGE_PATH=http://tong.visitkorea.or.kr/cms/resource/90/1290490_image2_1.jpg
			*/
			
			/*{
				prp_title=가문, 
				prp_contentid=1052741, 
				addr=서울특별시 강북구 노해로 13, 
				prp_image_path=http://tong.visitkorea.or.kr/cms/resource/34/1181034_image2_1.jpg
			}
			  */
			/*
			for(int i = 0; i < map.size()-4;i++) {
				data_re =  map.get("data"+i).toString();
				String a = data_re.replace("=","\":");
				String[] h = a.split(regex)
			}*/
					
			/*
			Map<String,String> m2 = new HashMap<String,String>();
			Set keys = map.keySet();
			boolean flag = false;
			for(Object key: keys) {
				System.out.println(key.toString());
				if(key.equals("prd_title")) {
					flag=true;
				};//if
				if(flag) {
					m2.put(key.toString(), map.get(key).toString());
				}
			}
			JSONParser jsonparser = new JSONParser();
			
			*/
			//JSONObject jsonobject;  
			
			//(JSONObject) jsonparser.parse(jsonString);
			
			return "friends/user_end.tiles";
		}
		
		
		
		@RequestMapping("/friends/view.pic")
		public String view(@RequestParam Map map,Model model) throws Exception {
			int update =  prbService.pickRoadBoardUpdate(map);
			//UPDATE 문 하고  상세보기로  SELECT ONE
			List<Map> recode = prbService.pickRoadBoardSelectOne(map);
			List<Map> recode2 = prbService.pickRoadBoardSelectOne2(map);
			model.addAttribute("recode",recode);
			model.addAttribute("recode2",recode2);
			return "friends/view.tiles";
		}// 
		
		
		
		
	

	// 앨범다운
	@RequestMapping("/friends/albumDown.pic")
	public String albumDown() throws Exception {
		return "friends/albumDown.tiles";
	}
	//앨범다운-옵션
	@RequestMapping("/friends/albumEditor.pic")
	public String albumOption(@RequestParam Map map, Model model,Principal principal) throws Exception {
		
		map.put("ppa_email",principal.getName());
		List<Map> list_filter=dao_filter.albumDownFilterName(map);
		model.addAttribute("list_filter", list_filter);
		return "friends/albumEditor.tiles";
	}
	
	
	//연습
	@RequestMapping("/friends/search.pic")
	public String search() throws Exception {
		return "friends/search.tiles";
	}
	
	
	
}//FriendsController
