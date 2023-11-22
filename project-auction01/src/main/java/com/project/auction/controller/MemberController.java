package com.project.auction.controller;

import java.io.PrintWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.auction.domain.Member;
import com.project.auction.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	// 회원가입폼으로 이동
	@RequestMapping(value="memberJoin", method=RequestMethod.GET)
	public String memberJoin() {
		return "member/memberJoinForm";
	}
	// 아이디 중복체크
	@RequestMapping(value="idCheck.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> idCheck(String id) {
		boolean result = memberService.idCheck(id);
		
		Map<String, Boolean> map = new HashMap<>();
		map.put("result", result);
		
		return map;
	}
	
	// 회원가입 완료
	@RequestMapping(value="memberJoin", method=RequestMethod.POST)
	public String memberJoinProcess(Member m,
			@RequestParam("pass1") String pass,
			String mobile1, String mobile2,
			@RequestParam(required = false) String type) {
		
		String phone = mobile1 + mobile2;
		m.setPass(pass);
		m.setPhone(phone);
		m.setType(type);
		
		memberService.insertMember(m);

		return "redirect:memberLogin";
	}
	// 로그인폼으로 이동
	@RequestMapping("memberLogin")
	public String memberLogin() {
		return "member/memberLogin";
	}
	// 로그인하기
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String isLogin(String id, String pass, HttpServletResponse response,
								HttpSession session, Model model, PrintWriter out) {
		boolean isLogin = memberService.isLogin(id, pass);
		if(isLogin) {
			session.setAttribute("isLogin", isLogin);
			session.setAttribute("loginId", id);
			Member m = memberService.getMemberInfo(id);
			
			session.setAttribute("type", m.getType());
		
			return "redirect:main";
		} else {
			response.setContentType("text/html; charset=utf-8");
			out.println("<script>");
			out.println("	alert('아이디와 비밀번호가 일치하지 않습니다.');");
			out.println("	location.href='memberLogin'");
			out.println("</script>");
			return null;
		}
	}
	// 로그아웃하기
	@RequestMapping("logout")
	public String isLogout(HttpSession session) {
		session.invalidate();
		return "redirect:main";
	}
	// 정보수정폼으로 이동
	@RequestMapping("memberUpdate")
	public String memberUpdate(HttpSession session) {
		return "member/memberUpdateForm";
	}
	// 회원정보 가져오기
	@RequestMapping(value="getMemberInfo", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Member> getMemberInfo(String id) {
		Map<String, Member> param = new HashMap<>();
		param.put("member", memberService.getMemberInfo(id));
		
		return param;
	}
	// 회원정보수정
	@RequestMapping(value="memberUpdate", method=RequestMethod.POST)
	public String memberUpdate(Member m,
						@RequestParam("pass1") String pass,
						String name, String mobile1, String mobile2,
						int zipcode, String address1, String address2, String marketing,
						Model model) {
		String phone = mobile1 + mobile2;
		m.setPass(pass);
		m.setName(name);
		m.setPhone(phone);
		m.setZipcode(zipcode);
		m.setAddress1(address1);
		m.setAddress2(address2);
		m.setMarketing(marketing);
	
		memberService.updateMember(m);
		
		return "redirect:main";
	}
	
	// 비밀번호 체크
	@RequestMapping(value="isPass", method=RequestMethod.POST)
	@ResponseBody
	public boolean isPass(String id, String pass) {
		boolean isPass = memberService.isLogin(id, pass);
		return isPass;
	}
	
	
}
