package com.neu.mymatchFinder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.neu.mymatchFinder.pojo.UserAccount;

@Controller
public class HTTPErrorHandler{
 
@RequestMapping(value="/error")
 public String error400(@ModelAttribute("userAccount") UserAccount userAccount, ModelMap model,
			BindingResult result, HttpServletRequest request, HttpSession session){
  System.out.println("custom error handler");
  UserAccount ua=new UserAccount();
  UserAccount user =new UserAccount(); 
  model.addAttribute("user",ua);
  model.addAttribute("user",user);  
  return "login";
 }
  
 
  
  
}
