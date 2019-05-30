package com.kosmo.pickpic.service.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.pickpic.service.PickpicAccountDTO;
import com.kosmo.pickpic.service.impl.AdminServiceImpl;
import com.kosmo.pickpic.service.impl.PickpicAccountServiceImpl;

@Controller
public class AndroidController {
   @Resource(name = "accountService")
   private PickpicAccountServiceImpl accountService;

   @Resource(name = "adminService")
   private AdminServiceImpl adminService;

   @ResponseBody
   @RequestMapping(value = "/android/SignUp.do", produces = "application/json;charset=utf-8")
   public JSONObject json() {
      // json-simple 라이브러리 추가 필요(JSON 객체 생성)
      JSONObject jsonMain = new JSONObject(); // json 객체
      // {변수명:값, 변수명:값}
      // {sendData:[{변수명:값},{변수명:값},...]}
      List<PickpicAccountDTO> items = adminService.pickPicAccountAll();
      JSONArray jArray = new JSONArray(); // json배열

      for (int i = 0; i < items.size(); i++) {
         PickpicAccountDTO dto = items.get(i);
         JSONObject row = new JSONObject();
         // json객체.put("변수명",값)
         row.put("ppa_email", dto.getPpa_email());
         // 배열에 추가
         // json배열.add(인덱스,json객체)
         jArray.add(i, row);

//            private String ppa_id;
//           private String ppa_email;
//           private String ppa_password;
//           private String ppa_nickname;
//           private String ppa_join_date;
//           private String ppa_type;
//           private String ppa_token;
//           private String ppa_profile_path;
//           private String ppa_index;
      }
      // json객체에 배열을 넣음
      jsonMain.put("sendData", jArray);

      return jsonMain;
   }

   @RequestMapping(value = "/android/Login.and")
   @ResponseBody
   public boolean login(HttpServletRequest request) throws Exception {
      Map map = new HashMap<String, String>();
      map.put("ppa_email", request.getParameter("ppa_email"));
      map.put("ppa_password", request.getParameter("ppa_password"));
      return accountService.isMember(map);
   }

   @RequestMapping(value = "/android/LoginWeb.and")
   public String loginWeb(HttpServletRequest request) throws Exception {
      Map map = new HashMap<String, String>();
      map.put("ppa_email", request.getParameter("ppa_email"));
      map.put("ppa_password", request.getParameter("ppa_password"));

      // 시큐리티 강제 주입
      // 사용자의 아이디, 비밀번호, ROLE_ 로 시작 하는 권한 정보를 가지고 온다.
      Authentication authentication = new UsernamePasswordAuthenticationToken(request.getParameter("ppa_email"),request.getParameter("ppa_password"));

      SecurityContext securityContext = SecurityContextHolder.getContext();
      securityContext.setAuthentication(authentication);
      HttpSession session = request.getSession(true);

      accountService.isMember(map);
      // 로그인 정보 저장
      accountService.loginHistoryInsert(map);
      // 아이디와 닉네임을 세션에 저장
      PickpicAccountDTO user = accountService.oneUser(map);
      session.setAttribute("ppa_id", user.getPpa_id());
      session.setAttribute("ppa_email", user.getPpa_email());
      session.setAttribute("ppa_nickname", user.getPpa_nickname());

      return "home.tiles";
   }
   
   @RequestMapping(value = "/android/saveToken.and")
   @ResponseBody
   public void saveToken(HttpServletRequest request) throws Exception {
      Map map = new HashMap<String, String>();
      map.put("ppa_email", request.getParameter("ppa_email"));
      map.put("ppa_password", request.getParameter("ppa_password"));
      map.put("ppa_token", request.getParameter("ppa_token"));
      accountService.updateToken(map);
   }
   
   @RequestMapping(value = "/android/QnAFCM.and")
   @ResponseBody
   public void qnaFCM(HttpServletRequest request) throws Exception {
      System.out.println(request.getParameter("Token"));
      
      //fcm설정. 바꾸지 말것
      final String apiKey = "AAAAap5K-lo:APA91bFHi4YM7yHDY2h4EJ5smZS8trpfL98NIr8rc7X7zZiAoEew9Ejhd27qwB1DHpEOJgSGLoX9NybDvpCO7c9053V2gjGCR1fdY2HjOHXcbvPKgzE1-CDcuywEzA9d2aQuJk0WIB5U";
        URL url = new URL("https://fcm.googleapis.com/fcm/send");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setDoOutput(true);
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Authorization", "key=" + apiKey);
        conn.setDoOutput(true);
        
//        String userToken = 

        // 이렇게 보내면 주제를 ALL로 지정해놓은 모든 사람들한테 알림을 날려준다.
//        String input = "{\"notification\" : {\"title\" : \"여기다 제목 넣기 \", \"body\" : \"여기다 내용 넣기\"}, \"to\":\"/topics/ALL\"}";
        
        // 이걸로 보내면 특정 토큰을 가지고있는 어플에만 알림을 날려준다  위에 둘중에 한개 골라서 날려주자
        String input = "{\"notification\" : {\"title\" : \" 여기다 제목넣기 \", \"body\" : \"여기다 내용 넣기\"}, \"to\":\"e4rY-LOY3J0:APA91bHUggV89t1oJVNc0t3-ZJjeUqf1gV-khDUXer56Xy_7QzokPuRVtxCbyKfiZ4uQVILsI9UKf5X2anvaRZpHsdUuiRTlkDRiGgjTngJKncrgH1YbIpFqikA9N6EZpvPWpZlJi_AR\"}";

        OutputStream os = conn.getOutputStream();
        
        // 서버에서 날려서 한글 깨지는 사람은 아래처럼  UTF-8로 인코딩해서 날려주자
        os.write(input.getBytes("UTF-8"));
        os.flush();
        os.close();

        int responseCode = conn.getResponseCode();
        System.out.println("\nSending 'POST' request to URL : " + url);
        System.out.println("Post parameters : " + input);
        System.out.println("Response Code : " + responseCode);
        
        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();
        // print result
        System.out.println(response.toString());
   }
}