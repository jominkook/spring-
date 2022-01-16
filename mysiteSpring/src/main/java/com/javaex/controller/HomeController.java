package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
  @RequestMapping("/hello")
  public ModelAndView hello(@RequestParam String name) {
    ModelAndView mav = new ModelAndView(); 
    
    mav.addObject( "message", "안녕 " + name );
    //mav.setViewName( "index" );
    mav.setViewName( "/WEB-INF/views/index.jsp" );
    
    
    System.out.println("1>>> "+this.getClass()+ " 호출됨!");
    System.out.println(mav.getViewName() + " ...");
    
    return mav;
  }
  
  @RequestMapping("/hello2")
  public ModelAndView hello2(@RequestParam(required=false, defaultValue="SPRING" )String name) { 
    ModelAndView mav = new ModelAndView(); 
    
    mav.addObject( "message", "Hello " + name );
    mav.setViewName( "/WEB-INF/views/hello.jsp" );
    
    System.out.println("1>>> "+this.getClass()+ " 호출됨!");
    System.out.println(mav.getViewName() + " ...");
    
    return mav;
  }
  
}
