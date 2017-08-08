package com.sp.bbs;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;

//@Controller : Spring MVC 컨트롤러
/*
* - 의존관계 설정 바법
*   1. 타입에 의한 의존관계 자동 설정
*       @Autowired
*   2. 동일한 타입이 둘 이상인 경우
*       1) 방법 1
*           @Autowired
*           @Qualifier("bbs.boardService")
*       2) 방법 2
*           @Resource(name="bbs.boardService")
*           
*  - @RequestMapping
*       MultiActionController와 같이 한 개의 컨트롤러에서 다수의 요청을 처리.
*      @RequestMapping의 value 형태의 url이 들어오면 해당 method를 호출      
*/

@Controller("bbs.boardController")
public class BoardController {
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value="/bbs/list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue=URLDecoder.decode(searchValue, "UTF-8");
		}
		
		int numPerPage=10;
		int dataCount, total_page;
		Map<String, Object> map=new HashMap<>();
		
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		// 데이터 개수
		dataCount=service.dataCount(map);
		
		// 전체 페이지 수
		total_page=myUtil.pageCount(numPerPage, dataCount);
		
		if(current_page>total_page)
			current_page=total_page;
		
		int start=(current_page-1)*numPerPage+1;
		int end=current_page*numPerPage;
		
		map.put("start", start);
		map.put("end", end);
		
		// 해당 페이지 게시물 가져 오기
		List<Board> list=service.listBoard(map);
		
		// 글번호 만들기
		int listNum, n=0;
		Iterator<Board> it=list.iterator();
		while(it.hasNext()) {
			Board data=it.next();
			listNum=dataCount-(start+n-1);
			data.setListNum(listNum);
			n++;
		}
		
		String cp=req.getContextPath();
		String listUrl=cp+"/bbs/list";
		String articleUrl=cp+"/bbs/article?page="+current_page;
		
		String params="";
		if(searchValue.length()!=0) {
			params="searchKey="+searchKey;
			params+="&searchValue="+
			    URLEncoder.encode(searchValue, "UTF-8");
		}
		
		if(params.length()!=0) {
			listUrl=listUrl+"?"+params;
			articleUrl=articleUrl+"&"+params;
		}
		
		String paging=myUtil.paging(current_page,
				total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("paging", paging);	
		
		return "bbs/list";
	}
	
/*
   // ModelAndView를 리턴하는 경우
	@RequestMapping(value="/bbs/list")
	public ModelAndView list(HttpServletRequest req,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue
			) throws Exception {
          
		// 소스는 위와 동일

        ModelAndView mav=new ModelAndView("bbs/list");
        mav.addObject("list", list);
        mav.addObject("articleUrl", articleUrl);
        mav.addObject("page", current_page);
        mav.addObject("dataCount", dataCount);
        mav.addObject("paging", paging);
		
        return mav;
    }
*/

	@RequestMapping(value="/bbs/created", method=RequestMethod.GET)
	public String createdForm(
			Model model
			) throws Exception {
		
		model.addAttribute("mode", "created");
		return "bbs/created";
	}
	
	@RequestMapping(value="/bbs/created", method=RequestMethod.POST)
	public String createdSubmit(Board dto,
			HttpServletRequest req
			) throws Exception {
		
		dto.setIpAddr(req.getRemoteAddr());
		
		service.insertBoard(dto);
		
		return "redirect:/bbs/list";
	}
	
	@RequestMapping(value="/bbs/article")
	public String article(
			@RequestParam int num,
			@RequestParam int page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model
			) throws Exception {
		
		searchValue=URLDecoder.decode(searchValue, "UTF-8");
		
		service.updateHitCount(num);
		
		Board dto=service.readBoard(num);
		if(dto==null) {
			return "redirect:/bbs/list?page="+page;
		}
		
		int linesu=dto.getContent().split("\n").length;
		
		// dto.setContent(dto.getContent().replaceAll("\n", "<br>")); // css로 처리
		
		Map<String, Object> map=new HashMap<>();
		map.put("num", num);
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		Board preReadDto=service.preReadBoard(map);
		Board nextReadDto=service.nextReadBoard(map);
		
		String params="page="+page;
		if(searchValue.length()!=0) {
			params+="&searchKey="+searchKey;
			params+="&searchValue="
			   +URLDecoder.decode(searchValue, "UTF-8");
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("linesu", linesu);
		model.addAttribute("page", page);
		model.addAttribute("params", params);
		
		return "bbs/article";
	}
	
	@RequestMapping(value="/bbs/update", 
            method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int num,
			@RequestParam String page,
			Model model
			) throws Exception {

		Board dto = service.readBoard(num);
		if(dto==null) {
			return "redirect:/bbs/list?page="+page;
		}

		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);

		return "bbs/created";
	}
	
	@RequestMapping(value="/bbs/update", 
			       method=RequestMethod.POST)
	public String updateSubmit(
			Board dto,
			@RequestParam String page
			) throws Exception {
		
		service.updateBoard(dto);
		
		return "redirect:/bbs/list?page="+page;
	}
	
	@RequestMapping(value="/bbs/delete")
	public String delete(
			@RequestParam int num,
			@RequestParam String page,
			Model model
			) throws Exception {
		
		service.deleteBoard(num);
		
		return "redirect:/bbs/list?page="+page;
	}
}
