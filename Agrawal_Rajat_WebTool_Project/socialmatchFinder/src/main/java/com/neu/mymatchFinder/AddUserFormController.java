package com.neu.mymatchFinder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.neu.mymatchFinder.dao.UsersDAO;
import com.neu.mymatchFinder.pojo.UserAccount;


@Controller
@RequestMapping("/adduser.htm")
public class AddUserFormController {
	
	@Autowired
	@Qualifier("userValidator")
	UserValidator validator;

	@Autowired
	private UsersDAO userDao;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}	

	@RequestMapping(value = "/adduser.htm", method = RequestMethod.POST)
	protected String doSubmitAction(@ModelAttribute("userAccount") UserAccount userAccount, ModelMap model,
			BindingResult result, HttpServletRequest request, HttpSession session) throws Exception {

		try {
			userDao.create(userAccount);
			session = request.getSession();
			session.setAttribute("userstable", userAccount);
			session.setAttribute("success", "UserAccount Created Successfully");
			return "login";
		} catch (Exception e) {
			System.out.println("Exception: " + e.getMessage());
		}
		session.setAttribute("error", "UserAccount Not Created");
		return "login";
	}
	
	@RequestMapping(value = "/adduser.htm", method = RequestMethod.GET)
	public String initializeForm(@ModelAttribute("userAccount") UserAccount userAccount, BindingResult result) {

		return "addUserForm";
	}

}
