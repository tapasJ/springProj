package com.sp.bbs;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.common.MyUtil;

@Controller("bbs.boardController")
public class BoardController {
	@Autowired
	private BoardService service;
	
	@Autowired
	private MyUtil myUtil;
	
	//@RequestMapping 어노테이션을 사용할 경우, MultiActionController와 같이 한 개의 컨트롤러에서 다수의 요청을 처리.
	//@RequestMapping의 value형태의 url이 들어오면 해당 method를 호출한다.
	
	@RequestMapping(value="/bbs/created",method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception {
		model.addAttribute("mode","created");
		return "bbs/created";
	}
	@RequestMapping(value="/bbs/created", method=RequestMethod.POST)
	public String createdSubmit(Board dto, HttpServletRequest req)throws Exception{
		
		dto.setIpAddr(req.getRemoteAddr());		
		int result = service.insertBoard(dto);	
		System.out.println("결과 는"+result);
		return "redirect:/bbs/created";
	}
		
}