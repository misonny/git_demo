package com.webrage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.mvc.BaseCommandController;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

	@RequestMapping("/redict")
	public ModelAndView redirect(){
		ModelAndView view=new ModelAndView();
		view.setViewName("redirect:jsp/demo1");
		return view;
	}
	
}
