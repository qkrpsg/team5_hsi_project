package com.kosmo.pickpic.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import com.kosmo.pickpic.service.FilterDTO;

public class DTOUtil {
	
	//JSONObject or JSONArray를 쓰기 전에 
	//DTO 를 Map으로 변환해주는 메서드
	//Map을 DTO로 변환해주는 메서드

	public static Map convertDTOToMap(Object obj) {
		Map map = new HashMap();
		Field[] fields = obj.getClass().getDeclaredFields();
		for(int i=0; i < fields.length; i++) {
			fields[i].setAccessible(true);
			try {
				map.put(fields[i].getName(), fields[i].get(obj));
			}catch(Exception e) {e.printStackTrace();}
		}//for
		return map;
	}//convertObjectToMap
	
	
	
	public static Object convertMapToDTO(Map<String, Object> map, Object obj) {
		String keyAttribute = null;
		String setMethodString = "set";
		String methodString = null;
		Iterator itr = map.keySet().iterator();
		
		while(itr.hasNext()) {
			keyAttribute = (String) itr.next();
			methodString = setMethodString + keyAttribute.substring(0,1).toUpperCase()
					+ keyAttribute.substring(1);
			Method[] methods = obj.getClass().getDeclaredMethods();
			for(int i = 0; i<methods.length; i++) {
				if(methodString.equals(methods[i].getName())) {
					try {
						methods[i].invoke(obj, map.get(keyAttribute));
					}catch(Exception e) {e.printStackTrace();}//catch
				}//if
			}///for
		}//while
		return obj;
	}///convert Map To DTO
	
	
   //int형도 받을 수 있도록 오버로딩
   public static String insertCommaString(int num) {
//      Vector split = new Vector();
//      while(true) {
//         split.add(num % 1000);
//         int mod = num % 1000;
//         num = num / 1000;
//         
//         if(num == 0) 
//            break;
//      }//while
//      
//      StringBuffer resultString = new StringBuffer();
//      Collections.reverse(split);
//      Iterator iter = split.iterator();
//      while(iter.hasNext()) {
//         resultString.append(iter.next()+",");
//      }//
//      return new String(resultString.deleteCharAt(resultString.length()-1));
      return String.format("%,d", num);
   }//insertCommaString

   //String 형 날짜 받아와서 출력할 형식으로 변환하기
   //제대로 된 결과가 나오지 않을 시 에러메세지와 null반환
   //ex) getStringDate("2019-04-23 00:00:00", "yyyy-MM-dd HH:mm:ss", "yy/MM/dd");
   public static String getStringDate(String dateString, String beforePattern, String resultPattern) {
      SimpleDateFormat resultSdf = new SimpleDateFormat(resultPattern);
      SimpleDateFormat parseSdf = new SimpleDateFormat(beforePattern);
      String result = null;
      try {
         result = resultSdf.format(parseSdf.parse(dateString));
      }catch(Exception e) {System.out.println("형식에 맞지 않은 String Pattern");}
      
      return result;
   }////getStringDate
   
   //필터 이름 재지정
//   public static FilterDTO reName(FilterDTO filter){
//	   if(filter.getF_name().split("--").length > 1)
//		   filter.setFilterName(filter.getF_name().split("--")[1].toUpperCase());
//	   else
//		   filter.setFilterName(filter.getF_name());
//	   
//	   return filter;
//   }
	
   //현재 날짜 기준 일주일 문자 가져오기
   public static String getNowDate() {
	   SimpleDateFormat nowDate = new SimpleDateFormat("yyyy.MM.dd");

	   Calendar c1 = Calendar.getInstance();
	   c1.add(Calendar.DAY_OF_MONTH, -1);
	   Calendar c2 = Calendar.getInstance();
	   c2.add(Calendar.DAY_OF_MONTH, -7);

	   String strToday = nowDate.format(c2.getTime()) + "-" + nowDate.format(c1.getTime());
	   return strToday;
   }
}//class
