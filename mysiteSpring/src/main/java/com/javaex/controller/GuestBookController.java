package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.javaex.dao.GuestBookDao;
import com.javaex.vo.GuestBookVo;

@Controller
public class GuestBookController {

	@Autowired
	GuestBookDao GuestBookDao;
	@RequestMapping("/getguestbooklist")
	public ModelAndView getguestbooklist(ModelAndView mav) {
		System.out.println(">>> "+this.getClass()+ " 호출됨!");		
		mav.addObject("guestbooklist", GuestBookDao.getlist());
		mav.setViewName("/WEB-INF/views/guestbook/list.jsp");
		
		return mav;
	}
	
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(@ModelAttribute GuestBookVo vo) {
		System.out.println("insert");
		System.out.println(vo.toString());
		GuestBookDao.insert(vo);		
		return "redirect:/getguestbooklist";
	}
	
	@RequestMapping(value="/deleteform", method=RequestMethod.GET)
	public String deleteform() {
		System.out.println("deleteform");		
		return "/WEB-INF/views/guestbook/deleteform.jsp";
	}
		
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(@ModelAttribute GuestBookVo vo) {
		System.out.println("delete");
		System.out.println(vo.toString());
		GuestBookDao.delete(vo);		
		return "redirect:/getguestbooklist";
	}
}

