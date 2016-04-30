package com.neu.mymatchFinder;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.neu.mymatchFinder.dao.UsersDAO;
import com.neu.mymatchFinder.pojo.UserAccount;

@RequestMapping(value ="/deleteUser")
@Controller
public class DeleteUserFormController
{
	@Autowired
	UsersDAO usersDao;		
	
	@RequestMapping(method = RequestMethod.POST)
    protected String deleteUser(@ModelAttribute("user")UserAccount user,BindingResult result,HttpSession session,HttpServletRequest request,HttpServletResponse response) throws Exception
    {	
		System.out.println("In USer delete");
		
		if(result.hasErrors())
		{
			return "deleteUser";
		}
		
        String us = request.getParameter("uid");
        usersDao.deleteUser(user, Integer.parseInt(us));      
		response.getWriter().println("success");
        return "deleteUser";
    }
	
	
	@RequestMapping(method = RequestMethod.GET)
    protected String deleteUsers(Model model,HttpSession session,HttpServletResponse response) throws Exception
    {
		System.out.println("In USer delete");		
		UserAccount user = (UserAccount) session.getAttribute("user");
		ArrayList<UserAccount> uList = usersDao.getAllUser(user);
		session.setAttribute("uList", uList);
		model.addAttribute("u", uList);
		return "deleteUser";
		
    }
    
	
}