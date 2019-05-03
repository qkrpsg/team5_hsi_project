package com.kosmo.pickpic.service.web;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
			
			
//	System.out.println("hi"+map.get("contenttypeid"));
//	System.out.println("hi"+map.get("areacode"));
//	System.out.println("hi"+map.get("numOfRows"));
	
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
		JSONObject jsonobject = (JSONObject) jsonparser.parse(result.toString());
		System.out.println("jsonobject:"+jsonobject);
		
		JSONObject json = (JSONObject) jsonobject.get("response");
		
		json = (JSONObject) json.get("body");
		json = (JSONObject) json.get("items");
		JSONArray list = (JSONArray) json.get("item");
		//System.out.println("list1:"+list);//여기까진 문제가 없는듯 하다
		
		/*BufferedWriter fw = new BufferedWriter(
				new OutputStreamWriter(
					new FileOutputStream(session.getServletContext().getRealPath("/resources/update")+File.separator+".csv"),"MS949"));
							//+File.separator+map.get("contenttype")+"_"+map.get("areacode")+".csv"),"MS949"));
		
		fw.flush();
		fw.close();*/
		//return jsonobject.toJSONString();
		//System.out.println("JSONArray.toJSONString(list)::::"+JSONArray.toJSONString(list));//여기도 문제가 없다
		return JSONArray.toJSONString(list);
		
		//return json.toJSONString();
		//return "friends/map.tiles";
	}//map
	
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
	@RequestMapping("/friends/editor_popup.pic")
	public String albumOption() throws Exception {
		return "friends/editor_popup";
	}
}//FriendsController
