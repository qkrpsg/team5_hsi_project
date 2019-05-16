package com.kosmo.pickpic.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kosmo.pickpic.service.PickpicAccountDTO;
import com.kosmo.pickpic.service.PickpicAccountService;
import com.kosmo.pickpic.service.web.MailUtils;
import com.kosmo.pickpic.service.web.TempKey;

//

@Repository
public class PickpicAccountDAO implements PickpicAccountService {
	// SqlSessionTemplate객체 주입]
	@Resource(name = "template")
	private SqlSessionTemplate template;
	
	@Autowired
	private JavaMailSender mailSender;

	// 로그인 용]
	@Override
	public boolean isMember(Map map) {
		return (Integer) template.selectOne("PickpicAccountIsMember", map) == 0 ? false : true;
	}

	@Override
	public boolean isEmail(Map map) {
		return (Integer) template.selectOne("PickpicAccountIsEmail", map) == 0 ? false : true;
	}

	@Override
	public boolean isAuthAbled(Map map) {
		return (Integer)template.selectOne("AuthSecurityIsAble", map) == 0 ? false : true;
	}

	@Override
	public PickpicAccountDTO oneUser(Map map) {
		return template.selectOne("PickpicAccountUser", map);
	}

	@Override
	public int accountInsert(Map map) {
		return template.insert("PickpicAccountInsert", map);
	}

	@Override
	@Transactional
	public int securityInsert(Map map) {
		int result;
		String authkey = new TempKey().getKey(30, false);
		
		map.put("as_key", authkey);
		result = template.insert("AuthSecurityInsert", map);
		
		try {
			MailUtils sendMail = new MailUtils(mailSender);

			sendMail.setSubject("회원가입 이메일 인증");
			sendMail.setText(new StringBuffer()
					.append("<div class=\"jumbotron jumbotron-fluid\">")
					.append("<div align=\"center\" class\"container\">")
					.append("<h1>[이메일 인증]</h1>")
					.append("<p class=\"lead\">안녕하세요. <font size=\"5\" color=\"red\"><b>PICKPIC</b></font> 입니다.</font></p>")
					.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
					.append("<a href='http://localhost:8080/pickpic/user/joinConfirm.pic?ppa_email=")
					.append(map.get("ppa_email"))
					.append("&as_key=")
					.append(authkey)
					.append("&ppa_type=")
					.append(map.get("ppa_type"))
					.append("' target='_blenk'>이메일 인증 확인</a>")
					.append("</div></div>")
					.toString());
			sendMail.setFrom("Pickpic ", "맹뱀");
			sendMail.setTo((String)(map.get("ppa_email")));
			sendMail.send();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int securityUpdate(Map map) {
		return template.update("AuthSecurityUpdate", map);
	}
	
	@Override
	public int loginHistoryInsert(Map map) {
		return template.insert("LoginHistoryInsert", map);
	}
}
