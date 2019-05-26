package com.kosmo.pickpic.service.web;

import java.util.List;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.pickpic.service.PickpicAccountDTO;
import com.kosmo.pickpic.service.impl.AdminServiceImpl;
import com.kosmo.pickpic.service.impl.PickpicAccountServiceImpl;

@Controller
public class AndroidController {
	@Resource(name="accountService")
	private PickpicAccountServiceImpl accountService;

	@Resource(name="adminService")
	private AdminServiceImpl adminService;
	
	@ResponseBody
	@RequestMapping(value="/android/SignUp.do",produces="application/json;charset=utf-8")
    public JSONObject json(){
        // json-simple 라이브러리 추가 필요(JSON 객체 생성)
        JSONObject jsonMain = new JSONObject(); // json 객체
        // {변수명:값, 변수명:값}
        // {sendData:[{변수명:값},{변수명:값},...]}
        List<PickpicAccountDTO> items = adminService.pickPicAccountAll();
        JSONArray jArray = new JSONArray(); // json배열
        
        for(int i=0; i<items.size(); i++){
            PickpicAccountDTO dto = items.get(i);
            JSONObject row = new JSONObject();
            // json객체.put("변수명",값)
            row.put("ppa_email", dto.getPpa_email());
            // 배열에 추가
            // json배열.add(인덱스,json객체)
            jArray.add(i,row);
            
//            private String ppa_id;
//        	private String ppa_email;
//        	private String ppa_password;
//        	private String ppa_nickname;
//        	private String ppa_join_date;
//        	private String ppa_type;
//        	private String ppa_token;
//        	private String ppa_profile_path;
//        	private String ppa_index;
        }
        // json객체에 배열을 넣음
        jsonMain.put("sendData", jArray);
        
        
        return jsonMain;
    }

}
