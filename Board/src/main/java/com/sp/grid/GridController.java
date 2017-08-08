package com.sp.grid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("bbs.gridController")
public class GridController {

	@RequestMapping(value="/grid/list", method=RequestMethod.GET)
	public String createdForm(
			Model model
			) throws Exception {
		
		return "grid/list";
	}
}
