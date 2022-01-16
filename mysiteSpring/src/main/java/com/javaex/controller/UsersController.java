package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.javaex.dao.UsersDao;

import com.javaex.vo.UsersVo;


@Controller
public class UsersController {
	
	@Autowired
	UsersDao usersDao;			
	@RequestMapping("/userloginform")
	public ModelAndView loginform(ModelAndView mav) {
		System.out.println(">>> "+this.getClass()+ " user호출됨!");
		//mav.addObject("user");
		mav.setViewName("/WEB-INF/views/user/loginform.jsp");		
		return mav;
	}
					
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(@ModelAttribute UsersVo vo) {
		System.out.println("update");
		System.out.println(vo.toString());
		usersDao.update(vo);		
		return "/WEB-INF/views/main/index.jsp";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@ModelAttribute UsersVo vo) {
		System.out.println("login");
		//susersDao.getUser(vo);
		return "/WEB-INF/views/main/index.jsp";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(@ModelAttribute UsersVo vo) {
		System.out.println("update");
		System.out.println(vo.toString());
		usersDao.update(vo);		
		return "/WEB-INF/views/main/index.jsp";
	}
	
	
	

}
