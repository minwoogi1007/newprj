package com.newprj.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/")
public class HomeController {
	

	@RequestMapping("index")
	public String index() {
		
		//return "hello Index 1";
		return "root.index";
	}
	

	@RequestMapping("help")
	public void help() {
		
	}
	
	/*
	 * @Override public ModelAndView handleRequest(HttpServletRequest arg0,
	 * HttpServletResponse arg1) throws Exception { // TODO Auto-generated method
	 * stub
	 * 
	 * ModelAndView mv = new ModelAndView("root.index");
	 * mv.addObject("data","Hello Spring MVC~");
	 * //mv.setViewName("/WEB-INF/view/index.jsp"); return mv; }
	 */
	
}
