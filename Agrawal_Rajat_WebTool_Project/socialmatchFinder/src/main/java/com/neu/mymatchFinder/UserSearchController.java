package com.neu.mymatchFinder;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neu.mymatchFinder.dao.ContactsDAO;
import com.neu.mymatchFinder.dao.UsersDAO;
import com.neu.mymatchFinder.pojo.Contacts;
import com.neu.mymatchFinder.pojo.UserAccount;

@Controller
public class UserSearchController {

	private static final Logger logger = LoggerFactory.getLogger(UserLoginController.class);

	@Autowired
	private UsersDAO usersDAO;

	@Autowired
	private ContactsDAO contactsDao;

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public @ResponseBody String search(@RequestParam("search") String value, HttpServletRequest request) {
		if (value != null || !value.isEmpty()) {
			HttpSession session = request.getSession();
			UserAccount user = (UserAccount) session.getAttribute("user");
			ArrayList<Contacts> contactList = contactsDao.getCRequests(user);
			String html = usersDAO.searchAll(user, value, contactList);
			return html;
		}

		return " ";
	}
	
	@RequestMapping(value = "/searchAllUsers", method = RequestMethod.GET)
	public @ResponseBody String searchAllProfile(@ModelAttribute("userAccount") UserAccount userAccount, ModelMap model,
			BindingResult result, HttpServletRequest request,HttpServletResponse response, HttpSession session) throws Exception {		
				
			session = request.getSession();
			String gender =request.getParameter("gender");			
			String country= request.getParameter("country");
			String city= request.getParameter("city");			
			UserAccount u = (UserAccount) session.getAttribute("user");	
			ArrayList<Contacts> contactList = contactsDao.getCRequests(u);
			String html = usersDAO.searchAllUsers(u,gender,country,city, contactList);
			return html;
	}
}

	


	
