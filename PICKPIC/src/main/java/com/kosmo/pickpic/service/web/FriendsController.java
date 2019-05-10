package com.kosmo.pickpic.service.web;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONAware;
import org.json.simple.JSONObject;
import org.json.simple.JSONStreamAware;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.JsonViewRequestBodyAdvice;
import org.springframework.web.servlet.mvc.method.annotation.JsonViewResponseBodyAdvice;

@Controller
public class FriendsController {
	// 서비스 주입

	// 픽플레이스
	/*@RequestMapping("/friends/place.pic")
	public String place() throws Exception {
		return "friends/place.tiles";
	}// place
*/
	// 필터정보
	@RequestMapping("/friends/filter.pic")
	public String filter() throws Exception {
		return "friends/filter.tiles";
	}//filter
	
	//Pay test
	@RequestMapping("/pay/pay.pic")
	public String pay() throws Exception{
		return "test/Pay.tiles";
	}//pay
	
	//Map 이동
	@RequestMapping("/friends/place.pic")
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
				return JSONArray.toJSONString(list);
				
				//return json.toJSONString();
				//return "friends/map.tiles";
			}//map
			
	
	
		//Map test 
		@RequestMapping("/friends/maptest.pic")
		public String maptest() throws Exception{
		
			return "friends/map3";//
		}//map
		
		
		
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
				JSONParser jsonparser = new JSONParser();
				JSONObject jsonobject = (JSONObject) jsonparser.parse(jsonString);
				//System.out.println("55555:"+jsonobject.get("addr1"));
				System.out.println("뭘까요?"+jsonobject.get("title").toString());
				TitleList2.put("title",jsonobject.get("title").toString());
				TitleList2.put("addr",jsonobject.get("addr1").toString());
				if(jsonobject.get("firstimage") != null) {
					TitleList2.put("firstimage",jsonobject.get("firstimage").toString());
					System.out.println("이미지 원이다");
				}else if(jsonobject.get("firstimage2") != null) {
					TitleList2.put("firstimage",jsonobject.get("firstimage2").toString());
					System.out.println("이미지 투다");
				}else {
//					TitleList2.put("firstimage", "<c:url value='/resources/images/main_image6.jpg'/>");
					TitleList2.put("firstimage", "/pickpic/resources/images/main_image6.jpg");
				}
				TitleList.add(TitleList2);
				
			}
			
			
			//jsList
			model.addAttribute("data",TitleList);
			//.addAttribute("addr1",Addr1List);
			
			
			//return "friends/map";
			return "friends/mapWrite.tiles";
		}
	
		//notice 작성 완료 후 뿌려줄 페이지
		@RequestMapping("/friends/notice.pic")
		public String textarea(@RequestParam Map map) throws Exception{
			System.out.println("아무것도 안 넣은거"+map.get("textarea"));
			System.out.println("0번 넣은거"+map.get("textarea0"));
			System.out.println("1번 넣은거"+map.get("textarea1"));
			return "friends/user_end.tiles";
		}
		
		
		
		
	//픽로드
	@RequestMapping("/friends/route.pic")
	public String route() throws Exception {
		return "friends/route.tiles";
	}// route

	// 앨범다운
	@RequestMapping("/friends/albumDown.pic")
	public String albumDown() throws Exception {
		return "friends/albumDown.tiles";
	}
	//앨범다운-팝업
	@RequestMapping("/friends/albumEditor.pic")
	public String albumOption() throws Exception {
		return "friends/albumEditor.tiles";
	}
	
	//연습
	@RequestMapping("/friends/search.pic")
	public String search() throws Exception {
		return "friends/search.tiles";
	}
	
}//FriendsController
